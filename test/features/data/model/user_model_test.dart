import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/src/features/data/models/user_model.dart';

void main() {
  test(
      'verify that when [User.fromJson is called it returns a proper dart object]',
      () {
    final json = {
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
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered...",
        "bs": "harness real-time e-markets"
      }
    };
    final user = UserModel.fromJson(json);
    final expectedUser =
        UserModel(id: 1, username: 'Bret', avatar: '.../thumb/women/71.jpg');

    expect(user, expectedUser);
  });
}
