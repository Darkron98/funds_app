class Fund {
  final int id;
  final String name;
  final double minAmount;
  final String category;

  Fund({
    required this.id,
    required this.name,
    required this.minAmount,
    required this.category,
  });

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      id: json['id'],
      name: json['name'],
      minAmount: json['minAmount'],
      category: json['category'],
    );
  }
}
