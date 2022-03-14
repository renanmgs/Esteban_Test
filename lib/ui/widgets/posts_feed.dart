import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../blocs/feed_bloc.dart';
import '../../models/post_model.dart';
import '../widgets/post_card.dart';

class PostsFeed extends StatelessWidget {
  final ScrollController scrollController;

  const PostsFeed({Key? key, required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: bloc.allPosts,
        builder: (context, AsyncSnapshot<PostsFeedModel> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.fromLTRB(
                10.sp,
                0,
                10.sp,
                10.sp,
              ),
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.zero,
                itemCount: snapshot.data?.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(
                    userId: snapshot.data?.posts[index].userId,
                    userName: snapshot.data?.posts[index].userName,
                    timestamp: snapshot.data?.posts[index].timestamp,
                    profileImageUrl: snapshot.data?.posts[index].profileImageUrl,
                    textContent: snapshot.data?.posts[index].textContent,
                    likes: snapshot.data?.posts[index].likes,
                    comments: snapshot.data?.posts[index].comments,
                    shares: snapshot.data?.posts[index].shares,
                    postIndex: index,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text("Loading Feed"),
            ],
          );
        },
      ),
    );
  }
}
