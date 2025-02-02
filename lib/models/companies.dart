class Company{

  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  Company(this._id, this._name, [this._createdAt]);

  int? get id => _id;
  String get name => _name ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name(String newValue) {
    _name = newValue;
    _updatedAt = DateTime.now().toUtc().toIso8601String(); // Auto-update timestamp
  }

  Map <String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map["company_id"] = _id;
    map["company_name"] = _name;
    map["created_at"] = _createdAt ?? DateTime.now().toUtc().toIso8601String();
    map["updated_at"] = DateTime.now().toUtc().toIso8601String();
    return map;
  }

  Company.fromMapObject(Map<String, dynamic> map){
    _id = map["company_id"];
    _name = map["company_name"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}