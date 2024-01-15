class DepotMasterDataModel {
  DepotMasterDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DepotMasterDataModel.fromJson(dynamic json) {
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
DepotMasterDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => DepotMasterDataModel(  status: status ?? _status,
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
      int? levelID, 
      String? levelCode, 
      String? levelName,}){
    _levelID = levelID;
    _levelCode = levelCode;
    _levelName = levelName;
}

  Data.fromJson(dynamic json) {
    _levelID = json['LevelID'];
    _levelCode = json['LevelCode'];
    _levelName = json['LevelName'];
  }
  int? _levelID;
  String? _levelCode;
  String? _levelName;
Data copyWith({  int? levelID,
  String? levelCode,
  String? levelName,
}) => Data(  levelID: levelID ?? _levelID,
  levelCode: levelCode ?? _levelCode,
  levelName: levelName ?? _levelName,
);
  int? get levelID => _levelID;
  String? get levelCode => _levelCode;
  String? get levelName => _levelName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['LevelID'] = _levelID;
    map['LevelCode'] = _levelCode;
    map['LevelName'] = _levelName;
    return map;
  }

}