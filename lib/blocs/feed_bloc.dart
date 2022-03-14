import 'package:rxdart/rxdart.dart';
import '../models/post_model.dart';
import '../resources/repository.dart';

class FeedBloc {
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

  Future<void> fetchAllPosts() async {
    PostsFeedModel itemModel = await _repository.fetchAllPosts();
    _postsFetcher.sink.add(itemModel);
  }

  dispose() {
    _postsFetcher.close();
  }
}

final bloc = FeedBloc();
