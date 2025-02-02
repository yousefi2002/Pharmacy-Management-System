class Supplier {
  int? _id;
  String? _name;
  String? _contactNumber;
  String? _email;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  Supplier(
      this._id,
      this._name,
      this._contactNumber,
      this._email,
      this._address,
      [this._createdAt]
      );
  Supplier.empty();

  int? get id => _id;
  String get name => _name ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get email => _email ?? '';
  String get address => _address ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) {
    _name = newValue;
    _updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set contactNumber (String newValue) {
    _contactNumber = newValue;
    _updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set email(String newValue) {
    _email = newValue;
    _updatedAt = DateTime.now().toUtc().toIso8601String();
  }
  set address(String newValue) {
    _address = newValue;
    _updatedAt = DateTime.now().toUtc().toIso8601String();
  }

    Map<String, dynamic> toMap() {
      var map = <String, dynamic>{};
      map["supplier_id"] = _id;
      map["supplier_name"] = _name;
      map["supplier_contact_number"] = _contactNumber;
      map["supplier_email"] = _email;
      map["supplier_address"] = _address;
      map["created_at"] = _createdAt ?? DateTime.now().toUtc().toIso8601String();
      map["updated_at"] = DateTime.now().toUtc().toIso8601String();
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
