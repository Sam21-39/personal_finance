class ExpenseModel {
  String? categoryId;
  double? amount;
  String? description;

  ExpenseModel({this.categoryId, this.amount, this.description});

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        categoryId: json["categoryId"],
        amount: json["amount"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'amount': amount,
      'description': description,
    };
  }
}
