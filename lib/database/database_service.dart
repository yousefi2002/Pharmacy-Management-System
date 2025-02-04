import '../models/companies.dart';
import '../models/customers.dart';
import '../models/doctors.dart';
import '../models/doctors_appointment_fees.dart';
import '../models/expenses.dart';
import '../models/generic_names.dart';
import '../models/medicines.dart';
import '../models/visits.dart';
import '../models/purchase_details.dart';
import '../models/purchases.dart';
import '../models/sales.dart';
import '../models/sales_details.dart';
import '../models/stocks.dart';
import '../models/suppliers.dart';
import '../models/users.dart';
import 'database_helper.dart';

class DatabaseService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Company>> fetchCompanies() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('companies');
    return maps.map((map) => Company.fromMapObject(map)).toList();
  }

  Future<List<Customer>> fetchCustomers() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('customers');
    return maps.map((map) => Customer.fromMapObject(map)).toList();
  }

  Future<List<Doctor>> fetchDoctors() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('doctors');
    return maps.map((map) => Doctor.fromMapObject(map)).toList();
  }

  Future<List<DoctorAppointmentFee>> fetchDoctorsAppointmentFess() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('doctors_appointments_fee');
    return maps.map((map) => DoctorAppointmentFee.fromMapObject(map)).toList();
  }

  Future<List<Expenses>> fetchExpenses() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('expenses');
    return maps.map((map) => Expenses.fromMapObject(map)).toList();
  }

  Future<List<GenericName>> fetchGenericNames() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('generic_names');
    return maps.map((map) => GenericName.fromMapObject(map)).toList();
  }

  Future<List<Medicine>> fetchMedicines() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('medicines');
    return maps.map((map) => Medicine.fromMapObject(map)).toList();
  }
  Future<List<Medicine>> fetchSearchMedicines(String query) async {
    final List<Map<String, dynamic>> maps = await _dbHelper.searchAllMedicines(query);
    return maps.map((map) => Medicine.fromMapObject(map)).toList();
  }

  Future<List<GenericName>> fetchSearchGeneric(String query) async {
    final List<Map<String, dynamic>> maps = await _dbHelper.searchAllGenerics(query);
    return maps.map((map) => GenericName.fromMapObject(map)).toList();
  }

  Future<List<Company>> fetchSearchCompany(String query) async {
    final List<Map<String, dynamic>> maps = await _dbHelper.searchAllCompany(query);
    return maps.map((map) => Company.fromMapObject(map)).toList();
  }

  Future<List<Visits>> fetchVisits() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('visits');
    return maps.map((map) => Visits.fromMapObject(map)).toList();
  }

  Future<List<PurchaseDetails>> fetchPurchaseDetails() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('purchase_details');
    return maps.map((map) => PurchaseDetails.fromMapObject(map)).toList();
  }

  Future<List<Purchase>> fetchPurchase() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('purchases');
    return maps.map((map) => Purchase.fromMapObject(map)).toList();
  }

  Future<List<Sales>> fetchSales() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('sales');
    return maps.map((map) => Sales.fromMapObject(map)).toList();
  }

  Future<List<SalesDetails>> fetchSalesDetails() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('sales_details');
    return maps.map((map) => SalesDetails.fromMapObject(map)).toList();
  }

  Future<List<Stock>> fetchStocks() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('stocks');
    return maps.map((map) => Stock.fromMapObject(map)).toList();
  }

  Future<List<Medicine>> fetchMedicinesNameFromStock() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getMedicineNamesFromStock();
    return maps.map((map) => Medicine.fromMapObject(map)).toList();
  }

  Future<List<Supplier>> fetchSuppliers() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('suppliers');
    return maps.map((map) => Supplier.fromMapObject(map)).toList();
  }

  Future<List<Supplier>> fetchSearchSuppliers(String query) async {
    final List<Map<String, dynamic>> maps = await _dbHelper.searchAllSuppliers(query);
    return maps.map((map) => Supplier.fromMapObject(map)).toList();
  }

  Future<List<User>> fetchUsers() async {
    final List<Map<String, dynamic>> maps = await _dbHelper.getAllRows('users');
    return maps.map((map) => User.fromMapObject(map)).toList();
  }
}
