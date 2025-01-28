import 'package:fargard_pharmacy_management_system/models/companies.dart';
import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../database/database_service.dart';

class CompanyProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();

  List<Company> _company = [];

  List<Company> get company => _company;

  Future<void> fetchCompanies() async {
    _company = await _databaseService.fetchCompanies();
    notifyListeners();
  }

  Future<void> addCompanies(Company company) async {
    await _dbHelper.addCompany(company);
    await fetchCompanies();
  }

  Future<void> updateCompanies(Company company) async {
    await _dbHelper.updateCompany(company);
    await fetchCompanies();
  }

  Future<void> deleteCompanies(int id) async {
    await _dbHelper.deleteCompany(id);
    await fetchCompanies();
  }
}
