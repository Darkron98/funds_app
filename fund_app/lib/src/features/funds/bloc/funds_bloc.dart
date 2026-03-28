import 'package:bloc/bloc.dart';

import '../../../core/models/models.dart';
import '../data/fund_mock_api.dart';

part 'funds_event.dart';
part 'funds_state.dart';

class FundsBloc extends Bloc<FundsEvent, FundsState> {
  final api = FundsApiMock();
  FundsBloc() : super(FundsState.initial()) {
    on<LoadFunds>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        final funds = await api.getFunds();

        emit(state.copyWith(
          funds: funds,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          error: "Error loading funds",
          isLoading: false,
        ));
      }
    });

    on<SubscribeFund>((event, emit) {
      if (state.balance < event.amount) {
        emit(state.copyWith(error: "Saldo insuficiente"));
        return;
      }

      final updatedBalance = state.balance - event.amount;

      final updatedTransactions = [
        ...state.transactions,
        Transaction(
          fundId: event.fund.id,
          amount: event.amount,
          type: "subscribe",
          date: DateTime.now(),
        )
      ];

      emit(state.copyWith(
        balance: updatedBalance,
        transactions: updatedTransactions,
        error: null,
      ));
    });
    on<CancelFund>((event, emit) {
      final updatedBalance = state.balance + event.amount;

      final updatedTransactions = [
        ...state.transactions,
        Transaction(
          fundId: event.fund.id,
          amount: event.amount,
          type: "cancel",
          date: DateTime.now(),
        )
      ];

      emit(state.copyWith(
        balance: updatedBalance,
        transactions: updatedTransactions,
      ));
    });
  }
}
