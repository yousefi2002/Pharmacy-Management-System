class Customer {
  int? _id;
  String? _name;
  String? _contactNumber;
  String? _email;
  String? _createdAt;
  String? _updatedAt;

  Customer(
      this._name,
      this._contactNumber,
      this._email,
      this._createdAt,
      this._updatedAt,
      );

  int? get id => _id;
  String get name => _name ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get email => _email ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set email (String newValue) => _email = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["customer_id"] = _id;
    map["customer_name"] = _name;
    map["customer_contact_number"] = _contactNumber;
    map["customer_email"] = _email;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Customer.fromMapObject(Map<String, dynamic> map) {
    _id = map["customer_id"];
    _name = map["customer_name"];
    _contactNumber = map["customer_contact_number"];
    _email = map["customer_email"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
