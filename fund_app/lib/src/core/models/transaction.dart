class Transaction {
  final int fundId;
  final String fundName;
  final String fundType;
  final double amount;
  final String type;
  final DateTime date;

  Transaction({
    required this.fundId,
    required this.fundName,
    required this.fundType,
    required this.amount,
    required this.type,
    required this.date,
  });
}
