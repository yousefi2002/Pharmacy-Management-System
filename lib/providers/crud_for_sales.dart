import 'package:fargard_pharmacy_management_system/models/sales_with_customer_and_user.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/sales.dart';

class SalesProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<SalesWithCustomerAndUser> _sales = [];
  int _lastInsertedSalesId = -1;

  List<SalesWithCustomerAndUser> get sales => _sales;
  int get lastInsertedSalesId => _lastInsertedSalesId;


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

  Future<void> fetchLastInsertedPurchaseId() async {
    _lastInsertedSalesId = await _dbHelper.fetchLastInsertedSalesId();
    notifyListeners();
  }

  void searchSales(String query) async {
    if (query.isEmpty) {
      fetchSales();
    } else {
      _sales = await _databaseService.fetchSearchSalesCustomerAndUser(query);
      notifyListeners();
    }
  }
}

