import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/src/features/data/datasources/remote_datasource.dart';
import 'package:test_app/src/features/domain/entities/post.dart';
import 'package:test_app/src/features/domain/entities/user.dart';


void main() {
  const scheme = 'https';
  const host = 'jsonplaceholder.typicode.com';
  group('get user', () {
    const remoteDataSource = RemoteDataSourceImpl();
    final response = http.Response('''[
            {
        "id": 1,
        "avatar": {
            "large": ".../women/71.jpg",
            "medium": ".../med/women/71.jpg",
            "thumbnail": ".../thumb/women/71.jpg"
        },
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
            }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered...",
            "bs": "harness real-time e-markets"
        }
    }
          ]''', 200);
    test(
        'when [RemoteDatatSourceImp.getUser] verify a call to http.Client.get',
        () {
      remoteDataSource.getPosts();
    });
    test(
        'when [RemoteDatatSourceImp.getPost] is called verify that normal data is return]',
        () async {
      final List<User> users = await remoteDataSource.getUsers();
      expect(users.length, 5);
    });
  });




  group('get post', () {
    final remoteDataSource = RemoteDataSourceImpl();
    final response = http.Response('''[
            {
              "userId": 3,
              "id": 26,
              "title": "est et quae odit qui non",
              "body": "similique esse doloribus nihil ..."
            }
          ]''', 200);
    test(
        'when [RemoteDatatSourceImp.getUsers] verify a call to http.Client.get',
        () {
      remoteDataSource.getPosts();
      // when(() => httpClientMock.get(
      //     Uri(
      //       scheme: scheme,
      //       host: host,
      //       path: 'post',
      //     ),
      //   )).thenAnswer((_) async => response);
        
      // verify(() => httpClientMock.get(Uri(
      //       scheme: scheme,
      //       host: host,
      //       path: 'posts',
      //     )));
    });
    test(
        'when [RemoteDatatSourceImp.getPost] is called verify that normal data is return]',
        () async {
      final List<Post> posts = await remoteDataSource.getPosts();
      expect(posts.length, 7);
    });
  });
}
