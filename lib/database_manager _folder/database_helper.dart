import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // singleton database helper
  static Database? _database;

//--------------------------------
  String companyTable = 'companies';
  String comId = 'company_id';
  String comName = 'company_name';
  String comAddress = 'company_address';
  String contactNumber = 'contact_number';
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
  String purMedId = 'purchase_medicine_id';
  String purSupplierId = 'purchase_supplier_id';
  String purQuantity = 'purchase_quantity';
  String purPricePerUnite = 'purchase_price_per_unite';
  String purDate = 'purchase_date';
  String purBatchNumber = 'purchase_batch_number';
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
  String purchaseId = 'purchase_id';
  String medicineId = 'medicine';
  String purchaseQuantity = 'purchase_Quantity';
  String purchasePricePerUnit = 'purchase_price_per_unit';
  String purchaseBatchNumber = 'purchase_batch_number';

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
  String stoBatchNumber = 'stock_batch_number';
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

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    _database ??= await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/store.db';

    var storeDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return storeDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
        CREATE TABLE $companyTable (
        $comId INTEGER PRIMARY KEY AUTOINCREMENT,
        $comName varchar(255) NOT NULL,
        $comAddress TEXT,
        $contactNumber varchar(15) DEFAULT NULL,
        $genCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $genUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        ) ''');

    await db.execute('''
        CREATE TABLE $genericNameTable
        ($genId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $genName varchar(255) NOT NULL, 
        $genCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $genUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
        ''');

    await db.execute('''
        CREATE TABLE $medicinesTable
        ($medId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $medName varchar(255) NOT NULL,
        $medType varchar(255) DEFAULT NULL,
        $medDescription text,
        $medPricePerUnit decimal(10,2) DEFAULT NULL,
        $medCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $medUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        $medGenId int NOT NULL,
        $medComId int NOT NULL,
        KEY $medGenId ($medGenId),
        KEY $medComId ($medComId),
        CONSTRAINT $medComId FOREIGN KEY ($medComId) REFERENCES $companyTable ($comId),
        CONSTRAINT $medGenId FOREIGN KEY ($medGenId) REFERENCES $genericNameTable ($genId)
  )''');

    await db.execute('''
        CREATE TABLE $purchaseTable
        ($purId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $purMedId int NOT NULL,
        $purSupplierId int NOT NULL,
        $purQuantity int DEFAULT NULL,
        $purPricePerUnite decimal(10,2) DEFAULT NULL,
        $purDate date DEFAULT NULL,
        $purBatchNumber varchar(255) DEFAULT NULL,
        $purCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $purUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        KEY $purMedId ($purMedId),
        KEY $purSupplierId ($purSupplierId),
        CONSTRAINT $purMedId FOREIGN KEY ($purMedId) REFERENCES $medicinesTable($medId),
        CONSTRAINT $purSupplierId FOREIGN KEY ($purSupplierId) REFERENCES $supplierTable ($supId)
        )''');

    await db.execute('''
        CREATE TABLE $supplierTable
        ($supId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $supName varchar(255) NOT NULL,
        $supContactNumber varchar(15) DEFAULT NULL,
        $supEmail varchar(255) DEFAULT NULL,
        $supAddress text,
        $supCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $supUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        )''');

    await db.execute('''
        CREATE TABLE $salesTable
        ($salId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $salCustomerId int NOT NULL,
        $salMedId int NOT NULL,
        $salUserID int NOT NULL,
        $salQuantity int DEFAULT NULL,
        $salDate date DEFAULT NULL,
        $salTotalPrice decimal(10,2) DEFAULT NULL,
        $salCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $salUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        KEY $salMedId ($salMedId),
        KEY $salCustomerId ($salCustomerId),
        KEY $salUserID ($salUserID),
        CONSTRAINT $salMedId FOREIGN KEY ($salMedId) REFERENCES $medicinesTable ($medId),
        CONSTRAINT $salCustomerId FOREIGN KEY ($salCustomerId) REFERENCES $customersTable ($cusId),
        CONSTRAINT $salUserID FOREIGN KEY ($salUserID) REFERENCES $usersTable ($userId)
        ) ''');

    await db.execute('''
        CREATE TABLE $usersTable
        ($userId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $userName varchar(255) NOT NULL,
        $userRole varchar(15) DEFAULT NULL,
        $userContactNumber varchar(15) DEFAULT NULL,
        $userEmail varchar(255) DEFAULT NULL,
        $supCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $supUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        )''');

    await db.execute('''
        CREATE TABLE $customersTable
        ($cusId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $cusName varchar(255) NOT NULL,
        $cusContactNumber varchar(15) DEFAULT NULL,
        $cusEmail varchar(255) DEFAULT NULL,
        $cusCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $cusUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        )''');

    await db.execute('''
        CREATE TABLE $expensesTable
        ($expId INTEGER PRIMARY KEY AUTOINCREMENT, 
        $expDescription text,
        $expAmount decimal(10,2) DEFAULT NULL,
        $expDate date DEFAULT NULL,
        $expUserId int NOT NULL,
        $expCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $expUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        KEY $expUserId ($expUserId),
        CONSTRAINT $expUserId FOREIGN KEY ($expUserId) REFERENCES $usersTable ($userId)
        )''');

    await db.execute('''
        CREATE TABLE $purchaseDetailsTable
        ($purchaseId int NOT NULL,
        $medicineId int NOT NULL,
        $purchaseQuantity int NOT NULL,
        $purchasePricePerUnit decimal(10,2) DEFAULT NULL,
        $purchaseBatchNumber varchar(255) DEFAULT NULL,
        PRIMARY KEY ($purchaseId,$medicineId),
        KEY $medicineId ($medicineId),
        CONSTRAINT $purchaseId FOREIGN KEY ($purchaseId) REFERENCES $purchaseTable ($purId),
        CONSTRAINT $medicineId FOREIGN KEY ($medicineId) REFERENCES $medicinesTable ($medId)
        )''');

    await db.execute('''
        CREATE TABLE $salesDetailsTable
        ($salesId int NOT NULL,
         $salesMedicineId int NOT NULL,
         $salesQuantity int NOT NULL,
         $salesPricePerUnite decimal(10,2) DEFAULT NULL,
         PRIMARY KEY ($salesId, $salesMedicineId),
         KEY $salesMedicineId ($salesMedicineId),
         CONSTRAINT $salesId FOREIGN KEY ($salesId) REFERENCES $salesTable($salId),
         CONSTRAINT $salesMedicineId FOREIGN KEY ($salesMedicineId) REFERENCES $medicinesTable ($medId)
         )''');

    await db.execute('''
        CREATE TABLE $stockTable (
        $stoId  INTEGER PRIMARY KEY AUTOINCREMENT,
        $stoMedicineId int NOT NULL,
        $stoBatchNumber varchar(255) DEFAULT NULL,
        $stoQuantity int DEFAULT NULL,
        $stoExpireDate date DEFAULT NULL,
        $stoLocation varchar(255) DEFAULT NULL,
        $stoCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
        $stoUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        KEY $stoMedicineId ($stoMedicineId),
        CONSTRAINT $stoMedicineId FOREIGN KEY ($stoMedicineId ) REFERENCES $medicinesTable ($medId)
        )''');

    await db.execute('''
        CREATE TABLE $doctorTables
        ($docId INTEGER PRIMARY KEY AUTOINCREMENT, 
         $docName varchar(255) NOT NULL,
         $docSpecialization varchar(255) DEFAULT NULL,
         $docContactNumber varchar(15) DEFAULT NULL,
         $docCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
         $docUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
         )''');

    await db.execute('''
        CREATE TABLE $patientsTable
        ($patId INTEGER PRIMARY KEY AUTOINCREMENT, 
         $patName varchar(255) NOT NULL,
         $patContactNumber varchar(15) DEFAULT NULL,
         $patAddress text,
         $patCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
         $patUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
         )''');

    await db.execute('''
        CREATE TABLE $doctorAppointmentFeesTable 
        ($appointmentId INTEGER PRIMARY KEY AUTOINCREMENT,
         $appointmentPatientId int NOT NULL,
         $appointmentDoctorId int NOT NULL,
         $appointmentDate date DEFAULT NULL,
         $appointmentFee decimal(10,2) DEFAULT NULL,
         $appointmentCreatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
         $appointmentUpdatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
         $appointmentUserId int NOT NULL,
         KEY $appointmentPatientId ($appointmentPatientId),
         KEY $appointmentDoctorId ($appointmentDoctorId),
         KEY $appointmentUserId ($appointmentUserId),
         CONSTRAINT $appointmentPatientId FOREIGN KEY ($appointmentPatientId) REFERENCES $patientsTable ($patId),
         CONSTRAINT $appointmentDoctorId FOREIGN KEY ($appointmentDoctorId) REFERENCES $doctorTables ($docId),
         CONSTRAINT $appointmentUserId FOREIGN KEY ($appointmentUserId) REFERENCES $usersTable ($userId)
         )''');
  }

  // get data  --------------------------------------------------------
  Future<List<Map<String, dynamic>>> getAllRows(String tableName) async {
    final db = await database;
    return await db.query(tableName);
  }
}
