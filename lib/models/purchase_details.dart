class PurchaseDetails {
  int? _id;
  int? _medicineId;
  int? _purchaseId;
  int? _quantity;
  double? _pricePerUnit;
  double? _totalPrice;

  PurchaseDetails(
      this._medicineId,
      this._purchaseId,
      this._quantity,
      this._pricePerUnit,
      [this._totalPrice,
      this._id]
      );

  PurchaseDetails.empty();

  int get id => _id ?? 0;
  int get medicineId => _medicineId ?? 0;
  int get purchaseId => _purchaseId ?? 0;
  int get quantity => _quantity ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  double get totalPrice => _totalPrice ?? 0.0;

  set medicineId(int newValue) => _medicineId = newValue;
  set purchaseId(int newValue) => _purchaseId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    // map["purchase_details_id"] = _medicineId;
    map["medicine_id"] = _medicineId;
    map["purchase_id"] = _purchaseId;
    map["purchase_quantity"] = _quantity;
    map["purchase_price_per_unit"] = _pricePerUnit;
    return map;
  }

  PurchaseDetails.fromMapObject(Map<String, dynamic> map) {
    _id = map["purchase_details_id"];
    _medicineId = map["medicine_id"];
    _purchaseId = map["purchase_id"];
    _quantity = map["purchase_quantity"];
    _pricePerUnit = map["purchase_price_per_unit"];
    // _totalPrice = double.tryParse(map["purchase_details_total"] ?? "0.0");
  }
}
