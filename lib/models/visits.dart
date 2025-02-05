class Visits {
  int? _id;
  String? _patientName;
  String? _doctorName;
  String? _gender;
  String? _age;
  String? _fees;
  String? _date;
  String? _time;
  String? _contactNumber;
  String? _createdAt;
  String? _updatedAt;
  Visits(
      this._id,
      this._patientName,
      this._doctorName,
      this._gender,
      this._age,
      this._fees,
      this._date,
      this._time,
      this._contactNumber,
      );

  int? get id => _id;
  String get patientName => _patientName ?? '';
  String get doctorName => _doctorName ?? '';
  String get gender => _gender ?? '';
  String get age => _age ?? '';
  String get fees => _fees ?? '';
  String get date => _date ?? '';
  String get time => _time ?? '';
  String get contactNumber => _contactNumber ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set patientName (String newValue) => _patientName = newValue;
  set doctorName (String newValue) => _doctorName = newValue;
  set gender (String newValue) => _gender = newValue;
  set age (String newValue) => _age = newValue;
  set fees (String newValue) => _fees = newValue;
  set date (String newValue) => _date = newValue;
  set time (String newValue) => time = newValue;
  set contactNumber (String newValue) => _contactNumber = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["visit_id"] = _id;
    map["patient_name"] = _patientName;
    map["doctor_name"] = _doctorName;
    map["gender"] = _gender;
    map["age"] = _age;
    map["fees"] = _fees;
    map["vis_date"] = _date;
    map["vis_time"] = _time;
    map["patient_contact_number"] = _contactNumber;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Visits.fromMapObject(Map<String, dynamic> map) {
    DateTime now = DateTime.now();
    _id = map["visit_id"];
    _patientName = map["patient_name"];
    _doctorName = map["doctor_name"];
    _gender = map["gender"];
    _age = map["age"];
    _fees = map["fees"];
    _date = map["vis_date"];
    _time = map["vis_time"];
    _contactNumber = map["patient_contact_number"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
  @override
  String toString() {
    return " $id \n ====== $_patientName \n ====== $_contactNumber \n ====== $_doctorName \n ====== $_gender \n ====== $_age \n ====== $_fees \n ====== $_time \n ====== $_date";
  }
}





