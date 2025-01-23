class SalesDetails {
  int? _id;
  int? _medicineId;
  int? _quantity;
  double? _pricePerUnit;

  SalesDetails(
      this._medicineId,
      this._quantity,
      this._pricePerUnit,
      );

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  int get quantity => _quantity ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;

  set medicineId(int newValue) => _medicineId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["sales_detail_id"] = _id;
    map["sales_medicine_id"] = _medicineId;
    map["sales_quantity"] = _quantity;
    map["sales_price_per_unite"] = _pricePerUnit;

    return map;
  }

  SalesDetails.fromMapObject(Map<String, dynamic> map) {
    _id = map["sales_detail_id"];
    _medicineId = map["sales_medicine_id"];
    _quantity = map["sales_quantity"];
    _pricePerUnit = map["sales_price_per_unite"];
  }
}
