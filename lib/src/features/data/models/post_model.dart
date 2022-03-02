import 'package:test_app/src/features/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required int id, required int userId, required String title, required String description})
      : super(id: id, userId: userId, title: title, description: description);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['body'],
    );
  }
}
