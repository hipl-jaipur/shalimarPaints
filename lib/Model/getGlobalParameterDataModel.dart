class GetGlobalParameterData {
  GetGlobalParameterData({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetGlobalParameterData.fromJson(dynamic json) {
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
GetGlobalParameterData copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetGlobalParameterData(  status: status ?? _status,
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
      num? parametersid, 
      String? parametersName, 
      String? parametersDesc, 
      String? parameterValue, 
      bool? isValid, 
      String? status,}){
    _parametersid = parametersid;
    _parametersName = parametersName;
    _parametersDesc = parametersDesc;
    _parameterValue = parameterValue;
    _isValid = isValid;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _parametersid = json['Parametersid'];
    _parametersName = json['ParametersName'];
    _parametersDesc = json['ParametersDesc'];
    _parameterValue = json['ParameterValue'];
    _isValid = json['IsValid'];
    _status = json['Status'];
  }
  num? _parametersid;
  String? _parametersName;
  String? _parametersDesc;
  String? _parameterValue;
  bool? _isValid;
  String? _status;
Data copyWith({  num? parametersid,
  String? parametersName,
  String? parametersDesc,
  String? parameterValue,
  bool? isValid,
  String? status,
}) => Data(  parametersid: parametersid ?? _parametersid,
  parametersName: parametersName ?? _parametersName,
  parametersDesc: parametersDesc ?? _parametersDesc,
  parameterValue: parameterValue ?? _parameterValue,
  isValid: isValid ?? _isValid,
  status: status ?? _status,
);
  num? get parametersid => _parametersid;
  String? get parametersName => _parametersName;
  String? get parametersDesc => _parametersDesc;
  String? get parameterValue => _parameterValue;
  bool? get isValid => _isValid;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Parametersid'] = _parametersid;
    map['ParametersName'] = _parametersName;
    map['ParametersDesc'] = _parametersDesc;
    map['ParameterValue'] = _parameterValue;
    map['IsValid'] = _isValid;
    map['Status'] = _status;
    return map;
  }

}