part of 'funds_bloc.dart';

class FundsState {
  final double balance;
  final List<Fund> funds;
  final List<Transaction> transactions;

  final String? error;
  final bool? isLoading;

  FundsState({
    required this.balance,
    required this.funds,
    required this.transactions,
    this.error,
    this.isLoading,
  });

  factory FundsState.initial() {
    return FundsState(
      balance: 500000,
      funds: [],
      transactions: [],
    );
  }

  FundsState copyWith({
    double? balance,
    List<Fund>? funds,
    List<Transaction>? transactions,
    String? error,
    bool? isLoading,
  }) {
    return FundsState(
      balance: balance ?? this.balance,
      funds: funds ?? this.funds,
      transactions: transactions ?? this.transactions,
      error: error,
      isLoading: isLoading,
    );
  }
}
