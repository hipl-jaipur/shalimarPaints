class PaymentTypeModel {
  PaymentTypeModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PaymentTypeModel.fromJson(dynamic json) {
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
PaymentTypeModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PaymentTypeModel(  status: status ?? _status,
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
      dynamic? paymentTypeID,
      String? paymentType, 
      bool? isValid, 
      String? createdOn, 
      num? createdBy, 
      String? status,}){
    _paymentTypeID = paymentTypeID;
    _paymentType = paymentType;
    _isValid = isValid;
    _createdOn = createdOn;
    _createdBy = createdBy;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _paymentTypeID = json['PaymentTypeID'];
    _paymentType = json['PaymentType'];
    _isValid = json['IsValid'];
    _createdOn = json['CreatedOn'];
    _createdBy = json['CreatedBy'];
    _status = json['Status'];
  }
  dynamic? _paymentTypeID;
  String? _paymentType;
  bool? _isValid;
  String? _createdOn;
  num? _createdBy;
  String? _status;
Data copyWith({  dynamic? paymentTypeID,
  String? paymentType,
  bool? isValid,
  String? createdOn,
  num? createdBy,
  String? status,
}) => Data(  paymentTypeID: paymentTypeID ?? _paymentTypeID,
  paymentType: paymentType ?? _paymentType,
  isValid: isValid ?? _isValid,
  createdOn: createdOn ?? _createdOn,
  createdBy: createdBy ?? _createdBy,
  status: status ?? _status,
);
  dynamic? get paymentTypeID => _paymentTypeID;
  String? get paymentType => _paymentType;
  bool? get isValid => _isValid;
  String? get createdOn => _createdOn;
  num? get createdBy => _createdBy;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PaymentTypeID'] = _paymentTypeID;
    map['PaymentType'] = _paymentType;
    map['IsValid'] = _isValid;
    map['CreatedOn'] = _createdOn;
    map['CreatedBy'] = _createdBy;
    map['Status'] = _status;
    return map;
  }

}