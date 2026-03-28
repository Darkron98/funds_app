part of 'funds_bloc.dart';

class FundsEvent {}

class LoadFunds extends FundsEvent {}

class SubscribeFund extends FundsEvent {
  final Fund fund;
  final double amount;

  SubscribeFund(this.fund, this.amount);
}

class CancelFund extends FundsEvent {
  final Fund fund;
  final double amount;

  CancelFund(this.fund, this.amount);
}
