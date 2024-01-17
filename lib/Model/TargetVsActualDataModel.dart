class TargetVsActualDataModel {
  TargetVsActualDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  TargetVsActualDataModel.fromJson(dynamic json) {
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
TargetVsActualDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => TargetVsActualDataModel(  status: status ?? _status,
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
      num? target, 
      num? sales, 
      num? achivementPer, 
      num? hireLevel,}){
    _entitytype = entitytype;
    _parentLevelID = parentLevelID;
    _levelID = levelID;
    _levelName = levelName;
    _levelCode = levelCode;
    _levelMgrId = levelMgrId;
    _levelMgrName = levelMgrName;
    _levelMgrDesignation = levelMgrDesignation;
    _srno = srno;
    _target = target;
    _sales = sales;
    _achivementPer = achivementPer;
    _hireLevel = hireLevel;
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
    _target = json['Target'];
    _sales = json['Sales'];
    _achivementPer = json['AchivementPer'];
    _hireLevel = json['HireLevel'];
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
  num? _target;
  num? _sales;
  num? _achivementPer;
  num? _hireLevel;
Data copyWith({  String? entitytype,
  num? parentLevelID,
  num? levelID,
  String? levelName,
  String? levelCode,
  num? levelMgrId,
  String? levelMgrName,
  String? levelMgrDesignation,
  num? srno,
  num? target,
  num? sales,
  num? achivementPer,
  num? hireLevel,
}) => Data(  entitytype: entitytype ?? _entitytype,
  parentLevelID: parentLevelID ?? _parentLevelID,
  levelID: levelID ?? _levelID,
  levelName: levelName ?? _levelName,
  levelCode: levelCode ?? _levelCode,
  levelMgrId: levelMgrId ?? _levelMgrId,
  levelMgrName: levelMgrName ?? _levelMgrName,
  levelMgrDesignation: levelMgrDesignation ?? _levelMgrDesignation,
  srno: srno ?? _srno,
  target: target ?? _target,
  sales: sales ?? _sales,
  achivementPer: achivementPer ?? _achivementPer,
  hireLevel: hireLevel ?? _hireLevel,
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
  num? get target => _target;
  num? get sales => _sales;
  num? get achivementPer => _achivementPer;
  num? get hireLevel => _hireLevel;

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
    map['Target'] = _target;
    map['Sales'] = _sales;
    map['AchivementPer'] = _achivementPer;
    map['HireLevel'] = _hireLevel;
    return map;
  }

}