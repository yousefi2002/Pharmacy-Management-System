import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/stocks.dart';

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

