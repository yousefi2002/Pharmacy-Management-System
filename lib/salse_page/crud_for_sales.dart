import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';
import '../modal_classes/sales.dart';

class SalesProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<Sales> _sales = [];

  List<Sales> get sales => _sales;

  Future<void> fetchSales() async {
    _sales = await _databaseService.fetchSales();
    notifyListeners();
  }

  Future<void> addSales(Sales sales) async {
    await _dbHelper.addSales(sales);
    await fetchSales();
  }

  Future<void> updateSales(Sales sales) async {
    await _dbHelper.updateSales(sales);
    await fetchSales();
  }

  Future<void> deleteSales(int id) async {
    await _dbHelper.deleteSales(id);
    await fetchSales();
  }
}

