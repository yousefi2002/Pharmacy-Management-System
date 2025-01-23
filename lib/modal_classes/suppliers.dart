class Supplier {
  int? _id;
  String? _name;
  String? _contactNumber;
  String? _email;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  Supplier(
      this._name,
      this._contactNumber,
      this._email,
      this._address,
      this._createdAt,
      this._updatedAt,
      );

  int? get id => _id;
  String get name => _name ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get email => _email ?? '';
  String get address => _address ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set email(String newValue) => _email = newValue;
  set address(String newValue) => _address = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["supplier_id"] = _id;
    map["supplier_name"] = _name;
    map["supplier_contact_number"] = _contactNumber;
    map["supplier_email"] = _email;
    map["supplier_address"] = _address;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Supplier.fromMapObject(Map<String, dynamic> map) {
    _id = map["supplier_id"];
    _name = map["supplier_name"];
    _contactNumber = map["supplier_contact_number"];
    _email = map["supplier_email"];
    _address = map["supplier_address"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
