import 'package:bloc/bloc.dart';

import '../../../core/models/models.dart';
import '../data/fund_mock_api.dart';

part 'funds_event.dart';
part 'funds_state.dart';

/// Bloc encargado de gestionar el estado de los fondos y transacciones.
///
/// Eventos:
/// - Cargar fondos disponibles
/// - Cargar historial de transacciones
/// - Gestionar suscripciones y cancelaciones
/// - Simular envío de notificaciones
class FundsBloc extends Bloc<FundsEvent, FundsState> {
  final api = FundsApiMock();
  FundsBloc() : super(FundsState.initial()) {
    /// Evento LoadFounds
    ///
    /// Carga la lista de fondos disponibles.
    /// Maneja estado de loading y posibles errores.
    on<LoadFunds>((event, emit) async {
      emit(state.copyWith(
        isFundsLoading: true,
      ));

      try {
        final funds = await api.getFunds();

        emit(state.copyWith(
          funds: funds,
          isFundsLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          error: "Error loading funds",
          isFundsLoading: false,
        ));
      }
    });

    /// Evento LoadTransactions
    ///
    /// Obtiene el historial de transacciones del usuario.
    on<LoadTransactions>((event, emit) async {
      emit(state.copyWith(isHistoryLoading: true));

      try {
        final transactions = await api.getTransactions();

        emit(state.copyWith(
          transactions: transactions,
          isHistoryLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          error: "Error loading transactions",
          isHistoryLoading: false,
        ));
      }
    });

    /// SubscribeFund
    ///
    /// Maneja la logica de suscripción y cancelación de fondos.
    ///
    /// Flujo:
    /// 1. Determina si es suscripcion o cancelacion
    /// 2. Valida saldo disponible (solo para suscripcion)
    /// 3. Actualiza el estado del fondo
    /// 4. Registra la transacción
    /// 5. Actualiza balance y lista de transacciones
    on<SubscribeFund>((event, emit) async {
      try {
        emit(state.copyWith(isFundsLoading: true, selectedFund: event.fund.id));
        final isSubscribing = !event.fund.subscribed;

        if (isSubscribing && state.balance < event.fund.minAmount) {
          emit(state.copyWith(
              error: "Saldo insuficiente", transactionComplete: true));
          emit(state.copyWith(error: null, transactionComplete: false));
          return;
        }

        await Future.wait([
          api.updateSubscription(
            id: event.fund.id,
            subscribed: isSubscribing,
          ),
          api.insertTransaction(
            Transaction(
              fundId: event.fund.id,
              fundName: event.fund.name,
              fundType: event.fund.category,
              amount: event.fund.minAmount,
              type: isSubscribing ? 'Suscripcion' : 'Cancelacion',
              date: DateTime.now(),
            ),
          ),
        ]);

        final transactions = await api.getTransactions();

        final newBalance = isSubscribing
            ? state.balance - event.fund.minAmount
            : state.balance + event.fund.minAmount;
        emit(state.copyWith(transactionComplete: true));

        emit(state.copyWith(
          balance: newBalance,
          transactions: transactions,
          selectedFund: 0,
          error: null,
          isFundsLoading: false,
          transactionComplete: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          selectedFund: 0,
          error: "Error en la operación",
          isFundsLoading: false,
        ));
      }
    });

    /// Evento SendNotification
    ///
    /// Simula el envío de una notificación.
    ///
    /// Flujo:
    /// 1. Activa estado de loading
    /// 2. Simula latencia
    /// 3. Emite mensaje de éxito o error
    on<SendNotification>((event, emit) async {
      try {
        emit(state.copyWith(
          isSendingNotification: true,
          successMessage: null,
          error: null,
        ));

        await Future.delayed(const Duration(seconds: 2));

        emit(state.copyWith(
          isSendingNotification: false,
          successMessage: 'Notificación enviada a ${event.fund}',
        ));
      } catch (e) {
        emit(state.copyWith(
          isSendingNotification: false,
          error: 'Error enviando notificación',
        ));
      }
    });
  }
}
