class SalesDetails {
  int? _id;
  int? _medicineId;
  int? _salesId;
  int? _quantity;
  double? _pricePerUnit;
  double? _totalPrice;

  SalesDetails(
      this._medicineId,
      this._salesId,
      this._quantity,
      this._pricePerUnit,
      this._totalPrice
      );

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  int get saleId => _salesId ?? 0;
  int get quantity => _quantity ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  double get totalPrice => _totalPrice ?? 0.0;

  set medicineId(int newValue) => _medicineId = newValue;
  set saleId(int newValue) => _salesId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;
  set totalPrice (double newValue) => _totalPrice = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["sales_detail_id"] = _id;
    map["sales_detail_medicine_id"] = _medicineId;
    map["sales_detail_sales_id"] = _salesId;
    map["sales_detail_quantity"] = _quantity;
    map["sales_detail_price_per_unite"] = _pricePerUnit;
    map["sales_detail_total_price"] = _totalPrice;

    return map;
  }

  SalesDetails.fromMapObject(Map<String, dynamic> map) {
    _id = map["sales_detail_id"];
    _medicineId = map["sales_detail_medicine_id"];
    _salesId = map["sales_detail_sales_id"];
    _quantity = map["sales_detail_quantity"];
    _pricePerUnit = map["sales_detail_price_per_unite"];
    _totalPrice = map["sales_detail_total_price"];
  }
}
