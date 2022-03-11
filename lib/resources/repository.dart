import 'dart:async';
import '../models/post_model.dart';
import 'get_posts_from_api.dart';

class Repository {
  final postsApiProvider = GetPostsFromAPI();

  Future<PostsFeedModel> fetchAllPosts() => postsApiProvider.fetchPostsList();
  Future<PostsFeedModel> addPost(post) => postsApiProvider.addPost(post);
  Future<PostsFeedModel> deletePost(index) => postsApiProvider.deletePost(index);
}
