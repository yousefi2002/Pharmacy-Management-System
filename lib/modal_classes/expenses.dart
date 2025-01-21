class Expenses {
  int? _id;
  String? _description;
  String? _amount;
  String? _date;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;

  Expenses(
      this._description,
      this._amount,
      this._date,
      this._userId,
      this._createdAt,
      this._updatedAt,
  );

  int? get id => _id;
  String get description => _description ?? '';
  String get amount => _amount ?? '';
  String get date => _date ?? '';
  String get userId => _userId ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set description (String newValue) => _description = newValue;
  set amount (String newValue) => _amount = newValue;
  set date (String newValue) => _date = newValue;
  set userId (String newValue) => _userId = newValue;
  set createdAt(String newValue) => _createdAt = newValue;
  set updatedAt(String newValue) => _updatedAt = newValue;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["expense_id"] = _id;
    map["expense_description"] = _description;
    map["expense_amount"] = _amount;
    map["expense_date"] = _date;
    map["expense_user_id"] = _userId;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  Expenses.fromMapObject(Map<String, dynamic> map) {
    _id = map["expense_id"];
    _description = map["expense_description"];
    _amount = map["expense_amount"];
    _date = map["expense_date"];
    _userId = map["expense_user_id"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}
