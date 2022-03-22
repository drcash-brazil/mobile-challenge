class UserModel {
  int? userId;
  String? token;

  UserModel({
    required this.userId,
    required this.token
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'token': token
    };
  }
} 