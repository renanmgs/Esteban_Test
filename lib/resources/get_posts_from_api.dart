import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/post_model.dart';

class GetPostsFromAPI {
  late PostsFeedModel _loadedFeed;

  Future<PostsFeedModel> fetchPostsList() async {
    print("getting posts");

    PostsFeedModel feed;
    final String response = await rootBundle.loadString('assets/posts.json');
    final data = await json.decode(response);
    feed = PostsFeedModel.fromJson(data);

    await Future.delayed(Duration(seconds: 3));
    _loadedFeed = feed;
    return feed;
  }

  Future<PostsFeedModel> addPost(PostModel post) async {
    print("adding post");
    _loadedFeed.posts.insert(0, post);

    return _loadedFeed;
  }

  Future<PostsFeedModel> deletePost(int index) async {
    print("deleting post");
    _loadedFeed.posts.removeAt(index);

    return _loadedFeed;
  }
}
