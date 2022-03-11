import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import '../models/post_model.dart';
import '../resources/repository.dart';

abstract class FeedBloc extends Equatable {
  final _repository = Repository();
  final _postsFetcher = PublishSubject<PostsFeedModel>();

  Stream<PostsFeedModel> get allPosts => _postsFetcher.stream;

  deletePost(int postIndex) async {
    PostsFeedModel itemModel = await _repository.deletePost(postIndex);
    _postsFetcher.sink.add(itemModel);
  }

  addPost(PostModel postInfo) async {
    PostsFeedModel itemModel = await _repository.addPost(postInfo);
    _postsFetcher.sink.add(itemModel);
  }

  fetchAllPosts() async {
    PostsFeedModel itemModel = await _repository.fetchAllPosts();
    _postsFetcher.sink.add(itemModel);
  }

  dispose() {
    _postsFetcher.close();
  }
}

class FeedBlocState extends FeedBloc {
  @override
  List<Object> get props => [];
}

final bloc = FeedBlocState();
