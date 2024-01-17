class ActivitityData {
  ActivitityData({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ActivitityData.fromJson(dynamic json) {
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
ActivitityData copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ActivitityData(  status: status ?? _status,
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
      num? userActivityID,
      String? activityName, 
      dynamic activityDescription, 
      bool? isvalid, 
      dynamic createdby, 
      String? createdOn, 
      dynamic updatedby, 
      String? updatedOn, 
      String? status,}){
    _userActivityID = userActivityID;
    _activityName = activityName;
    _activityDescription = activityDescription;
    _isvalid = isvalid;
    _createdby = createdby;
    _createdOn = createdOn;
    _updatedby = updatedby;
    _updatedOn = updatedOn;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _userActivityID = json['UserActivityID'];
    _activityName = json['ActivityName'];
    _activityDescription = json['ActivityDescription'];
    _isvalid = json['Isvalid'];
    _createdby = json['createdby'];
    _createdOn = json['CreatedOn'];
    _updatedby = json['updatedby'];
    _updatedOn = json['UpdatedOn'];
    _status = json['Status'];
  }
  num? _userActivityID;
  String? _activityName;
  dynamic _activityDescription;
  bool? _isvalid;
  dynamic _createdby;
  String? _createdOn;
  dynamic _updatedby;
  String? _updatedOn;
  String? _status;
Data copyWith({  num? userActivityID,
  String? activityName,
  dynamic activityDescription,
  bool? isvalid,
  dynamic createdby,
  String? createdOn,
  dynamic updatedby,
  String? updatedOn,
  String? status,
}) => Data(  userActivityID: userActivityID ?? _userActivityID,
  activityName: activityName ?? _activityName,
  activityDescription: activityDescription ?? _activityDescription,
  isvalid: isvalid ?? _isvalid,
  createdby: createdby ?? _createdby,
  createdOn: createdOn ?? _createdOn,
  updatedby: updatedby ?? _updatedby,
  updatedOn: updatedOn ?? _updatedOn,
  status: status ?? _status,
);
  num? get userActivityID => _userActivityID;
  String? get activityName => _activityName;
  dynamic get activityDescription => _activityDescription;
  bool? get isvalid => _isvalid;
  dynamic get createdby => _createdby;
  String? get createdOn => _createdOn;
  dynamic get updatedby => _updatedby;
  String? get updatedOn => _updatedOn;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserActivityID'] = _userActivityID;
    map['ActivityName'] = _activityName;
    map['ActivityDescription'] = _activityDescription;
    map['Isvalid'] = _isvalid;
    map['createdby'] = _createdby;
    map['CreatedOn'] = _createdOn;
    map['updatedby'] = _updatedby;
    map['UpdatedOn'] = _updatedOn;
    map['Status'] = _status;
    return map;
  }

}