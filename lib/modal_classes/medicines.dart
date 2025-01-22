class Medicine {
  int? _id;
  String? _name;
  String? _description;
  String? _type;
  String? _pricePerUnit;
  String? _createdAt;
  String? _updatedAt;
  int? _genericID;
  int? _companyId;

  Medicine(
    this._name,
    this._description,
    this._type,
    this._pricePerUnit,
    this._createdAt,
    this._updatedAt,
    this._genericID,
    this._companyId,
  );

  int? get id => _id;
  String get name => _name ?? '';
  String get description => _description ?? '';
  String get type => _type ?? '';
  String get pricePerUnit => _pricePerUnit ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  int get genericId => _genericID ?? 0;
  int get companyId => _companyId ?? 0;

  set name(String newValue) => _name = newValue;
  set description(String newValue) => _description = newValue;
  set type(String newValue) => _type = newValue;
  set pricePerUnit(String newValue) => _pricePerUnit = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;
  set genericId(int newValue) => genericId = newValue;
  set companyId(int newValue) => companyId = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["medicine_id"] = _id;
    map["medicine_name"] = _name;
    map["medicineDescription"] = _description;
    map["medicine_type"] = _type;
    map["medicine_price_per_unit"] = _pricePerUnit;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["updated_at"] = _genericID;
    map["updated_at"] = _companyId;

    return map;
  }

  Medicine.fromMapObject(Map<String, dynamic> map) {
    _id = map["medicine_id"];
    _name = map["medicine_name"];
    _description = map["medicineDescription"];
    _type = map["medicine_type"];
    _pricePerUnit = map["medicine_price_per_unit"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
    _genericID = map["medicine_generic_id"];
    _companyId = map["medicine_company_id"];
  }
}
