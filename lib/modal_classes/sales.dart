class Sales {
  int? _id;
  int? _salesMedicineId;
  int? _salesCustomerId;
  int? _salesUserId;
  String? _quantity;
  String? _date;
  String? _totalPrice;
  String? _createdAt;
  String? _updatedAt;

  Sales(
      this._salesMedicineId,
      this._salesCustomerId,
      this._salesUserId,
      this._quantity,
      this._date,
      this._totalPrice,
      this._createdAt,
      this._updatedAt,
      );

  int? get id => _id;
  int get salesMedicineId => _salesMedicineId ?? 0;
  int get salesCustomerId => _salesCustomerId ?? 0;
  int get salesUserId => _salesUserId ?? 0;
  String get quantity => _quantity ?? '';
  String get date => _date ?? '';
  String get totalPrice => _totalPrice ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set salesMedicineId (int newValue) => _salesMedicineId = newValue;
  set salesCustomerId (int newValue) => _salesCustomerId = newValue;
  set salesUserID (int newValue) => _salesUserId = newValue;
  set quantity (String newValue) => _quantity = newValue;
  set date (String newValue) => _date = newValue;
  set totalPrice (String newValue) => _totalPrice = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["sales_id"] = _id;
    map["sales_medicine_id"] = _salesMedicineId;
    map["sales_customer_id"] = _salesCustomerId;
    map["sales_user_id"] = _salesUserId;
    map["sales_quantity"] = _quantity;
    map["sales_date"] = _date;
    map["sales_total_price"] = _totalPrice;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Sales.fromMapObject(Map<String, dynamic> map) {
    _id = map["sales_id"];
    _salesMedicineId = map["sales_medicine_id"];
    _salesCustomerId = map["sales_customer_id"];
    _salesUserId = map["sales_user_id"];
    _quantity = map["sales_quantity"];
    _date = map["sales_date"];
    _totalPrice = map["sales_total_price"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
