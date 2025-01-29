class Medicine {
  int? _id;
  String? _name;
  String? _description;
  String? _type;
  double? _pricePerUnit;
  String? _genericID;
  String? _companyId;
  String? _createdAt;
  String? _updatedAt;

  Medicine(
    this._id,
    this._name,
    this._description,
    this._type,
    this._pricePerUnit,
    this._genericID,
    this._companyId,
    this._createdAt,
    this._updatedAt
  );

  int? get id => _id;
  String get name => _name ?? '';
  String get description => _description ?? '';
  String get type => _type ?? '';
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  String get genericId => _genericID ?? '';
  String get companyId => _companyId ?? '';

  set name(String newValue) => _name = newValue;
  set description(String newValue) => _description = newValue;
  set type(String newValue) => _type = newValue;
  set pricePerUnit(double newValue) => _pricePerUnit = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;
  set genericId(String newValue) => genericId = newValue;
  set companyId(String newValue) => companyId = newValue;

  Map<String, dynamic> toMap() {

    var map = <String, dynamic>{};
    map["medicine_id"] = _id;
    map["medicine_name"] = _name;
    map["medicineDescription"] = _description;
    map["medicine_type"] = _type;
    map["medicine_price_per_unit"] = _pricePerUnit;
    map["medicine_generic_id"] = _genericID.toString();
    map["medicine_company_id"] = _companyId.toString();
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Medicine.fromMapObject(Map<String, dynamic> map) {
    _id = map["medicine_id"];
    _name = map["medicine_name"];
    _description = map["medicineDescription"];
    _type = map["medicine_type"];
    _pricePerUnit = (map["medicine_price_per_unit"] as num?)?.toDouble();
    _genericID = map["medicine_generic_id"].toString();
    _companyId = map["medicine_company_id"].toString();
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
