class MarketSectorModel {
  MarketSectorModel({
    bool? status,
    String? message,
    List<MarketSectorList>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  MarketSectorModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(MarketSectorList.fromJson(v));
      });
    }
  }

  bool? _status;
  String? _message;
  List<MarketSectorList>? _data;

  MarketSectorModel copyWith({
    bool? status,
    String? message,
    List<MarketSectorList>? data,
  }) =>
      MarketSectorModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  List<MarketSectorList>? get data => _data;

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

class MarketSectorList {
  MarketSectorList({
    dynamic? marketsectorid,
    String? marketsectorcode,
    String? marketsectorname,
    bool? isValid,
    String? createdon,
    String? updatedon,
    String? status,
  }) {
    _marketsectorid = marketsectorid;
    _marketsectorcode = marketsectorcode;
    _marketsectorname = marketsectorname;
    _isValid = isValid;
    _createdon = createdon;
    _updatedon = updatedon;
    _status = status;
  }

  MarketSectorList.fromJson(dynamic json) {
    _marketsectorid = json['marketsectorid'];
    _marketsectorcode = json['marketsectorcode'];
    _marketsectorname = json['marketsectorname'];
    _isValid = json['isValid'];
    _createdon = json['createdon'];
    _updatedon = json['updatedon'];
    _status = json['Status'];
  }

  dynamic? _marketsectorid;
  String? _marketsectorcode;
  String? _marketsectorname;
  bool? _isValid;
  String? _createdon;
  String? _updatedon;
  String? _status;

  MarketSectorList copyWith({
    num? marketsectorid,
    String? marketsectorcode,
    String? marketsectorname,
    bool? isValid,
    String? createdon,
    String? updatedon,
    String? status,
  }) =>
      MarketSectorList(
        marketsectorid: marketsectorid ?? _marketsectorid,
        marketsectorcode: marketsectorcode ?? _marketsectorcode,
        marketsectorname: marketsectorname ?? _marketsectorname,
        isValid: isValid ?? _isValid,
        createdon: createdon ?? _createdon,
        updatedon: updatedon ?? _updatedon,
        status: status ?? _status,
      );

  dynamic? get marketsectorid => _marketsectorid;

  String? get marketsectorcode => _marketsectorcode;

  String? get marketsectorname => _marketsectorname;

  bool? get isValid => _isValid;

  String? get createdon => _createdon;

  String? get updatedon => _updatedon;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['marketsectorid'] = _marketsectorid;
    map['marketsectorcode'] = _marketsectorcode;
    map['marketsectorname'] = _marketsectorname;
    map['isValid'] = _isValid;
    map['createdon'] = _createdon;
    map['updatedon'] = _updatedon;
    map['Status'] = _status;
    return map;
  }
}
