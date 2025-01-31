class Purchase {
  int? _id;
  String? _date;
  double? _totalPrice;
  int? _supplierId;
  String? _createdAt;
  String? _updatedAt;

  Purchase(
      this._date,
      this._totalPrice,
      this._supplierId,
      [this._createdAt]
      );

  Purchase.empty();

  int? get id => _id;
  String get date => _date ?? '';
  double get totalPrice => _totalPrice ?? 0.0;
  int get supplierId => _supplierId ?? 0;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set date (String newValue) => _date = newValue;
  set totalPrice(double newValue) => _totalPrice = newValue;
  set supplierId (int newValue) => _supplierId = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["purchase_id"] = _id;
    map["purchase_date"] = _date;
    map["purchase_total_price"] = _totalPrice;
    map["purchase_supplier_id"] = _supplierId;
    map["created_at"] = _createdAt ?? DateTime.now().toUtc().toIso8601String();
    map["updated_at"] = DateTime.now().toUtc().toIso8601String();
    return map;
  }

  Purchase.fromMapObject(Map<String, dynamic> map) {
    _id = map['purchase_id'];
    _date = map['purchase_date'];
    _totalPrice = (map['purchase_total_price'] as num?)?.toDouble();
    _supplierId = int.tryParse(map["purchase_supplier_id"] .toString());
    _createdAt = map['created_at'];
    _updatedAt = map['updated_at'];
  }
}
