import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String avatar;
  const User({required this.id, required this.username, required this.avatar});

  @override
  List<Object?> get props => [id, username, avatar];
}
