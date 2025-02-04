class Sales {
  int? _id;
  String? _salesInvoiceId;
  int? _salesCustomerId;
  int? _salesUserId;
  String? _date;
  double? _discount;
  double? _price;
  String? _createdAt;
  String? _updatedAt;

  Sales(
      this._salesCustomerId,
      this._salesInvoiceId,
      this._salesUserId,
      this._date,
      this._discount,
      this._price,
      );

  int? get id => _id;
  String get salesInvoiceId => _salesInvoiceId ?? '';
  int get salesCustomerId => _salesCustomerId ?? 0;
  int get salesUserId => _salesUserId ?? 0;
  String get date => _date ?? '';
  double get price => _price ?? 0.0;
  double get discount => _discount ?? 0.0;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set salesInvoiceId (String newValue) => _salesInvoiceId = newValue;
  set salesCustomerId (int newValue) => _salesCustomerId = newValue;
  set salesUserID (int newValue) => _salesUserId = newValue;
  set date (String newValue) => _date = newValue;
  set price (double newValue) => _price = newValue;
  set discount (double newValue) => _discount = newValue;
  set createdAt (String newValue) => _createdAt = newValue;
  set updatedAt (String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["sales_id"] = _id;
    map["sales_invoice_id"] = _salesInvoiceId;
    map["sales_customer_id"] = _salesCustomerId;
    map["sales_user_id"] = _salesUserId;
    map["sales_date"] = _date;
    map["sales_discount"] = _discount;
    map["sales_price"] = _price;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Sales.fromMapObject(Map<String, dynamic> map) {
    _id = map["sales_id"];
    _salesInvoiceId = map["sales_invoice_id"];
    _salesCustomerId = map["sales_customer_id"];
    _salesUserId = map["sales_user_id"];
    _date = map["sales_date"];
    _discount = map["sales_discount"];
    _price = map["sales_price"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
