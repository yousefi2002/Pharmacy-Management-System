class Stock {
  int? _id;
  int? _medicineId;
  double? _pricePerUnit;
  int? _quantity;
  String? _expireDate;
  String? _location;
  String? _createdAt;
  String? _updatedAt;

  Stock(
      this._medicineId,
      this._pricePerUnit,
      this._quantity,);

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  int get quantity => _quantity ?? 0;
  String get expireDate => _expireDate ?? '';
  String get location => _location ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set medicineId (int newValue) => _medicineId = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set expireDate (String newValue) => _expireDate = newValue;
  set location (String newValue) => _location = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["stock_id"] = _id;
    map["stock_medicine_id"] = _medicineId;
    map["stock_price_per_unit"] = _pricePerUnit;
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
    _pricePerUnit = (map['stock_price_per_unit'] as num?)?.toDouble();
    _quantity = map["stock_quantity"];
    _expireDate = map["stock_expire_date"];
    _location = map["stock_location"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
