class GetScheduleDataModel {
  GetScheduleDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetScheduleDataModel.fromJson(dynamic json) {
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
GetScheduleDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetScheduleDataModel(  status: status ?? _status,
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
      num? scheduleid, 
      String? customercode, 
      String? schdulefor, 
      String? date, 
      String? starttime, 
      String? endtime, 
      String? remark, 
      num? isvalid, 
      num? createdby, 
      String? createdon, 
      num? updatedby, 
      String? updatedon, 
      String? customername, 
      String? zoneName, 
      String? depotName, 
      String? territoryName, 
      String? status, 
      List<ScheduleDetails>? scheduleDetails,}){
    _scheduleid = scheduleid;
    _customercode = customercode;
    _schdulefor = schdulefor;
    _date = date;
    _starttime = starttime;
    _endtime = endtime;
    _remark = remark;
    _isvalid = isvalid;
    _createdby = createdby;
    _createdon = createdon;
    _updatedby = updatedby;
    _updatedon = updatedon;
    _customername = customername;
    _zoneName = zoneName;
    _depotName = depotName;
    _territoryName = territoryName;
    _status = status;
    _scheduleDetails = scheduleDetails;
}

  Data.fromJson(dynamic json) {
    _scheduleid = json['scheduleid'];
    _customercode = json['customercode'];
    _schdulefor = json['schdulefor'];
    _date = json['date'];
    _starttime = json['starttime'];
    _endtime = json['endtime'];
    _remark = json['remark'];
    _isvalid = json['isvalid'];
    _createdby = json['createdby'];
    _createdon = json['createdon'];
    _updatedby = json['updatedby'];
    _updatedon = json['updatedon'];
    _customername = json['customername'];
    _zoneName = json['zone_name'];
    _depotName = json['depot_name'];
    _territoryName = json['territory_name'];
    _status = json['status'];
    if (json['ScheduleDetails'] != null) {
      _scheduleDetails = [];
      json['ScheduleDetails'].forEach((v) {
        _scheduleDetails?.add(ScheduleDetails.fromJson(v));
      });
    }
  }
  num? _scheduleid;
  String? _customercode;
  String? _schdulefor;
  String? _date;
  String? _starttime;
  String? _endtime;
  String? _remark;
  num? _isvalid;
  num? _createdby;
  String? _createdon;
  num? _updatedby;
  String? _updatedon;
  String? _customername;
  String? _zoneName;
  String? _depotName;
  String? _territoryName;
  String? _status;
  List<ScheduleDetails>? _scheduleDetails;
Data copyWith({  num? scheduleid,
  String? customercode,
  String? schdulefor,
  String? date,
  String? starttime,
  String? endtime,
  String? remark,
  num? isvalid,
  num? createdby,
  String? createdon,
  num? updatedby,
  String? updatedon,
  String? customername,
  String? zoneName,
  String? depotName,
  String? territoryName,
  String? status,
  List<ScheduleDetails>? scheduleDetails,
}) => Data(  scheduleid: scheduleid ?? _scheduleid,
  customercode: customercode ?? _customercode,
  schdulefor: schdulefor ?? _schdulefor,
  date: date ?? _date,
  starttime: starttime ?? _starttime,
  endtime: endtime ?? _endtime,
  remark: remark ?? _remark,
  isvalid: isvalid ?? _isvalid,
  createdby: createdby ?? _createdby,
  createdon: createdon ?? _createdon,
  updatedby: updatedby ?? _updatedby,
  updatedon: updatedon ?? _updatedon,
  customername: customername ?? _customername,
  zoneName: zoneName ?? _zoneName,
  depotName: depotName ?? _depotName,
  territoryName: territoryName ?? _territoryName,
  status: status ?? _status,
  scheduleDetails: scheduleDetails ?? _scheduleDetails,
);
  num? get scheduleid => _scheduleid;
  String? get customercode => _customercode;
  String? get schdulefor => _schdulefor;
  String? get date => _date;
  String? get starttime => _starttime;
  String? get endtime => _endtime;
  String? get remark => _remark;
  num? get isvalid => _isvalid;
  num? get createdby => _createdby;
  String? get createdon => _createdon;
  num? get updatedby => _updatedby;
  String? get updatedon => _updatedon;
  String? get customername => _customername;
  String? get zoneName => _zoneName;
  String? get depotName => _depotName;
  String? get territoryName => _territoryName;
  String? get status => _status;
  List<ScheduleDetails>? get scheduleDetails => _scheduleDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduleid'] = _scheduleid;
    map['customercode'] = _customercode;
    map['schdulefor'] = _schdulefor;
    map['date'] = _date;
    map['starttime'] = _starttime;
    map['endtime'] = _endtime;
    map['remark'] = _remark;
    map['isvalid'] = _isvalid;
    map['createdby'] = _createdby;
    map['createdon'] = _createdon;
    map['updatedby'] = _updatedby;
    map['updatedon'] = _updatedon;
    map['customername'] = _customername;
    map['zone_name'] = _zoneName;
    map['depot_name'] = _depotName;
    map['territory_name'] = _territoryName;
    map['status'] = _status;
    if (_scheduleDetails != null) {
      map['ScheduleDetails'] = _scheduleDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ScheduleDetails {
  ScheduleDetails({
      num? scheduleid, 
      String? customercode, 
      num? useractivityid, 
      String? activityName, 
      dynamic activityDescription, 
      dynamic remark, 
      String? customername, 
      String? zoneName, 
      String? depotName, 
      String? territoryName,}){
    _scheduleid = scheduleid;
    _customercode = customercode;
    _useractivityid = useractivityid;
    _activityName = activityName;
    _activityDescription = activityDescription;
    _remark = remark;
    _customername = customername;
    _zoneName = zoneName;
    _depotName = depotName;
    _territoryName = territoryName;
}

  ScheduleDetails.fromJson(dynamic json) {
    _scheduleid = json['scheduleid'];
    _customercode = json['customercode'];
    _useractivityid = json['useractivityid'];
    _activityName = json['ActivityName'];
    _activityDescription = json['ActivityDescription'];
    _remark = json['remark'];
    _customername = json['customername'];
    _zoneName = json['zone_name'];
    _depotName = json['depot_name'];
    _territoryName = json['territory_name'];
  }
  num? _scheduleid;
  String? _customercode;
  num? _useractivityid;
  String? _activityName;
  dynamic _activityDescription;
  dynamic _remark;
  String? _customername;
  String? _zoneName;
  String? _depotName;
  String? _territoryName;
ScheduleDetails copyWith({  num? scheduleid,
  String? customercode,
  num? useractivityid,
  String? activityName,
  dynamic activityDescription,
  dynamic remark,
  String? customername,
  String? zoneName,
  String? depotName,
  String? territoryName,
}) => ScheduleDetails(  scheduleid: scheduleid ?? _scheduleid,
  customercode: customercode ?? _customercode,
  useractivityid: useractivityid ?? _useractivityid,
  activityName: activityName ?? _activityName,
  activityDescription: activityDescription ?? _activityDescription,
  remark: remark ?? _remark,
  customername: customername ?? _customername,
  zoneName: zoneName ?? _zoneName,
  depotName: depotName ?? _depotName,
  territoryName: territoryName ?? _territoryName,
);
  num? get scheduleid => _scheduleid;
  String? get customercode => _customercode;
  num? get useractivityid => _useractivityid;
  String? get activityName => _activityName;
  dynamic get activityDescription => _activityDescription;
  dynamic get remark => _remark;
  String? get customername => _customername;
  String? get zoneName => _zoneName;
  String? get depotName => _depotName;
  String? get territoryName => _territoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduleid'] = _scheduleid;
    map['customercode'] = _customercode;
    map['useractivityid'] = _useractivityid;
    map['ActivityName'] = _activityName;
    map['ActivityDescription'] = _activityDescription;
    map['remark'] = _remark;
    map['customername'] = _customername;
    map['zone_name'] = _zoneName;
    map['depot_name'] = _depotName;
    map['territory_name'] = _territoryName;
    return map;
  }

}