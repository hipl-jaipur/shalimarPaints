class TeamsDataModel {
  TeamsDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  TeamsDataModel.fromJson(dynamic json) {
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
TeamsDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => TeamsDataModel(  status: status ?? _status,
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
      num? hirelevel, 
      num? reportingmgrId, 
      num? employeeid, 
      String? employeecode, 
      String? employeename, 
      String? designationName, 
      String? status,}){
    _hirelevel = hirelevel;
    _reportingmgrId = reportingmgrId;
    _employeeid = employeeid;
    _employeecode = employeecode;
    _employeename = employeename;
    _designationName = designationName;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _hirelevel = json['Hirelevel'];
    _reportingmgrId = json['reportingmgr_id'];
    _employeeid = json['employeeid'];
    _employeecode = json['employeecode'];
    _employeename = json['EMPLOYEENAME'];
    _designationName = json['designation_name'];
    _status = json['status'];
  }
  num? _hirelevel;
  num? _reportingmgrId;
  num? _employeeid;
  String? _employeecode;
  String? _employeename;
  String? _designationName;
  String? _status;
Data copyWith({  num? hirelevel,
  num? reportingmgrId,
  num? employeeid,
  String? employeecode,
  String? employeename,
  String? designationName,
  String? status,
}) => Data(  hirelevel: hirelevel ?? _hirelevel,
  reportingmgrId: reportingmgrId ?? _reportingmgrId,
  employeeid: employeeid ?? _employeeid,
  employeecode: employeecode ?? _employeecode,
  employeename: employeename ?? _employeename,
  designationName: designationName ?? _designationName,
  status: status ?? _status,
);
  num? get hirelevel => _hirelevel;
  num? get reportingmgrId => _reportingmgrId;
  num? get employeeid => _employeeid;
  String? get employeecode => _employeecode;
  String? get employeename => _employeename;
  String? get designationName => _designationName;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Hirelevel'] = _hirelevel;
    map['reportingmgr_id'] = _reportingmgrId;
    map['employeeid'] = _employeeid;
    map['employeecode'] = _employeecode;
    map['EMPLOYEENAME'] = _employeename;
    map['designation_name'] = _designationName;
    map['status'] = _status;
    return map;
  }

}