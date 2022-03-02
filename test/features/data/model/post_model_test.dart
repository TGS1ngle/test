import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/src/features/data/models/post_model.dart';

void main() {
  test(
      'verify that when [PostModel.fromJson is called it returns a proper dart object]',
      () {
    final json = {
      "userId": 3,
      "id": 26,
      "title": "est et quae odit qui non",
      "body": "similique esse doloribus nihil ..."
    };

    final post = PostModel.fromJson(json);
    const expectedPost = PostModel(
      userId: 3,
      id: 26,
      title: "est et quae odit qui non",
      description: "similique esse doloribus nihil ...",
    );
    expect(post, expectedPost);
  });
}
