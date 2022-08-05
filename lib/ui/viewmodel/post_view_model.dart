import 'package:ehynsta/data/json_post_repository.dart';
import 'package:ehynsta/domain/entity/post.dart';
import 'package:rxdart/rxdart.dart';

class PostViewModel {
  var postSubject = PublishSubject<Post>();
  var repo = JsonPostRepository();
  void getPost() {
    postSubject.add(repo.getPost());
  }
}