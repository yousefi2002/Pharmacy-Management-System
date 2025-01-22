class GenericName{

  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  GenericName(this._name, this._createdAt, this._updatedAt);

  int? get id => _id;
  String get name => _name ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  set name (String newValue) => _name = newValue;
  set createdAt (String newValue) => _createdAt = newValue;
  set updatedAt (String newValue) => _updatedAt = newValue;

  Map <String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map["generic_id"] = _id;
    map["generic_name"] = _name;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    return map;
  }

  GenericName.fromMapObject(Map<String, dynamic> map){
    _id = map["generic_id"];
    _name = map["generic_name"];
    _createdAt = map["created_at"];
    _updatedAt = map["updated_at"];
  }
}