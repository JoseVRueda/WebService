import 'package:get/get.dart';

import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';
import '../repositories/user_repository.dart';

class Users {
  final UserRepository _repository = Get.find();

  Future<void> addUser() async => await _repository.getUser();
  Future<List<RandomUser>> getAllUsers() async => await _repository.getAllUsers();
  Future<void> deleteUser(id) async => await _repository.deleteUser(id);
  Future<void> deleteAll() async => await _repository.deleteAll();
  Future<void> updateUser(user) async => await _repository.updateUser(user);  
}
