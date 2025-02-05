import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_service.dart';
import '../models/visits.dart';

class VisitProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final DatabaseService _databaseService = DatabaseService();
  List<Visits> _visits = [];

  List<Visits> get visits => _visits;

  Future<void> fetchVisits() async {
    _visits = await _databaseService.fetchVisits();
    notifyListeners();
  }

  Future<void> addPatient(Visits visits) async {
    await _dbHelper.addVisit(visits);
    await fetchVisits();
  }

  Future<void> updateVisits(Visits visits) async {
    await _dbHelper.updateVisit(visits);
    await fetchVisits();
  }

  Future<void> deleteVisits(int id) async {
    await _dbHelper.deleteVisit(id);
    await fetchVisits();
  }
}
