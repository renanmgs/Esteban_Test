import 'dart:async';
import 'package:upworkestebantest/models/user_model.dart';

import '../models/post_model.dart';
import 'my_api.dart';

class Repository {
  final apiProvider = MyAPI();

  Future<UserModel> logIn(id) => apiProvider.logIn(id);
  Future<PostsFeedModel> fetchAllPosts() => apiProvider.fetchPostsList();
  Future<PostsFeedModel> addPost(post) => apiProvider.addPost(post);
  Future<PostsFeedModel> deletePost(index) => apiProvider.deletePost(index);
}
