import 'package:fargard_pharmacy_management_system/models/medicines.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/stocks.dart';

class StockProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<Stock> _stock = [];
  List<Medicine> _medicineNames = [];

  List<Stock> get stock => _stock;
  List<Medicine> get medicinesName => _medicineNames;

  Future<void> fetchStocks() async {
    _stock = await _databaseService.fetchStocks();
    _medicineNames = await _databaseService.fetchMedicinesNameFromStock();
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

  Future<void> updateStocksIfExist(Stock stock, int medicineId, int quantity) async {
    await _dbHelper.updateStocksIfExist(medicineId, quantity, stock);
    await fetchStocks();
  }
}

