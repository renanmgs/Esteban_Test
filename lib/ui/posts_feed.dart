import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/ui/post_card.dart';

import '../blocs/feed_bloc.dart';
import '../models/post_model.dart';

class PostsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: bloc.allPosts,
        builder: (context, AsyncSnapshot<PostsFeedModel> snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.all(10.sp),
              child: ListView.builder(
                itemCount: snapshot.data?.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(
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
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
