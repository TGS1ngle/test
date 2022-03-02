import 'package:test_app/src/features/domain/entities/post.dart';

abstract class PostRepository {
  List<Post> getPosts();
}