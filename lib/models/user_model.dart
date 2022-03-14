import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String _userId;
  final String _userName;
  final String _userTag;
  final String _profileImageUrl;

  const UserModel(this._userId, this._userName, this._userTag, this._profileImageUrl);

  String get userId => _userId;
  String get userName => _userName;
  String get userTag => _userTag;
  String get profileImageUrl => _profileImageUrl;

  @override
  List<Object> get props => [
        userId,
        userName,
        userTag,
        profileImageUrl,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['userId'],
      json['userName'],
      json['userTag'],
      json['profileImageUrl'],
    );
  }
}
