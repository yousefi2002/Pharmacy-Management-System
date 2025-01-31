import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';

class GenericNameProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<GenericName> _genericName = [];

  List<GenericName> get genericName => _genericName;

  Future<void> fetchGeneric() async {
    _genericName = await _databaseService.fetchGenericNames();
    notifyListeners();
  }

  Future<void> addGeneric(GenericName generic) async {
    await _dbHelper.addGeneric(generic);
    await fetchGeneric();
  }

  Future<void> updateGeneric(GenericName generic) async {
    await _dbHelper.updateGeneric(generic);
    await fetchGeneric();
  }

  Future<void> deleteGeneric(int id) async {
    await _dbHelper.deleteGeneric(id);
    await fetchGeneric();
  }

  void searchGeneric(String query) async {
    if (query.isEmpty) {
      _genericName = await _databaseService.fetchGenericNames();
    } else {
      _genericName = await _databaseService.fetchSearchGeneric(query);
    }
    notifyListeners();
  }
}
