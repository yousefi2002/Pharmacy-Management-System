class Patient {
  int? _id;
  String? _name;
  String? _address;
  String? _contactNumber;
  String? _createdAt;
  String? _updatedAt;

  Patient(
      this._id,
      this._name,
      this._address,
      this._contactNumber,
      );

  int? get id => _id;
  String get name => _name ?? '';
  String get address => _address ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set address (String newValue) => _address = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["patient_id"] = _id;
    map["patient_name"] = _name;
    map["patient_contact_number"] = _address;
    map["patient_address"] = _contactNumber;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Patient.fromMapObject(Map<String, dynamic> map) {
    _id = map["patient_id"];
    _name = map["patient_name"];
    _address = map["patient_contact_number"];
    _contactNumber = map["patient_address"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
  @override
  String toString() {
    return " $id \n ====== $_name \n ====== $_address \n ====== $_contactNumber";
  }
}
