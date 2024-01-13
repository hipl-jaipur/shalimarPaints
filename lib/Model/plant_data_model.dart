class PlantDataModel {
  PlantDataModel({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  PlantDataModel.fromJson(dynamic json) {
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
  PlantDataModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) =>
      PlantDataModel(
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
    dynamic? plantid,
    String? plantname,
    bool? isactive,
  }) {
    _plantid = plantid;
    _plantname = plantname;
    _isactive = isactive;
  }

  Data.fromJson(dynamic json) {
    _plantid = json['plantid'];
    _plantname = json['plantname'];
    _isactive = json['isactive'];
  }
  dynamic? _plantid;
  String? _plantname;
  bool? _isactive;
  Data copyWith({
    dynamic? plantid,
    String? plantname,
    bool? isactive,
  }) =>
      Data(
        plantid: plantid ?? _plantid,
        plantname: plantname ?? _plantname,
        isactive: isactive ?? _isactive,
      );
  dynamic? get plantid => _plantid;
  String? get plantname => _plantname;
  bool? get isactive => _isactive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantid'] = _plantid;
    map['plantname'] = _plantname;
    map['isactive'] = _isactive;
    return map;
  }
}
