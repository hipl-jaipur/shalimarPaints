class DepotDataModel {
  DepotDataModel({
      bool? status, 
      String? message, 
      List<DepotList>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DepotDataModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(DepotList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<DepotList>? _data;
DepotDataModel copyWith({  bool? status,
  String? message,
  List<DepotList>? data,
}) => DepotDataModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<DepotList>? get data => _data;

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

class DepotList {
  DepotList({
      num? depotId, 
      String? depotCode, 
      String? depotName, 
      num? depotmgrId, 
      String? depotmgrName, 
      String? depotmgrCode, 
      num? regionId, 
      String? regionCode, 
      String? regionName, 
      num? isValid, 
      String? createdOn, 
      String? updatedOn,}){
    _depotId = depotId;
    _depotCode = depotCode;
    _depotName = depotName;
    _depotmgrId = depotmgrId;
    _depotmgrName = depotmgrName;
    _depotmgrCode = depotmgrCode;
    _regionId = regionId;
    _regionCode = regionCode;
    _regionName = regionName;
    _isValid = isValid;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
}

  DepotList.fromJson(dynamic json) {
    _depotId = json['depot_id'];
    _depotCode = json['depot_code'];
    _depotName = json['depot_name'];
    _depotmgrId = json['depotmgr_id'];
    _depotmgrName = json['depotmgr_name'];
    _depotmgrCode = json['depotmgr_code'];
    _regionId = json['region_id'];
    _regionCode = json['region_code'];
    _regionName = json['region_name'];
    _isValid = json['isValid'];
    _createdOn = json['CreatedOn'];
    _updatedOn = json['UpdatedOn'];
  }
  num? _depotId;
  String? _depotCode;
  String? _depotName;
  num? _depotmgrId;
  String? _depotmgrName;
  String? _depotmgrCode;
  num? _regionId;
  String? _regionCode;
  String? _regionName;
  num? _isValid;
  String? _createdOn;
  String? _updatedOn;
  DepotList copyWith({  num? depotId,
  String? depotCode,
  String? depotName,
  num? depotmgrId,
  String? depotmgrName,
  String? depotmgrCode,
  num? regionId,
  String? regionCode,
  String? regionName,
  num? isValid,
  String? createdOn,
  String? updatedOn,
}) => DepotList(  depotId: depotId ?? _depotId,
  depotCode: depotCode ?? _depotCode,
  depotName: depotName ?? _depotName,
  depotmgrId: depotmgrId ?? _depotmgrId,
  depotmgrName: depotmgrName ?? _depotmgrName,
  depotmgrCode: depotmgrCode ?? _depotmgrCode,
  regionId: regionId ?? _regionId,
  regionCode: regionCode ?? _regionCode,
  regionName: regionName ?? _regionName,
  isValid: isValid ?? _isValid,
  createdOn: createdOn ?? _createdOn,
  updatedOn: updatedOn ?? _updatedOn,
);
  num? get depotId => _depotId;
  String? get depotCode => _depotCode;
  String? get depotName => _depotName;
  num? get depotmgrId => _depotmgrId;
  String? get depotmgrName => _depotmgrName;
  String? get depotmgrCode => _depotmgrCode;
  num? get regionId => _regionId;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  num? get isValid => _isValid;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['depot_id'] = _depotId;
    map['depot_code'] = _depotCode;
    map['depot_name'] = _depotName;
    map['depotmgr_id'] = _depotmgrId;
    map['depotmgr_name'] = _depotmgrName;
    map['depotmgr_code'] = _depotmgrCode;
    map['region_id'] = _regionId;
    map['region_code'] = _regionCode;
    map['region_name'] = _regionName;
    map['isValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['UpdatedOn'] = _updatedOn;
    return map;
  }

}