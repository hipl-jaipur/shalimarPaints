class RegionDataModel {
  RegionDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RegionDataModel.fromJson(dynamic json) {
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
RegionDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => RegionDataModel(  status: status ?? _status,
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
      num? regionId, 
      String? regionCode, 
      String? regionName, 
      num? regionmgrId, 
      dynamic regionmgrName, 
      String? regionmgrCode, 
      num? zoneId, 
      String? zoneCode, 
      String? zoneName, 
      num? isValid, 
      String? createdOn, 
      String? updatedOn,}){
    _regionId = regionId;
    _regionCode = regionCode;
    _regionName = regionName;
    _regionmgrId = regionmgrId;
    _regionmgrName = regionmgrName;
    _regionmgrCode = regionmgrCode;
    _zoneId = zoneId;
    _zoneCode = zoneCode;
    _zoneName = zoneName;
    _isValid = isValid;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
}

  Data.fromJson(dynamic json) {
    _regionId = json['region_id'];
    _regionCode = json['region_code'];
    _regionName = json['region_name'];
    _regionmgrId = json['regionmgr_id'];
    _regionmgrName = json['regionmgr_name'];
    _regionmgrCode = json['regionmgr_code'];
    _zoneId = json['zone_id'];
    _zoneCode = json['zone_code'];
    _zoneName = json['zone_name'];
    _isValid = json['isValid'];
    _createdOn = json['CreatedOn'];
    _updatedOn = json['UpdatedOn'];
  }
  num? _regionId;
  String? _regionCode;
  String? _regionName;
  num? _regionmgrId;
  dynamic _regionmgrName;
  String? _regionmgrCode;
  num? _zoneId;
  String? _zoneCode;
  String? _zoneName;
  num? _isValid;
  String? _createdOn;
  String? _updatedOn;
Data copyWith({  num? regionId,
  String? regionCode,
  String? regionName,
  num? regionmgrId,
  dynamic regionmgrName,
  String? regionmgrCode,
  num? zoneId,
  String? zoneCode,
  String? zoneName,
  num? isValid,
  String? createdOn,
  String? updatedOn,
}) => Data(  regionId: regionId ?? _regionId,
  regionCode: regionCode ?? _regionCode,
  regionName: regionName ?? _regionName,
  regionmgrId: regionmgrId ?? _regionmgrId,
  regionmgrName: regionmgrName ?? _regionmgrName,
  regionmgrCode: regionmgrCode ?? _regionmgrCode,
  zoneId: zoneId ?? _zoneId,
  zoneCode: zoneCode ?? _zoneCode,
  zoneName: zoneName ?? _zoneName,
  isValid: isValid ?? _isValid,
  createdOn: createdOn ?? _createdOn,
  updatedOn: updatedOn ?? _updatedOn,
);
  num? get regionId => _regionId;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  num? get regionmgrId => _regionmgrId;
  dynamic get regionmgrName => _regionmgrName;
  String? get regionmgrCode => _regionmgrCode;
  num? get zoneId => _zoneId;
  String? get zoneCode => _zoneCode;
  String? get zoneName => _zoneName;
  num? get isValid => _isValid;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['region_id'] = _regionId;
    map['region_code'] = _regionCode;
    map['region_name'] = _regionName;
    map['regionmgr_id'] = _regionmgrId;
    map['regionmgr_name'] = _regionmgrName;
    map['regionmgr_code'] = _regionmgrCode;
    map['zone_id'] = _zoneId;
    map['zone_code'] = _zoneCode;
    map['zone_name'] = _zoneName;
    map['isValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['UpdatedOn'] = _updatedOn;
    return map;
  }

}