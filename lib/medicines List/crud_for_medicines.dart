import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/medicines.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';

class MedicinesProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Medicine> _medicine = [];

  List<Medicine> get medicines => _medicine;

  Future<void> fetchMedicines() async {
    _medicine = await _databaseService.fetchMedicines();
    notifyListeners();
  }

  Future<void> addMedicine(Medicine medicine) async {
    await _dbHelper.addMedicines(medicine);
    await fetchMedicines();
  }

  Future<void> updateMedicine(Medicine medicine) async {
    await _dbHelper.updateMedicines(medicine);
    await fetchMedicines();
  }

  Future<void> deleteMedicine(int id) async {
    await _dbHelper.deleteMedicines(id);
    await fetchMedicines();
  }
}
