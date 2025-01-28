import '../database/database_helper.dart';
import '../database/database_service.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

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
    await _dbHelper.addExpenses(expense);
    await fetchExpense();
  }

  Future<void> updateExpense(Expenses expense) async {
    await _dbHelper.updateExpenses(expense);
    await fetchExpense();
  }

  Future<void> deleteExpenses(int id) async {
    await _dbHelper.deleteExpenses(id);
    await fetchExpense();
  }

}
