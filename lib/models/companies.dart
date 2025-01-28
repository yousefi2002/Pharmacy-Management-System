class Company{

  int? _id;
  String? _name;
  String? _address;
  String? _contactNumber;
  String? _createdAt;
  String? _updatedAt;

  Company(this._name, this._address, this._contactNumber, this._createdAt, this._updatedAt);

  int? get id => _id;
  String get name => _name ?? '';
  String get address => _address ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set address (String newValue) => _address = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set createdAt (String newValue) => _createdAt = newValue;
  set updatedAt (String newValue) => _updatedAt = newValue;

  Map <String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map["company_id"] = _id;
    map["company_name"] = _name;
    map["company_address"] = _address;
    map["contact_number"] = _contactNumber;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Company.fromMapObject(Map<String, dynamic> map){
    _id = map["company_id"];
    _name = map["company_name"];
    _address = map["company_address"];
    _contactNumber = map["contact_number"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}