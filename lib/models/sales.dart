class Sales {
  int? _id;
  // String? _salesMedicineId;
  String? _salesCustomerId;
  String? _salesUserId;
  // int? _quantity;
  String? _date;
  double? _discount;
  double? _price;
  String? _createdAt;
  String? _updatedAt;

  Sales(
      this._salesCustomerId,
      this._salesUserId,
      this._date,
      this._discount,
      this._price,
      );

  int? get id => _id;
  // String get salesMedicineId => _salesMedicineId ?? '';
  String get salesCustomerId => _salesCustomerId ?? '';
  String get salesUserId => _salesUserId ?? '';
  // int get quantity => _quantity ?? 0;
  String get date => _date ?? '';
  double get price => _price ?? 0.0;
  double get discount => _discount ?? 0.0;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  // set salesMedicineId (String newValue) => _salesMedicineId = newValue;
  set salesCustomerId (String newValue) => _salesCustomerId = newValue;
  set salesUserID (String newValue) => _salesUserId = newValue;
  // set quantity (int newValue) => _quantity = newValue;
  set date (String newValue) => _date = newValue;
  set price (double newValue) => _price = newValue;
  set discount (double newValue) => _discount = newValue;
  set createdAt (String newValue) => _createdAt = newValue;
  set updatedAt (String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["sales_id"] = _id;
    // map["sales_medicine_id"] = _salesMedicineId;
    map["sales_customer_id"] = _salesCustomerId;
    map["sales_user_id"] = _salesUserId;
    // map["sales_quantity"] = _quantity;
    map["sales_date"] = _date;
    map["sales_discount"] = _discount;
    map["sales_price"] = _price;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Sales.fromMapObject(Map<String, dynamic> map) {
    _id = map["sales_id"];
    // _salesMedicineId = map["sales_medicine_id"];
    _salesCustomerId = map["sales_customer_id"];
    _salesUserId = map["sales_user_id"];
    // _quantity = map["sales_quantity"];
    _date = map["sales_date"];
    _discount = map["sales_discount"];
    _price = map["sales_price"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
