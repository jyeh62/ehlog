import 'package:ehynsta/domain/entity/user.dart';

abstract class UserRepository {
  Future<void> saveUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(User userInfo);
}