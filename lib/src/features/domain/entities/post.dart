import 'package:equatable/equatable.dart';

class Post extends Equatable{
  final int id;
  final int userId;
  final String title;
  final String description;

  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, userId, title, description];

}
