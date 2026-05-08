class Modelclass {
  String? id;
  String itemName;
  double amount;
  String date;
  bool isExpense;

  Modelclass({
    this.id,
    required this.itemName,
    required this.amount,
    required this.date,
    required this.isExpense,
  });
}