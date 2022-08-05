import 'package:ehynsta/domain/entity/post.dart';

abstract class PostRepository {
  List<Post> getAllPost();
  Post getPost();
  List<Post> searchPost();
  String createPost({required Post post});
  String updatePost({required Post post, String? id});
  String deletePost({required String id});
}