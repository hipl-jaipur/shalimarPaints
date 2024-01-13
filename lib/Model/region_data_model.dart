

class RegionDataModel {
  RegionDataModel({
      bool? status, 
      String? message, 
      List<RegionList>? data,}){
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
        _data?.add(RegionList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<RegionList>? _data;
RegionDataModel copyWith({  bool? status,
  String? message,
  List<RegionList>? data,
}) => RegionDataModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<RegionList>? get data => _data;

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

class RegionList {
  RegionList({
      dynamic? regionId, 
      String? regionCode, 
      String? regionName, 
      dynamic? regionmgrId, 
      dynamic regionmgrName, 
      String? regionmgrCode, 
      dynamic? zoneId, 
      String? zoneCode, 
      String? zoneName, 
      bool? isValid, 
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

  RegionList.fromJson(dynamic json) {
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
  dynamic? _regionId;
  String? _regionCode;
  String? _regionName;
  dynamic? _regionmgrId;
  dynamic _regionmgrName;
  String? _regionmgrCode;
  dynamic? _zoneId;
  String? _zoneCode;
  String? _zoneName;
  bool? _isValid;
  String? _createdOn;
  String? _updatedOn;
  RegionList copyWith({  dynamic? regionId,
  String? regionCode,
  String? regionName,
  dynamic? regionmgrId,
  dynamic regionmgrName,
  String? regionmgrCode,
  dynamic? zoneId,
  String? zoneCode,
  String? zoneName,
  bool? isValid,
  String? createdOn,
  String? updatedOn,
}) => RegionList(  regionId: regionId ?? _regionId,
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
  dynamic? get regionId => _regionId;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  dynamic? get regionmgrId => _regionmgrId;
  dynamic get regionmgrName => _regionmgrName;
  String? get regionmgrCode => _regionmgrCode;
  dynamic? get zoneId => _zoneId;
  String? get zoneCode => _zoneCode;
  String? get zoneName => _zoneName;
  bool? get isValid => _isValid;
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