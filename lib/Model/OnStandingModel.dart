class OnStandingModel {
  OnStandingModel({
      bool? status, 
      String? message, 
      List<outStanding>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  OnStandingModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(outStanding.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<outStanding>? _data;
OnStandingModel copyWith({  bool? status,
  String? message,
  List<outStanding>? data,
}) => OnStandingModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<outStanding>? get data => _data;

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

class outStanding {
  outStanding({
      String? entitytype, 
      num? parentLevelID, 
      num? levelID, 
      String? levelName, 
      String? levelCode, 
      num? levelMgrId, 
      String? levelMgrName, 
      String? levelMgrDesignation, 
      num? srno, 
      dynamic finalOS, 
      dynamic unadjusted, 
      dynamic age030, 
      dynamic age3160, 
      dynamic age6190, 
      dynamic age91120, 
      dynamic age121150, 
      dynamic age151180, 
      dynamic age181Above, 
      dynamic bucketTotal, 
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
    _finalOS = finalOS;
    _unadjusted = unadjusted;
    _age030 = age030;
    _age3160 = age3160;
    _age6190 = age6190;
    _age91120 = age91120;
    _age121150 = age121150;
    _age151180 = age151180;
    _age181Above = age181Above;
    _bucketTotal = bucketTotal;
    _hireLevel = hireLevel;
}

  outStanding.fromJson(dynamic json) {
    _entitytype = json['entitytype'];
    _parentLevelID = json['ParentLevelID'];
    _levelID = json['LevelID'];
    _levelName = json['LevelName'];
    _levelCode = json['LevelCode'];
    _levelMgrId = json['LevelMgr_id'];
    _levelMgrName = json['LevelMgr_Name'];
    _levelMgrDesignation = json['LevelMgr_Designation'];
    _srno = json['srno'];
    _finalOS = json['FinalOS'];
    _unadjusted = json['Unadjusted'];
    _age030 = json['age_0_30'];
    _age3160 = json['age_31_60'];
    _age6190 = json['age_61_90'];
    _age91120 = json['age_91_120'];
    _age121150 = json['age_121_150'];
    _age151180 = json['age_151_180'];
    _age181Above = json['age_181_above'];
    _bucketTotal = json['BucketTotal'];
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
  dynamic _finalOS;
  dynamic _unadjusted;
  dynamic _age030;
  dynamic _age3160;
  dynamic _age6190;
  dynamic _age91120;
  dynamic _age121150;
  dynamic _age151180;
  dynamic _age181Above;
  dynamic _bucketTotal;
  num? _hireLevel;
  outStanding copyWith({  String? entitytype,
  num? parentLevelID,
  num? levelID,
  String? levelName,
  String? levelCode,
  num? levelMgrId,
  String? levelMgrName,
  String? levelMgrDesignation,
  num? srno,
  dynamic finalOS,
  dynamic unadjusted,
  dynamic age030,
  dynamic age3160,
  dynamic age6190,
  dynamic age91120,
  dynamic age121150,
  dynamic age151180,
  dynamic age181Above,
  dynamic bucketTotal,
  num? hireLevel,
}) => outStanding(  entitytype: entitytype ?? _entitytype,
  parentLevelID: parentLevelID ?? _parentLevelID,
  levelID: levelID ?? _levelID,
  levelName: levelName ?? _levelName,
  levelCode: levelCode ?? _levelCode,
  levelMgrId: levelMgrId ?? _levelMgrId,
  levelMgrName: levelMgrName ?? _levelMgrName,
  levelMgrDesignation: levelMgrDesignation ?? _levelMgrDesignation,
  srno: srno ?? _srno,
  finalOS: finalOS ?? _finalOS,
  unadjusted: unadjusted ?? _unadjusted,
  age030: age030 ?? _age030,
  age3160: age3160 ?? _age3160,
  age6190: age6190 ?? _age6190,
  age91120: age91120 ?? _age91120,
  age121150: age121150 ?? _age121150,
  age151180: age151180 ?? _age151180,
  age181Above: age181Above ?? _age181Above,
  bucketTotal: bucketTotal ?? _bucketTotal,
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
  dynamic get finalOS => _finalOS;
  dynamic get unadjusted => _unadjusted;
  dynamic get age030 => _age030;
  dynamic get age3160 => _age3160;
  dynamic get age6190 => _age6190;
  dynamic get age91120 => _age91120;
  dynamic get age121150 => _age121150;
  dynamic get age151180 => _age151180;
  dynamic get age181Above => _age181Above;
  dynamic get bucketTotal => _bucketTotal;
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
    map['FinalOS'] = _finalOS;
    map['Unadjusted'] = _unadjusted;
    map['age_0_30'] = _age030;
    map['age_31_60'] = _age3160;
    map['age_61_90'] = _age6190;
    map['age_91_120'] = _age91120;
    map['age_121_150'] = _age121150;
    map['age_151_180'] = _age151180;
    map['age_181_above'] = _age181Above;
    map['BucketTotal'] = _bucketTotal;
    map['HireLevel'] = _hireLevel;
    return map;
  }

}