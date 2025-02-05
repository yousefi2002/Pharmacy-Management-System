class Expenses {
  int? _id;
  String? _description;
  double? _amount;
  String? _date;
  String? _time;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;

  Expenses(
      this._id,
      this._description,
      this._amount,
      this._date,
      this._time,
      this._userId
    );

  int? get id => _id;
  String get description => _description ?? '';
  double get amount => _amount ?? 0.0;
  String get date => _date ?? '';
  String get time => _time ?? '';
  String get userId => _userId ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set description (String newValue) => _description = newValue;
  set amount (double newValue) => _amount = newValue;
  set date (String newValue) => _date = newValue;
  set time (String newValue) => _time = newValue;
  set userId (String newValue) => _userId = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["expense_id"] = _id;
    map["expense_description"] = _description;
    map["expense_amount"] = _amount;
    map["expense_date"] = _date;
    map["expense_time"] = _time;
    map["expense_user_id"] = _userId;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Expenses.fromMapObject(Map<String, dynamic> map) {
    _id = map["expense_id"];
    _description = map["expense_description"];
    _amount = map["expense_amount"];
    _date = map["expense_date"].toString();
    _time = map["expense_time"].toString();
    _userId = map["expense_user_id"].toString();
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }

  @override
  String toString() {
    return '$_id === \n $_description ===  \n $_amount ===  \n $_date ===  \n $time';
  }
}
