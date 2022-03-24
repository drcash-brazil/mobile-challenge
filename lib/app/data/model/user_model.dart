class UserModel {
  int? userId;
  String? accessToken;

  UserModel({
    required this.userId,
    required this.accessToken
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'accessToken': accessToken
    };
  }
} 