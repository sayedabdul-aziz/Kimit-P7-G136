import 'package:flutter/material.dart';
import 'package:posts_api_26_12/api_services.dart';
import 'package:posts_api_26_12/post_model/post_model.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late Future<List<PostModel>?> posts;
  @override
  void initState() {
    super.initState();
    posts = ApiServices.getPostsByDio();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var post = snapshot.data![index];
                    return ListTile(
                      leading: Text(post.id.toString()),
                      title: Text(post.title.toString()),
                      subtitle: Text(post.body.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text(snapshot.data.toString()),
              );
            }
          },
        ),
      ),
    );
  }
}
