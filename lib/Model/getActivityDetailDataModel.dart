class GetActivityDetailDataModel {
  GetActivityDetailDataModel({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  GetActivityDetailDataModel.fromJson(dynamic json) {
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
  GetActivityDetailDataModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) =>
      GetActivityDetailDataModel(
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
    dynamic? activityDetailID,
    dynamic? activityID,
    String? activityName,
    String? activityDescription,
    dynamic customerCode,
    dynamic? userID,
    dynamic? latitude,
    dynamic? longitude,
    bool? isValid,
    String? createdOn,
    String? updatedOn,
    String? status,
    dynamic customername,
    dynamic zoneName,
    dynamic depotName,
    dynamic territoryName,
    String? employeeName,
  }) {
    _activityDetailID = activityDetailID;
    _activityID = activityID;
    _activityName = activityName;
    _activityDescription = activityDescription;
    _customerCode = customerCode;
    _userID = userID;
    _latitude = latitude;
    _longitude = longitude;
    _isValid = isValid;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _status = status;
    _customername = customername;
    _zoneName = zoneName;
    _depotName = depotName;
    _territoryName = territoryName;
    _employeeName = employeeName;
  }

  Data.fromJson(dynamic json) {
    _activityDetailID = json['ActivityDetailID'];
    _activityID = json['ActivityID'];
    _activityName = json['ActivityName'];
    _activityDescription = json['ActivityDescription'];
    _customerCode = json['CustomerCode'];
    _userID = json['UserID'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _isValid = json['IsValid'];
    _createdOn = json['CreatedOn'];
    _updatedOn = json['UpdatedOn'];
    _status = json['Status'];
    _customername = json['customername'];
    _zoneName = json['zone_name'];
    _depotName = json['depot_name'];
    _territoryName = json['territory_name'];
    _employeeName = json['employee_name'];
  }
  dynamic? _activityDetailID;
  dynamic? _activityID;
  String? _activityName;
  String? _activityDescription;
  dynamic _customerCode;
  dynamic? _userID;
  dynamic? _latitude;
  dynamic? _longitude;
  bool? _isValid;
  String? _createdOn;
  String? _updatedOn;
  String? _status;
  dynamic _customername;
  dynamic _zoneName;
  dynamic _depotName;
  dynamic _territoryName;
  String? _employeeName;
  Data copyWith({
    dynamic? activityDetailID,
    dynamic? activityID,
    String? activityName,
    String? activityDescription,
    dynamic customerCode,
    dynamic? userID,
    dynamic? latitude,
    dynamic? longitude,
    bool? isValid,
    String? createdOn,
    String? updatedOn,
    String? status,
    dynamic customername,
    dynamic zoneName,
    dynamic depotName,
    dynamic territoryName,
    String? employeeName,
  }) =>
      Data(
        activityDetailID: activityDetailID ?? _activityDetailID,
        activityID: activityID ?? _activityID,
        activityName: activityName ?? _activityName,
        activityDescription: activityDescription ?? _activityDescription,
        customerCode: customerCode ?? _customerCode,
        userID: userID ?? _userID,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        isValid: isValid ?? _isValid,
        createdOn: createdOn ?? _createdOn,
        updatedOn: updatedOn ?? _updatedOn,
        status: status ?? _status,
        customername: customername ?? _customername,
        zoneName: zoneName ?? _zoneName,
        depotName: depotName ?? _depotName,
        territoryName: territoryName ?? _territoryName,
        employeeName: employeeName ?? _employeeName,
      );
  dynamic? get activityDetailID => _activityDetailID;
  dynamic? get activityID => _activityID;
  String? get activityName => _activityName;
  String? get activityDescription => _activityDescription;
  dynamic get customerCode => _customerCode;
  dynamic? get userID => _userID;
  dynamic? get latitude => _latitude;
  dynamic? get longitude => _longitude;
  bool? get isValid => _isValid;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;
  String? get status => _status;
  dynamic get customername => _customername;
  dynamic get zoneName => _zoneName;
  dynamic get depotName => _depotName;
  dynamic get territoryName => _territoryName;
  String? get employeeName => _employeeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityDetailID'] = _activityDetailID;
    map['ActivityID'] = _activityID;
    map['ActivityName'] = _activityName;
    map['ActivityDescription'] = _activityDescription;
    map['CustomerCode'] = _customerCode;
    map['UserID'] = _userID;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['IsValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['UpdatedOn'] = _updatedOn;
    map['Status'] = _status;
    map['customername'] = _customername;
    map['zone_name'] = _zoneName;
    map['depot_name'] = _depotName;
    map['territory_name'] = _territoryName;
    map['employee_name'] = _employeeName;
    return map;
  }
}
