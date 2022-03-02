import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/src/features/data/models/post_model.dart';
import 'package:test_app/src/features/domain/entities/post.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource {
  List<User> getUsers();
  List<Post> getPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl();
  final scheme = 'https';
  final host = 'jsonplaceholder.typicode.com';
  @override
  List<Post> getPosts() {
    final result = [
      {
        "userId": 1,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 2,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 3,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 4,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 5,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 1,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      },
      {
        "userId": 4,
        "id": 26,
        "title": "est et quae odit qui non",
        "body": "similique esse doloribus nihil ..."
      }
    ];
    return List.from(result.map((post) => PostModel.fromJson(post)))
        .toList()
        .cast();
  }

  @override
  List<User> getUsers() {
    final result = [
      {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "avatar": {
          'thumbnail': 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        }
      },
      {
        "id": 2,
        "username": "Toxic",
        "avatar": {
          'thumbnail': 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        }
      },
      {
        "id": 3,
        "username": "Bishop",
        "avatar": {
          'thumbnail': 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        }
      },
      {
        "id": 4,
        "username": "Protector",
        "avatar": {
          'thumbnail': 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        }
      },
      {
        "id": 5,
        "username": "Johns",
        "avatar": {
          'thumbnail': 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        }
      }
    ];
    return List.from(result.map((user) => UserModel.fromJson(user)))
        .toList()
        .cast();
  }
}

final remoteDataSource = Provider((ref) => const RemoteDataSourceImpl());
