// lib/data/repositories/user_repository.dart
import 'package:task_9/data/services/api_services.dart';
import 'package:task_9/data/services/pref_services.dart';

import '../models/user.dart';


class UserRepository {
  final ApiService _apiService;
  final StorageService _storageService;

  UserRepository(this._apiService, this._storageService);

  Future<List<User>> getUsers() async {
    return await _apiService.fetchUsers();
  }

  Future<void> saveUser(User user) async {
    await _storageService.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await _storageService.getSavedUser();
  }
}