import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/doctors.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';

class DoctorProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Doctor> _doctor = [];

  List<Doctor> get doctor => _doctor;

  Future<void> fetchDoctors() async {
    _doctor = (await _databaseService.fetchDoctors()).cast<Doctor>();
    notifyListeners();
  }

  Future<void> addDoctor(Doctor Doctor) async {
    await _dbHelper.addDoctor(Doctor);
    await fetchDoctors();
  }

  Future<void> updateDoctor(Doctor Doctor) async {
    await _dbHelper.updateDoctor(Doctor);
    await fetchDoctors();
  }

  Future<void> deleteDoctor(int id) async {
    await _dbHelper.deleteDoctor(id);
    await fetchDoctors();
  }

}
