class EmployeeDetailsModel {
  EmployeeDetailsModel({
      bool? status, 
      String? message, 
      List<EmployeeDetails>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  EmployeeDetailsModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(EmployeeDetails.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<EmployeeDetails>? _data;
EmployeeDetailsModel copyWith({  bool? status,
  String? message,
  List<EmployeeDetails>? data,
}) => EmployeeDetailsModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<EmployeeDetails>? get data => _data;

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

class EmployeeDetails {
  EmployeeDetails({
    dynamic? employeeID,
      bool? isValid, 
      String? employeeCode, 
      String? employeeName, 
      String? employeeEmail, 
      num? employeeMobile,
      num? designationId,
      String? designationName, 
      num? reportingmgrId,
      dynamic reportingmgrName, 
      String? division, 
      String? status,}){
    _employeeID = employeeID;
    _isValid = isValid;
    _employeeCode = employeeCode;
    _employeeName = employeeName;
    _employeeEmail = employeeEmail;
    _employeeMobile = employeeMobile;
    _designationId = designationId;
    _designationName = designationName;
    _reportingmgrId = reportingmgrId;
    _reportingmgrName = reportingmgrName;
    _division = division;
    _status = status;
}

  EmployeeDetails.fromJson(dynamic json) {
    _employeeID = json['EmployeeID'];
    _isValid = json['isValid'];
    _employeeCode = json['employee_code'];
    _employeeName = json['employee_name'];
    _employeeEmail = json['employee_email'];
    _employeeMobile = json['employee_mobile'];
    _designationId = json['designation_id'];
    _designationName = json['designation_name'];
    _reportingmgrId = json['reportingmgr_id'];
    _reportingmgrName = json['reportingmgr_name'];
    _division = json['Division'];
    _status = json['Status'];
  }
  dynamic? _employeeID;
  bool? _isValid;
  String? _employeeCode;
  String? _employeeName;
  String? _employeeEmail;
  num? _employeeMobile;
  num? _designationId;
  String? _designationName;
  num? _reportingmgrId;
  dynamic _reportingmgrName;
  String? _division;
  String? _status;
  EmployeeDetails copyWith({  num? employeeID,
  bool? isValid,
  String? employeeCode,
  String? employeeName,
  String? employeeEmail,
  num? employeeMobile,
  num? designationId,
  String? designationName,
  num? reportingmgrId,
  dynamic reportingmgrName,
  String? division,
  String? status,
}) => EmployeeDetails(  employeeID: employeeID ?? _employeeID,
  isValid: isValid ?? _isValid,
  employeeCode: employeeCode ?? _employeeCode,
  employeeName: employeeName ?? _employeeName,
  employeeEmail: employeeEmail ?? _employeeEmail,
  employeeMobile: employeeMobile ?? _employeeMobile,
  designationId: designationId ?? _designationId,
  designationName: designationName ?? _designationName,
  reportingmgrId: reportingmgrId ?? _reportingmgrId,
  reportingmgrName: reportingmgrName ?? _reportingmgrName,
  division: division ?? _division,
  status: status ?? _status,
);
  dynamic? get employeeID => _employeeID;
  bool? get isValid => _isValid;
  String? get employeeCode => _employeeCode;
  String? get employeeName => _employeeName;
  String? get employeeEmail => _employeeEmail;
  num? get employeeMobile => _employeeMobile;
  num? get designationId => _designationId;
  String? get designationName => _designationName;
  num? get reportingmgrId => _reportingmgrId;
  dynamic get reportingmgrName => _reportingmgrName;
  String? get division => _division;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EmployeeID'] = _employeeID;
    map['isValid'] = _isValid;
    map['employee_code'] = _employeeCode;
    map['employee_name'] = _employeeName;
    map['employee_email'] = _employeeEmail;
    map['employee_mobile'] = _employeeMobile;
    map['designation_id'] = _designationId;
    map['designation_name'] = _designationName;
    map['reportingmgr_id'] = _reportingmgrId;
    map['reportingmgr_name'] = _reportingmgrName;
    map['Division'] = _division;
    map['Status'] = _status;
    return map;
  }

}