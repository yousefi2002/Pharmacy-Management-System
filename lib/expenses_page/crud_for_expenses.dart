import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/expenses.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';

class ExpensesProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Expenses> _expenses = [];

  List<Expenses> get expenses => _expenses;

  Future<void> fetchExpense() async {
    _expenses = await _databaseService.fetchExpenses();
    notifyListeners();
  }

  Future<void> addExpenses(Expenses expense) async {
    await _dbHelper.addExpense(expense);
    await fetchExpense();
  }

  Future<void> updateExpense(Expenses expense) async {
    await _dbHelper.updateExpense(expense);
    await fetchExpense();
  }

  Future<void> deleteExpenses(int id) async {
    await _dbHelper.deleteExpense(id);
    await fetchExpense();
  }

}
