part of 'funds_bloc.dart';

class FundsEvent {}

class LoadFunds extends FundsEvent {}

class LoadTransactions extends FundsEvent {}

class SubscribeFund extends FundsEvent {
  final Fund fund;

  SubscribeFund(this.fund);
}

class SendNotification extends FundsEvent {
  final String fund;

  SendNotification(this.fund);
}
