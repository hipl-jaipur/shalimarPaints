class TerriotoryDataModel {
  TerriotoryDataModel({
      bool? status, 
      String? message, 
      List<TerriotoryList>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  TerriotoryDataModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(TerriotoryList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<TerriotoryList>? _data;
TerriotoryDataModel copyWith({  bool? status,
  String? message,
  List<TerriotoryList>? data,
}) => TerriotoryDataModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<TerriotoryList>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Message'] = _message;
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TerriotoryList {
  TerriotoryList({
      dynamic? territoryid, 
      String? territoryCode, 
      String? territoryName, 
      dynamic? territorymgrId, 
      dynamic territorymgrName, 
      dynamic territorymgrCode, 
      dynamic? depotId, 
      String? depotCode, 
      String? depotName, 
      dynamic? isValid, 
      String? createdOn, 
      String? updatedOn,}){
    _territoryid = territoryid;
    _territoryCode = territoryCode;
    _territoryName = territoryName;
    _territorymgrId = territorymgrId;
    _territorymgrName = territorymgrName;
    _territorymgrCode = territorymgrCode;
    _depotId = depotId;
    _depotCode = depotCode;
    _depotName = depotName;
    _isValid = isValid;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
}

  TerriotoryList.fromJson(dynamic json) {
    _territoryid = json['territoryid'];
    _territoryCode = json['territory_code'];
    _territoryName = json['territory_name'];
    _territorymgrId = json['territorymgr_id'];
    _territorymgrName = json['territorymgr_name'];
    _territorymgrCode = json['territorymgr_code'];
    _depotId = json['depot_id'];
    _depotCode = json['depot_code'];
    _depotName = json['depot_name'];
    _isValid = json['isValid'];
    _createdOn = json['CreatedOn'];
    _updatedOn = json['UpdatedOn'];
  }
  dynamic? _territoryid;
  String? _territoryCode;
  String? _territoryName;
  dynamic? _territorymgrId;
  dynamic _territorymgrName;
  dynamic _territorymgrCode;
  dynamic? _depotId;
  String? _depotCode;
  String? _depotName;
  dynamic? _isValid;
  String? _createdOn;
  String? _updatedOn;
  TerriotoryList copyWith({  dynamic? territoryid,
  String? territoryCode,
  String? territoryName,
  dynamic? territorymgrId,
  dynamic territorymgrName,
  dynamic territorymgrCode,
  dynamic? depotId,
  String? depotCode,
  String? depotName,
  dynamic? isValid,
  String? createdOn,
  String? updatedOn,
}) => TerriotoryList(  territoryid: territoryid ?? _territoryid,
  territoryCode: territoryCode ?? _territoryCode,
  territoryName: territoryName ?? _territoryName,
  territorymgrId: territorymgrId ?? _territorymgrId,
  territorymgrName: territorymgrName ?? _territorymgrName,
  territorymgrCode: territorymgrCode ?? _territorymgrCode,
  depotId: depotId ?? _depotId,
  depotCode: depotCode ?? _depotCode,
  depotName: depotName ?? _depotName,
  isValid: isValid ?? _isValid,
  createdOn: createdOn ?? _createdOn,
  updatedOn: updatedOn ?? _updatedOn,
);
  dynamic? get territoryid => _territoryid;
  String? get territoryCode => _territoryCode;
  String? get territoryName => _territoryName;
  dynamic? get territorymgrId => _territorymgrId;
  dynamic get territorymgrName => _territorymgrName;
  dynamic get territorymgrCode => _territorymgrCode;
  dynamic? get depotId => _depotId;
  String? get depotCode => _depotCode;
  String? get depotName => _depotName;
  dynamic? get isValid => _isValid;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['territoryid'] = _territoryid;
    map['territory_code'] = _territoryCode;
    map['territory_name'] = _territoryName;
    map['territorymgr_id'] = _territorymgrId;
    map['territorymgr_name'] = _territorymgrName;
    map['territorymgr_code'] = _territorymgrCode;
    map['depot_id'] = _depotId;
    map['depot_code'] = _depotCode;
    map['depot_name'] = _depotName;
    map['isValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['UpdatedOn'] = _updatedOn;
    return map;
  }

}