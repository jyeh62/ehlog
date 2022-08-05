import 'package:ehynsta/domain/entity/post.dart';
import 'package:ehynsta/domain/entity/user.dart';
import 'package:ehynsta/domain/post_repository.dart';

class JsonPostRepository extends PostRepository {
  @override
  String createPost({required Post post}) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  String deletePost({required String id}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  List<Post> getAllPost() {
    // TODO: implement getAllPost
    throw UnimplementedError();
  }

  @override
  Post getPost() {
    User user = User(name: "jychoi", email: "jyeh62@gmail.com", profileUrl: "assets/image/devops.png");
    return Post(user: user, content: "안녕하세요 최재영입니다.", issueAt: "202206031704", modified: "202206031704", filePath: "assets/images/devops.png");
  }

  @override
  List<Post> searchPost() {
    // TODO: implement searchPost
    throw UnimplementedError();
  }

  @override
  String updatePost({required Post post, String? id}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}