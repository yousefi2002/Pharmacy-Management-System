import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/users.dart';

class UserProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUser() async {
    _users = await _databaseService.fetchUsers();
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    await _dbHelper.addUsers(user);
    await fetchUser();
  }

  Future<void> updateUser(User user) async {
    await _dbHelper.updateUsers(user);
    await fetchUser();
  }

  Future<void> deleteUser(int id) async {
    await _dbHelper.deleteUsers(id);
    await fetchUser();
  }
}
