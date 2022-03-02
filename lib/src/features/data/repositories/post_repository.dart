import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/src/features/data/datasources/remote_datasource.dart';
import 'package:test_app/src/features/domain/entities/post.dart';

import '../../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource dataSource;
  const PostRepositoryImpl({required this.dataSource});
  @override
  List<Post> getPosts() {
    return dataSource.getPosts();
  }
}

final postRepository = Provider<PostRepositoryImpl>((ref) {
  final remoteDataSourceProvider = ref.read(remoteDataSource);
  return PostRepositoryImpl(
    dataSource: remoteDataSourceProvider,
  );
});
