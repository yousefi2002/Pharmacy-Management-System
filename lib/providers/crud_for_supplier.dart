import 'package:fargard_pharmacy_management_system/models/companies.dart';
import 'package:fargard_pharmacy_management_system/models/suppliers.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';

class SupplierProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<Supplier> _suppliers = [];

  List<Supplier> get suppliers => _suppliers;

  Future<void> fetchSuppliers() async {
    _suppliers = await _databaseService.fetchSuppliers();
    notifyListeners();
  }

  Future<void> addSupplier(Supplier supplier) async {
    await _dbHelper.addSupplier(supplier);
    await fetchSuppliers();
  }

  Future<void> updateSupplier(Supplier supplier) async {
    await _dbHelper.updateSupplier(supplier);
    await fetchSuppliers();
  }

  Future<void> deleteSupplier(int id) async {
    await _dbHelper.deleteSupplier(id);
    await fetchSuppliers();
  }

  void searchSuppliers(String query) async {
    if (query.isEmpty) {
      fetchSuppliers();
    } else {
      _suppliers = await _databaseService.fetchSearchSuppliers(query);
      notifyListeners();
    }
  }
}
