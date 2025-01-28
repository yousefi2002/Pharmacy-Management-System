import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/patients.dart';

class PatientProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Patient> _patients = [];

  List<Patient> get patients => _patients;

  Future<void> fetchPatient() async {
    _patients = await _databaseService.fetchPatients();
    notifyListeners();
  }

  Future<void> addPatient(Patient patient) async {
    await _dbHelper.addPatients(patient);
    await fetchPatient();
  }

  Future<void> updatePatient(Patient patient) async {
    await _dbHelper.updatePatients(patient);
    await fetchPatient();
  }

  Future<void> deletePatient(int id) async {
    await _dbHelper.deletePatients(id);
    await fetchPatient();
  }
}
