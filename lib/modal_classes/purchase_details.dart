class PurchaseDetails {
  int? _id;
  int? _medicineId;
  int? _quantity;
  double? _pricePerUnit;
  String? _batchNumber;

  PurchaseDetails(
      this._medicineId,
      this._quantity,
      this._pricePerUnit,
      this._batchNumber,
      );

  int? get id => _id;
  int get medicineId => _medicineId ?? 0;
  int get quantity => _quantity ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  String get batchNumber => _batchNumber ?? '';

  set medicineId(int newValue) => _medicineId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;
  set batchNumber (String newValue) => _batchNumber = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["purchase_id"] = _id;
    map["medicine"] = _medicineId;
    map["purchase_Quantity"] = _quantity;
    map["purchase_price_per_unit"] = _pricePerUnit;
    map["purchase_batch_number"] = _batchNumber;

    return map;
  }

  PurchaseDetails.fromMapObject(Map<String, dynamic> map) {
    _id = map["purchase_id"];
    _medicineId = map["medicine"];
    _quantity = map["purchase_Quantity"];
    _pricePerUnit = map["purchase_price_per_unit"];
    _batchNumber = map["purchase_batch_number"];
  }
}
