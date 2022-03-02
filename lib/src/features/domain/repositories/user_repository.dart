import 'package:test_app/src/features/domain/entities/user.dart';

abstract class UserRepository {
  List<User> getUsers();
}