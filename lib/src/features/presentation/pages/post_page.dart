import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/src/features/data/repositories/post_repository.dart';
import '../../data/repositories/user_repository.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 65,
        elevation: 1,
        title: const Text(
          'Posts',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 15),
        child: ListView.separated(
            itemBuilder: ((context, index) {
              final posts = ref.read(postRepository).getPosts();
              final user = ref
                  .read(userRepository)
                  .getUsers()
                  .firstWhere((user) => user.id == posts[index].userId);
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: NetworkImage(user.avatar)),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        user.username,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    posts[index].title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    posts[index].description,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              );
            }),
            separatorBuilder: (_, __) => const SizedBox(
                  height: 15,
                ),
            itemCount: ref.read(postRepository).getPosts().length),
      ),
    );
  }
}
