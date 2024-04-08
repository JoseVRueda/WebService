import 'package:loggy/loggy.dart';

import '../../data/datasources/local/user_local_datasource.dart';
import '../../data/datasources/remote/user_remote_datasource.dart';
import '../../data/models/random_user_model.dart';
import '../entities/random_user.dart';

class UserRepository {
  late UserRemoteDataSource _userRemoteDataSource;
  late UserLocalDataSource _userLocalDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
  }

  Future<bool> getUser() async {
    RandomUser user = await _userRemoteDataSource.getUser();
    _userLocalDataSource.addUser(user);
    return true;
  }

  Future<List<RandomUser>> getAllUsers() async =>
      await _userLocalDataSource.getAllUsers();

  Future<void> deleteUser(id) async =>
      await _userLocalDataSource.deleteUser(id);

  Future<void> deleteAll() async => await _userLocalDataSource.deleteAll();

  Future<void> updateUser(user) async =>
      await _userLocalDataSource.updateUser(user);
}
