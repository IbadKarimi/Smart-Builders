class DataModel {
  late final String material;
  late final DateTime date;
  late final double amount;

  DataModel({required this.material, required this.date, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'material': material,
      'date': date.toIso8601String(),
      'amount': amount,
    };
  }
}