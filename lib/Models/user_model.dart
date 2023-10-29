class UserModel {
  String? userName;
  double? budget;
  String? userId;

  UserModel({this.userId, this.budget, this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        budget: json["budget"],
        userName: json["name"],
      );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'budget': budget,
      'name': userName,
    };
  }
}
