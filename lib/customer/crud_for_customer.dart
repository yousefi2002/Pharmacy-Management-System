import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/customers.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';

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
