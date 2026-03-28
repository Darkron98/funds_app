class Transaction {
  final int fundId;
  final double amount;
  final String type; // subscribe / cancel
  final DateTime date;

  Transaction({
    required this.fundId,
    required this.amount,
    required this.type,
    required this.date,
  });
}
