import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/customers.dart';

class CustomerProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Customer> _customer = [];

  List<Customer> get customer => _customer;

  Future<void> fetchCustomers() async {
    _customer = (await _databaseService.fetchCustomers()).cast<Customer>();
    notifyListeners();
  }

  Future<void> addCustomer(Customer customers) async {
    await _dbHelper.addCustomer(customers);
    await fetchCustomers();
  }

  Future<void> updateCustomer(Customer customers) async {
    await _dbHelper.updateCustomer(customers);
    await fetchCustomers();
  }

  Future<void> deleteCustomer(int id) async {
    await _dbHelper.deleteCustomer(id);
    await fetchCustomers();
  }

}
