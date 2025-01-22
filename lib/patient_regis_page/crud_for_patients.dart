import 'package:fargard_pharmacy_management_system/database_manager%20_folder/database_service.dart';
import 'package:flutter/material.dart';
import '../database_manager _folder/database_helper.dart';
import '../modal_classes/patients.dart';

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
    await _dbHelper.addPatient(patient);
    await fetchPatient();
  }

  Future<void> updatePatients(Patient patient) async {
    await _dbHelper.updatePatient(patient);
    await fetchPatient();
  }

  Future<void> deletePatient(int id) async {
    await _dbHelper.deletePatient(id);
    await fetchPatient();
  }
}
