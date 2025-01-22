class User {
  int? _id;
  String? _name;
  String? _role;
  String? _contactNumber;
  String? _email;
  String? _createdAt;
  String? _updatedAt;

  User(
      this._id,
      this._name,
      this._role,
      this._contactNumber,
      this._email,
      );

  int? get id => _id;
  String get name => _name ?? '';
  String get role => _role ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get email => _email ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set role (String newValue) => _role = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set email (String newValue) => _email = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["user_id"] = _id;
    map["user_name"] = _name;
    map["user_role"] = _role;
    map["user_contact_number"] = _contactNumber;
    map["user_email"] = _email;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  User.fromMapObject(Map<String, dynamic> map) {
    _id = map["user_id"];
    _name = map["user_name"];
    _role = map["user_role"];
    _contactNumber = map["user_contact_number"];
    _email = map["user_email"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
  @override
  String toString() {
    return '$_id === \n $_name === \n $_email';
  }
}
