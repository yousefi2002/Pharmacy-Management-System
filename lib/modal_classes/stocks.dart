class Stock {
  int? _id;
  int? _medicineId;
  String? _batchNumber;
  int? _quantity;
  String? _expireDate;
  String? _location;
  String? _createdAt;
  String? _updatedAt;

  Stock(
      this._medicineId,
      this._batchNumber,
      this._quantity,
      this._expireDate,
      this._location,
      this._createdAt,
      this._updatedAt,
      );

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  String get batchNumber => _batchNumber ?? '';
  int get quantity => _quantity ?? 0;
  String get expireDate => _expireDate ?? '';
  String get location => _location ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set medicineId (int newValue) => _medicineId = newValue;
  set batchNumber (String newValue) => _batchNumber = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set expireDate (String newValue) => _expireDate = newValue;
  set location (String newValue) => _location = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["stock_id"] = _id;
    map["stock_medicine_id"] = _medicineId;
    map["stock_batch_number"] = _batchNumber;
    map["stock_quantity"] = _quantity;
    map["stock_expire_date"] = _expireDate;
    map["stock_location"] = _location;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Stock.fromMapObject(Map<String, dynamic> map) {
    _id = map["stock_id"];
    _medicineId = map["stock_medicine_id"];
    _batchNumber = map["stock_batch_number"];
    _quantity = map["stock_quantity"];
    _expireDate = map["stock_expire_date"];
    _location = map["stock_location"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
