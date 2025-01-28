class Doctor {
  int? _id;
  String? _name;
  String? _specialization;
  String? _contactNumber;
  String? _createdAt;
  String? _updatedAt;

  Doctor(
      this._name,
      this._specialization,
      this._contactNumber,
      this._createdAt,
      this._updatedAt,{
        int? id,
      }) : _id = id;

  int? get id => _id;
  String get name => _name ?? '';
  String get role => _specialization ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set role (String newValue) => _specialization = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["doctor_id"] = _id;
    map["doctor_name"] = _name;
    map["doctor_specialization"] = _specialization;
    map["doctor_contact_number"] = _contactNumber;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Doctor.fromMapObject(Map<String, dynamic> map) {
    _id = map["doctor_id"];
    _name = map["doctor_name"];
    _specialization = map["doctor_specialization"];
    _contactNumber = map["doctor_contact_number"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
