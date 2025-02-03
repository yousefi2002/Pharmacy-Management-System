class Medicine {
  int? _id;
  String? _genericName;
  String? _name;
  double? _buyPrice;
  double? _sellPrice;
  String? _barCode;
  String? _description;
  String? _type;
  String? _createdAt;
  String? _updatedAt;

  Medicine(
    this._id,
    this._genericName,
    this._name,
    this._buyPrice,
    this._sellPrice,
    this._barCode,
    this._description,
    this._type,
    [this._createdAt]
  );
  Medicine.empty([this._createdAt]);

  int? get id => _id;
  String get genericName => _genericName ?? '';
  String get name => _name ?? '';
  double get buyPrice => _buyPrice ?? 0.0;
  double get sellPrice => _sellPrice ?? 0.0;
  String get barCode => _barCode ?? '';
  String get description => _description ?? '';
  String get type => _type ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name(String newValue) {
    _name = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set description(String newValue) {
    _description = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set barCode(String newValue) {
    _barCode = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set type(String newValue) {
    _type = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set buyPrice(double newValue) {
    _buyPrice = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set sellPrice(double newValue) {
    _sellPrice = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;
  set genericName(String newValue) {
    genericName = newValue;
    updatedAt = DateTime.now().toUtc().toIso8601String();
  }

  Map<String, dynamic> toMap() {

    var map = <String, dynamic>{};
    map["medicine_id"] = _id;
    map["medicine_name"] = _name;
    map["medicine_description"] = _description;
    map["medicine_type"] = _type;
    map["medicine_buy_price"] = _buyPrice;
    map["medicine_sell_price"] = _sellPrice;
    map["medicine_bar_code"] = _barCode;
    map["medicine_generic_name"] = _genericName;
    map["created_at"] = _createdAt ?? DateTime.now().toUtc().toIso8601String();
    map["updated_at"] = DateTime.now().toUtc().toIso8601String();
    return map;
  }

  Medicine.fromMapObject(Map<String, dynamic> map) {
    _id = map["medicine_id"];
    _name = map["medicine_name"];
    _description = map["medicine_description"];
    _barCode = map["medicine_bar_code"];
    _type = map["medicine_type"];
    _buyPrice = (map["medicine_buy_price"] as num?)?.toDouble();
    _sellPrice = (map["medicine_sell_price"] as num?)?.toDouble();
    _genericName = map["medicine_generic_name"].toString();
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
