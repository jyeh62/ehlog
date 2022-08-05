import 'package:ehynsta/domain/entity/user.dart';

class Post {
  String? id;
  User user;
  String content;
  String issueAt;
  String modified;
  String? filePath;
  List<String>? tags;
  Post({this.id,
    required this.user,
    required this.content,
    required this.issueAt,
    required this.modified,
    this.filePath,
    this.tags
  });
}