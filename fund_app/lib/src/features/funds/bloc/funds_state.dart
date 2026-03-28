part of 'funds_bloc.dart';

class FundsState {
  final double balance;
  final List<Fund> funds;
  final List<Transaction> transactions;

  final String? error;

  final bool? isHistoryLoading;
  final bool? isFundsLoading;
  final int? selectedFund;
  final bool? transactionComplete;

  final bool? isSendingNotification;
  final String? successMessage;

  FundsState({
    required this.balance,
    required this.funds,
    required this.transactions,
    this.error,
    this.isHistoryLoading,
    this.isFundsLoading,
    this.selectedFund,
    this.transactionComplete,
    this.isSendingNotification,
    this.successMessage,
  });

  factory FundsState.initial() {
    return FundsState(
      balance: 500000,
      funds: [],
      transactions: [],
    );
  }

  FundsState copyWith(
      {double? balance,
      List<Fund>? funds,
      List<Transaction>? transactions,
      String? error,
      bool? isHistoryLoading,
      bool? isFundsLoading,
      int? selectedFund,
      bool? transactionComplete,
      bool? isSendingNotification,
      String? successMessage}) {
    return FundsState(
      balance: balance ?? this.balance,
      funds: funds ?? this.funds,
      transactions: transactions ?? this.transactions,
      error: error,
      isHistoryLoading: isHistoryLoading,
      isFundsLoading: isFundsLoading,
      selectedFund: selectedFund,
      transactionComplete: transactionComplete,
      isSendingNotification: isSendingNotification,
      successMessage: successMessage,
    );
  }
}
