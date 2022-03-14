import 'package:rxdart/rxdart.dart';
import 'package:upworkestebantest/models/user_model.dart';
import '../models/post_model.dart';
import '../resources/repository.dart';

class UserBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<UserModel>();
  late UserModel _user;

  Stream<UserModel> get userInfo => _userFetcher.stream;
  UserModel get user => _user;

  Future<void> logIn() async {
    UserModel userModel = await _repository.logIn("34g134f14tr14t25");
    _user = userModel;
    _userFetcher.sink.add(userModel);
  }

  dispose() {
    _userFetcher.close();
  }
}

final userBloc = UserBloc();
