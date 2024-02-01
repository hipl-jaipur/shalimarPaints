class CustomerDataModel {
  CustomerDataModel({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  CustomerDataModel.fromJson(dynamic json) {
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
  CustomerDataModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) =>
      CustomerDataModel(
        status: status ?? _status,
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
    String? entitytype,
    num? parentLevelID,
    num? levelID,
    String? levelName,
    String? levelCode,
    num? levelMgrId,
    String? levelMgrName,
    String? levelMgrDesignation,
    num? srno,
    dynamic address1,
    dynamic latitude,
    dynamic longitude,
    dynamic customerType,
    num? hirelevel,
    num? sale,
    num? target,
    num? os,
  }) {
    _entitytype = entitytype;
    _parentLevelID = parentLevelID;
    _levelID = levelID;
    _levelName = levelName;
    _levelCode = levelCode;
    _levelMgrId = levelMgrId;
    _levelMgrName = levelMgrName;
    _levelMgrDesignation = levelMgrDesignation;
    _srno = srno;
    _address1 = address1;
    _latitude = latitude;
    _longitude = longitude;
    _customerType = customerType;
    _hirelevel = hirelevel;
    _sale = sale;
    _target = target;
    _os = os;
  }

  Data.fromJson(dynamic json) {
    _entitytype = json['entitytype'];
    _parentLevelID = json['ParentLevelID'];
    _levelID = json['LevelID'];
    _levelName = json['LevelName'];
    _levelCode = json['LevelCode'];
    _levelMgrId = json['LevelMgr_id'];
    _levelMgrName = json['LevelMgr_Name'];
    _levelMgrDesignation = json['LevelMgr_Designation'];
    _srno = json['srno'];
    _address1 = json['Address1'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _customerType = json['CustomerType'];
    _hirelevel = json['Hirelevel'];
    _os = json['os'];
    _target = json['target'];
    _sale = json['sale'];
  }
  String? _entitytype;
  num? _parentLevelID;
  num? _levelID;
  String? _levelName;
  String? _levelCode;
  num? _levelMgrId;
  String? _levelMgrName;
  String? _levelMgrDesignation;
  num? _srno;
  dynamic _address1;
  dynamic _latitude;
  dynamic _longitude;
  dynamic _customerType;
  num? _hirelevel;
  num? _os;
  num? _target;
  num? _sale;
  Data copyWith({
    String? entitytype,
    num? parentLevelID,
    num? levelID,
    String? levelName,
    String? levelCode,
    num? levelMgrId,
    String? levelMgrName,
    String? levelMgrDesignation,
    num? srno,
    dynamic address1,
    dynamic latitude,
    dynamic longitude,
    dynamic customerType,
    num? hirelevel,
    num? os,
    num? target,
    num? sale,
  }) =>
      Data(
        entitytype: entitytype ?? _entitytype,
        parentLevelID: parentLevelID ?? _parentLevelID,
        levelID: levelID ?? _levelID,
        levelName: levelName ?? _levelName,
        levelCode: levelCode ?? _levelCode,
        levelMgrId: levelMgrId ?? _levelMgrId,
        levelMgrName: levelMgrName ?? _levelMgrName,
        levelMgrDesignation: levelMgrDesignation ?? _levelMgrDesignation,
        srno: srno ?? _srno,
        address1: address1 ?? _address1,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        customerType: customerType ?? _customerType,
        hirelevel: hirelevel ?? _hirelevel,
        os: os ?? _os,
        target: target ?? _target,
        sale: sale ?? _sale,
      );
  String? get entitytype => _entitytype;
  num? get parentLevelID => _parentLevelID;
  num? get levelID => _levelID;
  String? get levelName => _levelName;
  String? get levelCode => _levelCode;
  num? get levelMgrId => _levelMgrId;
  String? get levelMgrName => _levelMgrName;
  String? get levelMgrDesignation => _levelMgrDesignation;
  num? get srno => _srno;
  dynamic get address1 => _address1;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  dynamic get customerType => _customerType;
  num? get hirelevel => _hirelevel;
  num? get os => _os;
  num? get target => _target;
  num? get sale => _sale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['entitytype'] = _entitytype;
    map['ParentLevelID'] = _parentLevelID;
    map['LevelID'] = _levelID;
    map['LevelName'] = _levelName;
    map['LevelCode'] = _levelCode;
    map['LevelMgr_id'] = _levelMgrId;
    map['LevelMgr_Name'] = _levelMgrName;
    map['LevelMgr_Designation'] = _levelMgrDesignation;
    map['srno'] = _srno;
    map['Address1'] = _address1;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['CustomerType'] = _customerType;
    map['Hirelevel'] = _hirelevel;
    map['os'] = _os;
    map['target'] = _target;
    map['sale'] = _sale;
    return map;
  }
}
