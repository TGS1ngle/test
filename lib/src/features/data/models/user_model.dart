import 'package:test_app/src/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required int id, required String username, required String avatar})
      : super(id: id, username: username, avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      avatar: json['avatar']['thumbnail'],
    );
  }
}
