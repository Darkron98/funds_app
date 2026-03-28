class Fund {
  final int id;
  final String name;
  final double minAmount;
  final String category;
  final bool subscribed;

  Fund(
      {required this.id,
      required this.name,
      required this.minAmount,
      required this.category,
      required this.subscribed});

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      id: json['id'],
      name: json['name'],
      minAmount: json['minAmount'],
      category: json['category'],
      subscribed: json['subscribed'],
    );
  }

  Fund copyWith({
    int? id,
    String? name,
    double? minAmount,
    String? category,
    bool? subscribed,
  }) {
    return Fund(
      id: id ?? this.id,
      name: name ?? this.name,
      minAmount: minAmount ?? this.minAmount,
      category: category ?? this.category,
      subscribed: subscribed ?? this.subscribed,
    );
  }
}
