class ZoneDataModel {
  ZoneDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ZoneDataModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
ZoneDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ZoneDataModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

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

class Data {
  Data({
      dynamic? zoneId, 
      String? zoneCode, 
      String? zoneName, 
      dynamic? zonemgrId, 
      String? zonemgrName, 
      String? zonemgrCode, 
      dynamic? isValid, 
      String? createdOn, 
      String? updatedOn,}){
    _zoneId = zoneId;
    _zoneCode = zoneCode;
    _zoneName = zoneName;
    _zonemgrId = zonemgrId;
    _zonemgrName = zonemgrName;
    _zonemgrCode = zonemgrCode;
    _isValid = isValid;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
}

  Data.fromJson(dynamic json) {
    _zoneId = json['zone_id'];
    _zoneCode = json['zone_code'];
    _zoneName = json['zone_name'];
    _zonemgrId = json['zonemgr_id'];
    _zonemgrName = json['zonemgr_name'];
    _zonemgrCode = json['zonemgr_code'];
    _isValid = json['isValid'];
    _createdOn = json['CreatedOn'];
    _updatedOn = json['UpdatedOn'];
  }
  dynamic? _zoneId;
  String? _zoneCode;
  String? _zoneName;
  dynamic? _zonemgrId;
  String? _zonemgrName;
  String? _zonemgrCode;
  dynamic? _isValid;
  String? _createdOn;
  String? _updatedOn;
Data copyWith({  dynamic? zoneId,
  String? zoneCode,
  String? zoneName,
  dynamic? zonemgrId,
  String? zonemgrName,
  String? zonemgrCode,
  dynamic? isValid,
  String? createdOn,
  String? updatedOn,
}) => Data(  zoneId: zoneId ?? _zoneId,
  zoneCode: zoneCode ?? _zoneCode,
  zoneName: zoneName ?? _zoneName,
  zonemgrId: zonemgrId ?? _zonemgrId,
  zonemgrName: zonemgrName ?? _zonemgrName,
  zonemgrCode: zonemgrCode ?? _zonemgrCode,
  isValid: isValid ?? _isValid,
  createdOn: createdOn ?? _createdOn,
  updatedOn: updatedOn ?? _updatedOn,
);
  dynamic? get zoneId => _zoneId;
  String? get zoneCode => _zoneCode;
  String? get zoneName => _zoneName;
  dynamic? get zonemgrId => _zonemgrId;
  String? get zonemgrName => _zonemgrName;
  String? get zonemgrCode => _zonemgrCode;
  dynamic? get isValid => _isValid;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zone_id'] = _zoneId;
    map['zone_code'] = _zoneCode;
    map['zone_name'] = _zoneName;
    map['zonemgr_id'] = _zonemgrId;
    map['zonemgr_name'] = _zonemgrName;
    map['zonemgr_code'] = _zonemgrCode;
    map['isValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['UpdatedOn'] = _updatedOn;
    return map;
  }

}