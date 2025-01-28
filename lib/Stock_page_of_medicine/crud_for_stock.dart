import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/medicines.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/purchases.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';
import '../modal_classes/sales.dart';
import '../modal_classes/stocks.dart';

class StockProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<Stock> _stock = [];

  List<Stock> get stock => _stock;

  Future<void> fetchStocks() async {
    _stock = await _databaseService.fetchStocks();
    notifyListeners();
  }

  Future<void> addStocks(Stock stock) async {
    await _dbHelper.addStocks(stock);
    await fetchStocks();
  }

  Future<void> updateStocks(Stock stock) async {
    await _dbHelper.updateStocks(stock);
    await fetchStocks();
  }

  Future<void> deleteStocks(int id) async {
    await _dbHelper.deleteStocks(id);
    await fetchStocks();
  }

  Future<void> insertUpdateStocks(Stock stock, int medicineId, int quantity) async {
    await _dbHelper.insertOrUpdateStock(medicineId, quantity, stock);
    await fetchStocks();
  }
}

