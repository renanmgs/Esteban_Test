import 'dart:async';
import 'package:flutter/services.dart';
import 'package:upworkestebantest/models/user_model.dart';
import 'dart:convert';
import '../models/post_model.dart';

class MyAPI {
  late PostsFeedModel _loadedFeed;

  Future<UserModel> logIn(String userId) async {
    //Just simulatin passim some param and getting the user
    print("loggin user");

    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    UserModel user = UserModel.fromJson(data[userId]);

    await Future.delayed(Duration(seconds: 1));
    return user;
  }

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
