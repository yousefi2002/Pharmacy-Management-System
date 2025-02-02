import 'dart:io';
import 'package:fargard_pharmacy_management_system/models/companies.dart';
import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/customers.dart';
import '../models/doctors.dart';
import '../models/expenses.dart';
import '../models/medicines.dart';
import '../models/patients.dart';
import '../models/purchase_details.dart';
import '../models/purchases.dart';
import '../models/sales.dart';
import '../models/stocks.dart';
import '../models/suppliers.dart';
import '../models/users.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // singleton database helper
  static Database? _database;

//--------------------------------
  String companyTable = 'companies';
  String comId = 'company_id';
  String comName = 'company_name';
  String comCreatedAt = 'created_at';
  String comUpdatedAt = 'updated_at';

//-------------------------------
  String genericNameTable = 'generic_names';
  String genId = 'generic_id';
  String genName = 'generic_name';
  String genCreatedAt = 'created_at';
  String genUpdatedAt = 'updated_at';

//---------------------------------
  String medicinesTable = 'medicines';
  String medId = 'medicine_id';
  String medName = 'medicine_name';
  String medType = 'medicine_type';
  String medDescription = 'medicineDescription';
  String medPricePerUnit = 'medicine_price_per_unit';
  String medCreatedAt = 'created_at';
  String medUpdatedAt = 'updated_at';
  String medGenId = 'medicine_generic_id';
  String medComId = 'medicine_company_id';

//---------------------------
  String purchaseTable = 'purchases';
  String purId = 'purchase_id';
  String purDate = 'purchase_date';
  String purTotalPrice = 'purchase_total_price';
  String purSupplierId = 'purchase_supplier_id';
  // String purMedId = 'purchase_medicine_id';
  // String purQuantity = 'purchase_quantity';
  // String purPricePerUnite = 'purchase_price_per_unite';
  // String purBatchNumber = 'purchase_batch_number';
  String purCreatedAt = 'created_at';
  String purUpdatedAt = 'updated_at';

//---------------------------
  String supplierTable = 'suppliers';
  String supId = 'supplier_id';
  String supName = 'supplier_name';
  String supContactNumber = 'supplier_contact_number';
  String supEmail = 'supplier_email';
  String supAddress = 'supplier_address';
  String supCreatedAt = 'created_at';
  String supUpdatedAt = 'updated_at';

//----------------------------
  String salesTable = 'sales';
  String salId = 'sales_id';
  String salMedId = 'sales_medicine_id';
  String salCustomerId = 'sales_customer_id';
  String salUserID = 'sales_user_id';
  String salQuantity = 'sales_quantity';
  String salDate = 'sales_date';
  String salTotalPrice = 'sales_total_price';
  String salCreatedAt = 'created_at';
  String salUpdatedAt = 'updated_at';

//-----------------------------
  String usersTable = 'users';
  String userId = 'user_id';
  String userName = 'user_name';
  String userRole = 'user_role';
  String userContactNumber = 'user_contact_number';
  String userEmail = 'user_email';
  String userCreatedAt = 'created_at';
  String userUpdatedAt = 'updated_at';

//----------------------------------
  String customersTable = 'customers';
  String cusId = 'customer_id';
  String cusName = 'customer_name';
  String cusContactNumber = 'customer_contact_number';
  String cusEmail = 'customer_email';
  String cusCreatedAt = 'created_at';
  String cusUpdatedAt = 'updated_at';

//---------------------------------------
  String expensesTable = 'expenses';
  String expId = 'expense_id';
  String expDescription = 'expense_description';
  String expAmount = 'expense_amount';
  String expDate = 'expense_date';
  String expUserId = 'expense_user_id';
  String expCreatedAt = 'created_at';
  String expUpdatedAt = 'updated_at';

//-----------------------------------------
  String purchaseDetailsTable = 'purchase_details';
  String purchaseDetailsID = 'purchase_details_id';
  String medicineId = 'medicine_id';
  String purchaseId = 'purchase_id';
  String purchaseDetailsQuantity = 'purchase_quantity';
  String purchaseDetailsPricePerUnit = 'purchase_price_per_unit';
  String purchaseDetailsTotal = 'purchase_details_total';

//--------------------------------------------
  String salesDetailsTable = 'salesDetails';
  String salesId = 'sales_detail_id';
  String salesMedicineId = 'sales_medicine_id';
  String salesQuantity = 'sales_quantity';
  String salesPricePerUnite = 'sales_price_per_unite';
//----------------------------------------------
  String stockTable = 'stocks';
  String stoId = 'stock_id';
  String stoMedicineId = 'stock_medicine_id';
  String stoPricePerUnit = 'stock_price_per_unit';
  String stoQuantity = 'stock_quantity';
  String stoExpireDate = 'stock_expire_date';
  String stoLocation = 'stock_location';
  String stoCreatedAt = 'created_at';
  String stoUpdatedAt = 'updated_at';

//--------------------------------------
  String doctorTables = 'doctors';
  String docId = 'doctor_id';
  String docName = 'doctor_name';
  String docSpecialization = 'doctor_specialization';
  String docContactNumber = 'doctor_contact_number';
  String docCreatedAt = 'created_at';
  String docUpdatedAt = 'updated_at';

//--------------------------------------
  String patientsTable = 'patients';
  String patId = 'patient_id';
  String patName = 'patient_name';
  String patContactNumber = 'patient_contact_number';
  String patAddress = 'patient_address';
  String patCreatedAt = 'created_at';
  String patUpdatedAt = 'updated_at';

//---------------------------------------
  String doctorAppointmentFeesTable = 'doctor_appointment_fees';
  String appointmentId = 'appointment_id';
  String appointmentPatientId = 'appointment_patient_id';
  String appointmentDoctorId = 'appointment_doctor_id';
  String appointmentDate = 'appointment_date';
  String appointmentFee = 'appointment_fee';
  String appointmentUserId = 'appointment_user_id';
  String appointmentCreatedAt = 'created_at';
  String appointmentUpdatedAt = 'updated_at';

  DatabaseHelper._createInstance();

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }
  String path = '';
  Future<String> getDatabasePath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/store.db';
  }
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    path = '${directory.path}/store.db';

    var storeDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return storeDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    //companyTable
    // Use TEXT for timestamps: Use datetime('now', 'utc') instead of CURRENT_TIMESTAMP ensures the timestamps are in UTC, which is good practice for consistency. it as an ISO 8601 formatted string (yyyy-MM-dd HH:mm:ss).
    await db.execute('''
        CREATE TABLE $companyTable (
        $comId INTEGER PRIMARY KEY AUTOINCREMENT,
        $comName TEXT NOT NULL,
        $comCreatedAt TEXT DEFAULT (datetime('now', 'utc')),
        $comUpdatedAt TEXT DEFAULT (datetime('now', 'utc'))
        ) ''');

    //genericNameTable
    await db.execute('''
        CREATE TABLE $genericNameTable
        ($genId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $genName TEXT NOT NULL, 
        $genCreatedAt TEXT DEFAULT (datetime('now', 'utc')),
        $genUpdatedAt TEXT DEFAULT (datetime('now', 'utc'))
        )''');

    //medicinesTable
    await db.execute('''
        CREATE TABLE $medicinesTable (
        $medId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $medName VARCHAR(255) NOT NULL,
        $medType VARCHAR(255) DEFAULT NULL,
        $medDescription TEXT,
        $medPricePerUnit DECIMAL(10,2) DEFAULT NULL,
        $medGenId TEXT DEFAULT NULL,
        $medComId TEXT DEFAULT NULL,
        $medCreatedAt TEXT DEFAULT (datetime('now', 'utc')),
        $medUpdatedAt TEXT DEFAULT (datetime('now', 'utc')),
        CONSTRAINT $medComId FOREIGN KEY ($medComId) REFERENCES $companyTable ($comId),
        CONSTRAINT $medGenId FOREIGN KEY ($medGenId) REFERENCES $genericNameTable ($genId)
      );''');
    await db.execute('CREATE INDEX $medGenId ON medicines($medGenId);');
    await db.execute('CREATE INDEX $medComId ON medicines($medComId);');

    //supplierTable
    await db.execute('''
      CREATE TABLE $supplierTable (
          $supId INTEGER PRIMARY KEY AUTOINCREMENT, 
          $supName varchar(255) NOT NULL,
          $supContactNumber varchar(15) DEFAULT NULL,
          $supEmail varchar(255) DEFAULT NULL,
          $supAddress text,
          $supCreatedAt TEXT DEFAULT (datetime('now', 'utc')),
          $supUpdatedAt TEXT DEFAULT (datetime('now', 'utc'))
      )''');

    //purchaseTable
    await db.execute('''
        CREATE TABLE $purchaseTable
        ($purId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $purDate TEXT DEFAULT (datetime('now', 'utc')),
        $purTotalPrice REAL DEFAULT NULL,
        $purSupplierId int NOT NULL,
        $purCreatedAt TEXT DEFAULT (datetime('now', 'utc')),
        $purUpdatedAt TEXT DEFAULT (datetime('now', 'utc')),
        FOREIGN KEY ($purSupplierId) REFERENCES $supplierTable ($supId)
        )''');
    await db.execute('CREATE INDEX $purSupplierId ON purchases($purSupplierId);');

    //purchaseDetailsTable
    await db.execute('''
    CREATE TABLE $purchaseDetailsTable (
        $purchaseDetailsID INT AUTO_INCREMENT PRIMARY KEY,
        $medicineId int NOT NULL,
        $purchaseId int NOT NULL,
        $purchaseDetailsQuantity int DEFAULT NULL,
        $purchaseDetailsPricePerUnit REAL DEFAULT NULL,
        $purchaseDetailsTotal DECIMAL(10, 2) GENERATED ALWAYS AS ($purchaseDetailsQuantity * $purchaseDetailsPricePerUnit) STORED,
        FOREIGN KEY ($purchaseId) REFERENCES $purchaseTable ($purId),
        FOREIGN KEY ($medicineId) REFERENCES $medicinesTable ($medId)
    )
    ''');
    await db.execute('''
    CREATE INDEX IF NOT EXISTS $purchaseId ON $purchaseDetailsTable ($purchaseId);
    ''');
    await db.execute('''
    CREATE INDEX IF NOT EXISTS $medicineId ON $purchaseDetailsTable ($medicineId);
    ''');

    await db.execute('''
    CREATE TABLE $salesTable (
        $salId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $salCustomerId int NOT NULL,
        $salMedId int NOT NULL,
        $salUserID int NOT NULL,
        $salQuantity int DEFAULT NULL,
        $salDate date DEFAULT NULL,
        $salTotalPrice REAL DEFAULT NULL,
        $salCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $salUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT $salMedId FOREIGN KEY ($salMedId) REFERENCES $medicinesTable ($medId),
        CONSTRAINT $salCustomerId FOREIGN KEY ($salCustomerId) REFERENCES $customersTable ($cusId),
        CONSTRAINT $salUserID FOREIGN KEY ($salUserID) REFERENCES $usersTable ($userId)
    )
''');

    await db.execute('''
    CREATE INDEX IF NOT EXISTS $salMedId ON $salesTable ($salMedId);
    CREATE INDEX IF NOT EXISTS $salCustomerId ON $salesTable ($salCustomerId);
    CREATE INDEX IF NOT EXISTS $salUserID ON $salesTable ($salUserID);
''');

    await db.execute('''
    CREATE TABLE $usersTable (
        $userId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $userName varchar(255) NOT NULL,
        $userRole varchar(15) DEFAULT NULL,
        $userContactNumber varchar(15) DEFAULT NULL,
        $userEmail varchar(255) DEFAULT NULL,
        $supCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $supUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP
    )
''');

    await db.execute('''
    CREATE TABLE $customersTable (
        $cusId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $cusName varchar(255) NOT NULL,
        $cusContactNumber varchar(15) DEFAULT NULL,
        $cusEmail varchar(255) DEFAULT NULL,
        $cusCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $cusUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP
    )
''');

    await db.execute('''
    CREATE TABLE $expensesTable (
        $expId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $expDescription text,
        $expAmount Real DEFAULT NULL,
        $expDate TEXT DEFAULT NULL,
        $expUserId INTEGER null,
        $expCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $expUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT $expUserId FOREIGN KEY ($expUserId) REFERENCES $usersTable ($userId)
    )
''');

    await db.execute('''
    CREATE INDEX IF NOT EXISTS $expUserId ON $expensesTable ($expUserId);
''');


    await db.execute('''
    CREATE TABLE $salesDetailsTable (
        $salesId int NOT NULL,
        $salesMedicineId int NOT NULL,
        $salesQuantity int NOT NULL,
        $salesPricePerUnite REAL DEFAULT NULL,
        PRIMARY KEY ($salesId, $salesMedicineId),
        CONSTRAINT $salesId FOREIGN KEY ($salesId) REFERENCES $salesTable($salId),
        CONSTRAINT $salesMedicineId FOREIGN KEY ($salesMedicineId) REFERENCES $medicinesTable ($medId)
    )
''');

    await db.execute('''
    CREATE TABLE $stockTable (
        $stoId INTEGER PRIMARY KEY AUTOINCREMENT,
        $stoMedicineId int NOT NULL,
        $stoPricePerUnit decimal(10,2) DEFAULT NULL,
        $stoQuantity int DEFAULT NULL,
        $stoExpireDate date DEFAULT NULL,
        $stoLocation varchar(255) DEFAULT NULL,
        $stoCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $stoUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY ($stoMedicineId) REFERENCES $medicinesTable ($medId)
    )
''');

    await db.execute('''
    CREATE INDEX IF NOT EXISTS $stoMedicineId ON $stockTable ($stoMedicineId);
''');

    await db.execute('''
    CREATE TABLE $doctorTables (
        $docId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $docName varchar(255) NOT NULL,
        $docSpecialization varchar(255) DEFAULT NULL,
        $docContactNumber varchar(15) DEFAULT NULL,
        $docCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $docUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP
    )
''');

    await db.execute('''
    CREATE TABLE $patientsTable (
        $patId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $patName varchar(255) NOT NULL,
        $patContactNumber varchar(15) DEFAULT NULL,
        $patAddress text,
        $patCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $patUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP
    )
''');

    await db.execute('''
    CREATE TABLE $doctorAppointmentFeesTable (
        $appointmentId INTEGER PRIMARY KEY AUTOINCREMENT,
        $appointmentPatientId int NOT NULL,
        $appointmentDoctorId int NOT NULL,
        $appointmentDate date DEFAULT NULL,
        $appointmentFee REAL DEFAULT NULL,
        $appointmentCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $appointmentUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $appointmentUserId int NOT NULL,
        CONSTRAINT $appointmentPatientId FOREIGN KEY ($appointmentPatientId) REFERENCES $patientsTable ($patId),
        CONSTRAINT $appointmentDoctorId FOREIGN KEY ($appointmentDoctorId) REFERENCES $doctorTables ($docId),
        CONSTRAINT $appointmentUserId FOREIGN KEY ($appointmentUserId) REFERENCES $usersTable ($userId)
    )
''');

    await db.execute('''
    CREATE INDEX IF NOT EXISTS $appointmentPatientId ON $doctorAppointmentFeesTable ($appointmentPatientId);
    CREATE INDEX IF NOT EXISTS $appointmentDoctorId ON $doctorAppointmentFeesTable ($appointmentDoctorId);
    CREATE INDEX IF NOT EXISTS $appointmentUserId ON $doctorAppointmentFeesTable ($appointmentUserId);
''');
  }

  // get data  --------------------------------------------------------
  Future<List<Map<String, dynamic>>> getAllRows(String tableName) async {
    final db = await database;
    return await db.query(tableName);
  }

  // patient crud -----------------------------------------------------
  Future<int> addPatients(Patient patient) async {
    final db = await database;
    return db.insert(patientsTable, patient.toMap());
  }

  Future<int> updatePatients(Patient patient) async {
    final db = await database;
    return db.update(
      patientsTable,
      patient.toMap(),
      where: '$patId = ?',
      whereArgs: [patient.id],
    );
  }

  Future<int> deletePatients(int id) async {
    final db = await database;
    return db.delete(patientsTable, where: '$patId = ?', whereArgs: [id]);
  }

  // patient crud -----------------------------------------------------
  Future<int> addUsers(User user) async {
    final db = await database;
    return db.insert(usersTable, user.toMap());
  }

  Future<int> updateUsers(User user) async {
    final db = await database;
    return db.update(
      usersTable,
      user.toMap(),
      where: '$userId = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUsers(int id) async {
    final db = await database;
    return db.delete(usersTable, where: '$userId = ?', whereArgs: [id]);
  }

  // patient crud -----------------------------------------------------

  Future<int> addExpenses(Expenses expenses) async {
    final db = await database;
    return db.insert(expensesTable, expenses.toMap());
  }

  Future<int> updateExpenses(Expenses expenses) async {
    final db = await database;
    return db.update(
      expensesTable,
      expenses.toMap(),
      where: '$expId = ?',
      whereArgs: [expenses.id],
    );
  }

  Future<int> deleteExpenses(int id) async {
    final db = await database;
    return db.delete(expensesTable, where: '$expId = ?', whereArgs: [id]);
  }

  // Customer crud -----------------------------------------------------
  Future<int> addCustomer(Customer customer) async {
    final db = await database;
    return db.insert(customersTable, customer.toMap());
  }

  Future<int> updateCustomer(Customer customer) async {
    final db = await database;
    return db.update(
      customersTable,
      customer.toMap(),
      where: '$cusId = ?',
      whereArgs: [customer.id],
    );
  }

  Future<int> deleteCustomer(int id) async {
    final db = await database;
    return db.delete(customersTable, where: '$cusId = ?', whereArgs: [id]);
  }

// Doctor crud -----------------------------------------------------
  Future<int> addDoctor(Doctor doctor) async {
    final db = await database;
    return db.insert(doctorTables, doctor.toMap());
  }

  Future<int> updateDoctor(Doctor doctor) async {
    final db = await database;
    return db.update(
      doctorTables,
      doctor.toMap(),
      where: '$docId = ?',
      whereArgs: [doctor.id],
    );
  }

  Future<int> deleteDoctor(int id) async {
    final db = await database;
    return db.delete(doctorTables, where: '$docId = ?', whereArgs: [id]);
  }
  // Doctor crud -----------------------------------------------------
  // Future<int> addSales(Sales sales) async {
  //   final db = await database;
  //   return db.insert(salesDetailsTable, sales.toMap());
  // }
  // Future<int> updateSales(Sales sales) async {
  //   final db = await database;
  //   return db.update(salesDetailsTable, sales.toMap(), where: '$salesId = ?', whereArgs: [sales.id],
  //   );
  // }
  // Future<int> deleteSales(int id) async {
  //   final db = await database;
  //   return db.delete(salesDetailsTable, where: '$salesId = ?', whereArgs: [id]);
  // }

  // Medicine crud -----------------------------------------------------
  Future<int> addMedicines(Medicine medicine) async {
    final db = await database;

    return db.insert(medicinesTable, medicine.toMap());
  }

  Future<int> updateMedicines(Medicine medicine) async {
    final db = await database;
    return db.update(
      medicinesTable,
      medicine.toMap(),
      where: '$medId = ?',
      whereArgs: [medicine.id],
    );
  }

  Future<int> deleteMedicines(int id) async {
    final db = await database;
    return db.delete(medicinesTable, where: '$medId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchAllMedicines(String query) async {
    final db = await database;
    final result = await db.query(
      medicinesTable,
      where: '$medName LIKE ?',
      whereArgs: ["$query%"],
    );
    return result;
  }
  // Sales crud -----------------------------------------------------

  Future<int> addSales(Sales sales) async {
    final db = await database;
    return db.insert(salesTable, sales.toMap());
  }

  Future<int> updateSales(Sales sales) async {
    final db = await database;
    return db.update(
      salesTable,
      sales.toMap(),
      where: '$salId = ?',
      whereArgs: [sales.id],
    );
  }

  Future<int> deleteSales(int id) async {
    final db = await database;
    return db.delete(salesTable, where: '$salId = ?', whereArgs: [id]);
  }

  // Suppliers crud -----------------------------------------------------

  Future<int> addSupplier(Supplier supplier) async {
    final db = await database;
    return db.insert(supplierTable, supplier.toMap());
  }

  Future<int> updateSupplier(Supplier supplier) async {
    final db = await database;
    return db.update(
      supplierTable,
      supplier.toMap(),
      where: '$supId = ?',
      whereArgs: [supplier.id],
    );
  }

  Future<int> deleteSupplier(int id) async {
    final db = await database;
    return db.delete(supplierTable, where: '$supId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchAllSuppliers(String query) async {
    final db = await database;
    final result = await db.query(
      supplierTable,
      where: '$supName LIKE ?',
      whereArgs: ["$query%"],
    );
    return result;
  }

  // Purchase crud -----------------------------------------------------

  Future<int> addPurchases(Purchase purchase) async {
    final db = await database;
    return db.insert(purchaseTable, purchase.toMap());
  }

  Future<int> updatePurchases(Purchase purchase) async {
    final db = await database;
    return db.update(
      purchaseTable,
      purchase.toMap(),
      where: '$purId = ?',
      whereArgs: [purchase.id],
    );
  }

  Future<int> deletePurchases(int id) async {
    final db = await database;
    return db.delete(purchaseTable, where: '$purId = ?', whereArgs: [id]);
  }

  Future<int> fetchLastInsertedPurchaseId() async {
    final db = await database;
    final List<Map> maps = await db.rawQuery("SELECT last_insert_rowid() AS PurchaseID;");
    return maps[0]['PurchaseID'];
  }

  // Purchase Details crud -----------------------------------------------------

  // Future<int> addPurchasesDetails(PurchaseDetails purchase) async {
  //   final db = await database;
  //   return db.insert(purchaseDetailsTable, purchase.toMap());
  // }

  Future<void> addPurchasesDetails(List<PurchaseDetails> purchaseDetails) async {
    final db = await database;
    Batch batch = db.batch(); // Create a batch for bulk insertion

    for (var purchaseDetails in purchaseDetails) {
      batch.insert(purchaseDetailsTable, purchaseDetails.toMap());
    }

    await batch.commit(noResult: true); // Execute batch insert
  }

  Future<int> updatePurchasesDetails(PurchaseDetails purchase) async {
    final db = await database;
    return db.update(
      purchaseDetailsTable,
      purchase.toMap(),
      where: '$purchaseId = ?',
      whereArgs: [purchase.purchaseId],
    );
  }

  Future<int> deletePurchasesDetails(int id) async {
    final db = await database;
    return db.delete(purchaseDetailsTable,
        where: '$purchaseId = ?', whereArgs: [id]);
  }

  // Stock Details crud -----------------------------------------------------
  Future<int> addStocks(Stock stock) async {
    final db = await database;
    return db.insert(stockTable, stock.toMap());
  }

  Future<int> updateStocks(Stock stock) async {
    final db = await database;
    return db.update(stockTable, stock.toMap(), where: '$stoId = ?', whereArgs: [stock.id],);
  }

  Future<int> deleteStocks(int id) async {
    final db = await database;
    return db.delete(stockTable, where: '$stoId = ?', whereArgs: [id]);
  }

  Future<void> insertOrUpdateStock(int medicineId, int quantity, Stock stock) async {
    final db = await database;

    // Check if the stock for the given medicine ID exists
    final existingStock = await db.query(
      stockTable,
      where: '$stoMedicineId = ?',
      whereArgs: [medicineId],
    );

    print('Existing stock: $existingStock');

    if (existingStock.isNotEmpty) {
      // Extract the current quantity
      final int currentQuantity = existingStock.first[stoQuantity] as int;

      // Update the stock with the new quantity
      await db.update(
        stockTable,
        {stoQuantity: currentQuantity + quantity}, // Corrected quantity update
        where: '$stoMedicineId = ?',
        whereArgs: [medicineId],
      );
    } else {
      // Insert a new stock if medicine ID is not found
      await addStocks(stock);
    }
  }


  Future<List<Map<String, dynamic>>> getMedicineNamesFromStock() async {
    final db = await database;
    return await db.rawQuery(
        '''
    SELECT m.*
    FROM $medicinesTable m
    JOIN $stockTable s ON m.$medId = s.$stoMedicineId
    '''
    );
  }

  // generic name crud -----------------------------------------------------

  Future<int> addGeneric(GenericName generic) async {
    final db = await database;
    return db.insert(genericNameTable, generic.toMap());
  }

  Future<int> updateGeneric(GenericName generic) async {
    final db = await database;
    return db.update(
      genericNameTable,
      generic.toMap(),
      where: '$genId = ?',
      whereArgs: [generic.id],
    );
  }

  Future<int> deleteGeneric(int id) async {
    final db = await database;
    return db.delete(genericNameTable, where: '$genId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchAllGenerics(String query) async {
    final db = await database;
    final result = await db.query(
      genericNameTable,
      where: '$genName LIKE ?',
      whereArgs: ["$query%"],
    );
    print(result); // Debugging purpose
    return result;
  }

  // company name crud -----------------------------------------------------

  Future<int> addCompany(Company company) async {
    final db = await database;
    return db.insert(companyTable, company.toMap());
  }

  Future<int> updateCompany(Company company) async {
    final db = await database;
    return db.update(
      companyTable,
      company.toMap(),
      where: '$comId = ?',
      whereArgs: [company.id],
    );
  }

  Future<int> deleteCompany(int id) async {
    final db = await database;
    return db.delete(companyTable, where: '$comId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchAllCompany(String query) async {
    final db = await database;
    final result = await db.query(
      companyTable,
      where: '$comName LIKE ?',
      whereArgs: ["$query%"],
    );
    return result;
  }
}
