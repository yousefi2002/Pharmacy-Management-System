import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/doctors.dart';

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
