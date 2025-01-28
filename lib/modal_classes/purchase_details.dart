class PurchaseDetails {
  int? _medicineId;
  int? _purchaseId;
  int? _quantity;
  double? _pricePerUnit;
  String? _batchNumber;

  PurchaseDetails(
      this._medicineId,
      this._purchaseId,
      this._quantity,
      this._pricePerUnit,
      );

  int get medicineId => _medicineId ?? 0;
  int get purchaseId => _purchaseId ?? 0;
  int get quantity => _quantity ?? 0;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  String get batchNumber => _batchNumber ?? '';

  set medicineId(int newValue) => _medicineId = newValue;
  set purchaseId(int newValue) => _purchaseId = newValue;
  set quantity (int newValue) => _quantity = newValue;
  set pricePerUnit (double newValue) => _pricePerUnit = newValue;
  set batchNumber (String newValue) => _batchNumber = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["medicine_id"] = _medicineId;
    map["purchase_id"] = _purchaseId;
    map["purchase_quantity"] = _quantity;
    map["purchase_price_per_unit"] = _pricePerUnit;
    map["purchase_batch_number"] = _batchNumber;

    return map;
  }

  PurchaseDetails.fromMapObject(Map<String, dynamic> map) {
    _medicineId = map["medicine_id"];
    _purchaseId = map["purchase_id"];
    _quantity = map["purchase_quantity"];
    _pricePerUnit = map["purchase_price_per_unit"];
    _batchNumber = map["purchase_batch_number"];
  }
}
