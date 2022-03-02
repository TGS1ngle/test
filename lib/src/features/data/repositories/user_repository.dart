import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/src/features/domain/entities/user.dart';
import 'package:test_app/src/features/domain/repositories/user_repository.dart';
import '../datasources/remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource dataSource;
  const UserRepositoryImpl({required this.dataSource});
  @override
  List<User> getUsers() {
    return dataSource.getUsers();
  }
}

final userRepository = Provider<UserRepositoryImpl>((ref) {
  final remoteDataSourceProvider = ref.read(remoteDataSource);
  return UserRepositoryImpl(
    dataSource: remoteDataSourceProvider,
  );
});