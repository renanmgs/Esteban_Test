class PostsFeedModel {
  List<PostModel> _posts = [];
  PostsFeedModel.fromJson(Map<String, dynamic> parsedJson) {
    List<PostModel> temp = [];
    for (int i = 0; i < parsedJson['posts'].length; i++) {
      PostModel result = PostModel(parsedJson['posts'][i]);
      temp.add(result);
    }
    _posts = temp;
  }
  List<PostModel> get posts => _posts;
}

class PostModel {
  late String _userName;
  late String _timestamp;
  late String _profileImageUrl;
  late String _textContent;
  late int _likes;
  late int _comments;
  late int _shares;

  PostModel(postmodel) {
    _userName = postmodel['userName'];
    _timestamp = postmodel['timestamp'];
    _profileImageUrl = postmodel['profileImageUrl'];
    _textContent = postmodel['textContent'];
    _likes = postmodel['likes'];
    _comments = postmodel['comments'];
    _shares = postmodel['shares'];
  }

  String get userName => _userName;
  String get timestamp => _timestamp;
  String get profileImageUrl => _profileImageUrl;
  String get textContent => _textContent;
  int get likes => _likes;
  int get comments => _comments;
  int get shares => _shares;
}
