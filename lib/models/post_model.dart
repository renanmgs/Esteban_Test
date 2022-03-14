import 'package:equatable/equatable.dart';

class PostsFeedModel {
  List<PostModel> _posts = [];
  PostsFeedModel.fromJson(Map<String, dynamic> parsedJson) {
    List<PostModel> temp = [];
    for (int i = 0; i < parsedJson['posts'].length; i++) {
      PostModel result = PostModel(parsedJson['posts'][i]['userId'], parsedJson['posts'][i]['userName'], parsedJson['posts'][i]['timestamp'], parsedJson['posts'][i]['profileImageUrl'],
          parsedJson['posts'][i]['textContent'], parsedJson['posts'][i]['likes'], parsedJson['posts'][i]['comments'], parsedJson['posts'][i]['shares']);
      temp.add(result);
    }
    _posts = temp;
  }
  List<PostModel> get posts => _posts;
}

class PostModel extends Equatable {
  final String _userId;
  final String _userName;
  final String _timestamp;
  final String _profileImageUrl;
  final String _textContent;
  final int _likes;
  final int _comments;
  final int _shares;

  const PostModel(this._userId, this._userName, this._timestamp, this._profileImageUrl, this._textContent, this._likes, this._comments, this._shares);

  String get userId => _userId;
  String get userName => _userName;
  String get timestamp => _timestamp;
  String get profileImageUrl => _profileImageUrl;
  String get textContent => _textContent;
  int get likes => _likes;
  int get comments => _comments;
  int get shares => _shares;

  @override
  List<Object> get props => [
        userId,
        userName,
        timestamp,
        profileImageUrl,
        textContent,
        likes,
        comments,
        shares,
      ];
}
