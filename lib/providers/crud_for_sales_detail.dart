import 'package:fargard_pharmacy_management_system/models/sales_details.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';

class SalesDetailProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<SalesDetails> _salesDetail = [];

  List<SalesDetails> get purchasesDetails => _salesDetail;

  Future<void> fetchSalesDetails() async {
    _salesDetail = await _databaseService.fetchSalesDetails();
    notifyListeners();
  }

  Future<void> addSalesDetails(List<SalesDetails> salesDetails) async {
    await _dbHelper.addSalesDetails(salesDetails);
    await fetchSalesDetails();
  }

  Future<void> updateSalesDetails(SalesDetails salesDetails) async {
    await _dbHelper.updateSalesDetails(salesDetails);
    await fetchSalesDetails();
  }

  Future<void> deleteSalesDetails(int id) async {
    await _dbHelper.deleteSalesDetails(id);
    await fetchSalesDetails();
  }
}

