class DoctorAppointmentFee {
  int? _id;
  int? _doctorId;
  int? _patientId;
  String? _date;
  String? _fee;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;

  DoctorAppointmentFee(
      this._doctorId,
      this._patientId,
      this._fee,
      this._date,
      this._userId,
      this._createdAt,
      this._updatedAt,
      );

  int? get id => _id;
  int get doctorId => _doctorId ?? 0;
  int get patientId => _patientId ?? 0;
  String get fee => _fee ?? '';
  String get date => _date ?? '';
  String get userId => _userId ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set doctorId (int newValue) => _doctorId = newValue;
  set patientId (int newValue) => _patientId = newValue;
  set fee (String newValue) => _fee = newValue;
  set date (String newValue) => _date = newValue;
  set userId (String newValue) => _userId = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["appointment_id"] = _id;
    map["appointment_doctor_id"] = _doctorId;
    map["appointment_patient_id"] = _patientId;
    map["appointment_fee"] = _fee;
    map["appointment_date"] = _date;
    map["appointment_user_id"] = _userId;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  DoctorAppointmentFee.fromMapObject(Map<String, dynamic> map) {
    _id = map["appointment_id"];
    _doctorId = map["appointment_doctor_id"];
    _patientId = map["appointment_patient_id"];
    _fee = map["appointment_fee"];
    _date = map["appointment_date"];
    _userId = map["appointment_user_id"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
