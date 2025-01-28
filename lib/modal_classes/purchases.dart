class Purchase {
  int? _id;
  int? _medicineId;
  int? _supplierId;
  int? _quantity;
  double? _pricePerUnit;
  double? _totalPrice;
  String? _date;
  String? _batchNumber;
  String? _createdAt;
  String? _updatedAt;

  Purchase(
      this._medicineId,
      this._supplierId,
      this._quantity,
      this._date,
      this._pricePerUnit,
      this._totalPrice,
      );

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  int get supplierId => _supplierId ?? 0;
  int get quantity => _quantity ?? 0;
  String get date => _date ?? '';
  String get batchNumber => _batchNumber ?? '';
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  double get totalPrice => _totalPrice ?? 0.0;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set medicineId (int newValue) => _medicineId = newValue;
  set supplierId (int newValue) => _supplierId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set date (String newValue) => _date = newValue;
  set batchNumber (String newValue) => _batchNumber = newValue;
  set pricePerUnit(double newValue) => _pricePerUnit = newValue;
  set totalPrice(double newValue) => _totalPrice = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["purchase_id"] = _id;
    map["purchase_medicine_id"] = _medicineId;
    map["purchase_supplier_id"] = _supplierId;
    map["purchase_quantity"] = _quantity;
    map["purchase_date"] = _date;
    map["purchase_batch_number"] = _batchNumber;
    map["purchase_price_per_unite"] = _pricePerUnit;
    map["purchase_total_price"] = _totalPrice;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Purchase.fromMapObject(Map<String, dynamic> map) {
    _id = map['purchase_id'];
    _medicineId = int.tryParse(map['purchase_medicine_id'].toString());
    _supplierId = int.tryParse(map["purchase_supplier_id"] .toString());
    _quantity = map['purchase_quantity'];
    _date = map['purchase_date'];
    _batchNumber = map['purchase_batch_number'];
    _pricePerUnit = (map['purchase_price_per_unite'] as num?)?.toDouble();
    _totalPrice = (map['purchase_total_price'] as num?)?.toDouble();
    _createdAt = map['created_at'];
    _updatedAt = map['updated_at'];
  }
}
