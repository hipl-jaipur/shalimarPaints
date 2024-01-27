class LedgerStatementModel {
  LedgerStatementModel({
      bool? status, 
      String? message, 
      List<LedgerStatementMaster>? ledgerStatementMaster,}){
    _status = status;
    _message = message;
    _ledgerStatementMaster = ledgerStatementMaster;
}

  LedgerStatementModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['LedgerStatementMaster'] != null) {
      _ledgerStatementMaster = [];
      json['LedgerStatementMaster'].forEach((v) {
        _ledgerStatementMaster?.add(LedgerStatementMaster.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<LedgerStatementMaster>? _ledgerStatementMaster;
LedgerStatementModel copyWith({  bool? status,
  String? message,
  List<LedgerStatementMaster>? ledgerStatementMaster,
}) => LedgerStatementModel(  status: status ?? _status,
  message: message ?? _message,
  ledgerStatementMaster: ledgerStatementMaster ?? _ledgerStatementMaster,
);
  bool? get status => _status;
  String? get message => _message;
  List<LedgerStatementMaster>? get ledgerStatementMaster => _ledgerStatementMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Message'] = _message;
    if (_ledgerStatementMaster != null) {
      map['LedgerStatementMaster'] = _ledgerStatementMaster?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LedgerStatementMaster {
  LedgerStatementMaster({
      String? customercode, 
      String? customername, 
      String? address, 
      num? zoneId, 
      String? zoneCode, 
      String? zoneName, 
      num? regionId, 
      String? regionCode, 
      String? regionName, 
      num? depotId, 
      String? depotCode, 
      String? depotName, 
      num? territoryId, 
      String? territoryCode, 
      String? territoryName, 
      num? openBalance, 
      List<LedgerStatementDetailMaster>? ledgerStatementDetailMaster,}){
    _customercode = customercode;
    _customername = customername;
    _address = address;
    _zoneId = zoneId;
    _zoneCode = zoneCode;
    _zoneName = zoneName;
    _regionId = regionId;
    _regionCode = regionCode;
    _regionName = regionName;
    _depotId = depotId;
    _depotCode = depotCode;
    _depotName = depotName;
    _territoryId = territoryId;
    _territoryCode = territoryCode;
    _territoryName = territoryName;
    _openBalance = openBalance;
    _ledgerStatementDetailMaster = ledgerStatementDetailMaster;
}

  LedgerStatementMaster.fromJson(dynamic json) {
    _customercode = json['customercode'];
    _customername = json['customername'];
    _address = json['address'];
    _zoneId = json['zone_id'];
    _zoneCode = json['zone_code'];
    _zoneName = json['zone_name'];
    _regionId = json['region_id'];
    _regionCode = json['region_code'];
    _regionName = json['region_name'];
    _depotId = json['depot_id'];
    _depotCode = json['depot_code'];
    _depotName = json['depot_name'];
    _territoryId = json['territory_id'];
    _territoryCode = json['territory_code'];
    _territoryName = json['territory_name'];
    _openBalance = json['OpenBalance'];
    if (json['LedgerStatementDetailMaster'] != null) {
      _ledgerStatementDetailMaster = [];
      json['LedgerStatementDetailMaster'].forEach((v) {
        _ledgerStatementDetailMaster?.add(LedgerStatementDetailMaster.fromJson(v));
      });
    }
  }
  String? _customercode;
  String? _customername;
  String? _address;
  num? _zoneId;
  String? _zoneCode;
  String? _zoneName;
  num? _regionId;
  String? _regionCode;
  String? _regionName;
  num? _depotId;
  String? _depotCode;
  String? _depotName;
  num? _territoryId;
  String? _territoryCode;
  String? _territoryName;
  num? _openBalance;
  List<LedgerStatementDetailMaster>? _ledgerStatementDetailMaster;
LedgerStatementMaster copyWith({  String? customercode,
  String? customername,
  String? address,
  num? zoneId,
  String? zoneCode,
  String? zoneName,
  num? regionId,
  String? regionCode,
  String? regionName,
  num? depotId,
  String? depotCode,
  String? depotName,
  num? territoryId,
  String? territoryCode,
  String? territoryName,
  num? openBalance,
  List<LedgerStatementDetailMaster>? ledgerStatementDetailMaster,
}) => LedgerStatementMaster(  customercode: customercode ?? _customercode,
  customername: customername ?? _customername,
  address: address ?? _address,
  zoneId: zoneId ?? _zoneId,
  zoneCode: zoneCode ?? _zoneCode,
  zoneName: zoneName ?? _zoneName,
  regionId: regionId ?? _regionId,
  regionCode: regionCode ?? _regionCode,
  regionName: regionName ?? _regionName,
  depotId: depotId ?? _depotId,
  depotCode: depotCode ?? _depotCode,
  depotName: depotName ?? _depotName,
  territoryId: territoryId ?? _territoryId,
  territoryCode: territoryCode ?? _territoryCode,
  territoryName: territoryName ?? _territoryName,
  openBalance: openBalance ?? _openBalance,
  ledgerStatementDetailMaster: ledgerStatementDetailMaster ?? _ledgerStatementDetailMaster,
);
  String? get customercode => _customercode;
  String? get customername => _customername;
  String? get address => _address;
  num? get zoneId => _zoneId;
  String? get zoneCode => _zoneCode;
  String? get zoneName => _zoneName;
  num? get regionId => _regionId;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  num? get depotId => _depotId;
  String? get depotCode => _depotCode;
  String? get depotName => _depotName;
  num? get territoryId => _territoryId;
  String? get territoryCode => _territoryCode;
  String? get territoryName => _territoryName;
  num? get openBalance => _openBalance;
  List<LedgerStatementDetailMaster>? get ledgerStatementDetailMaster => _ledgerStatementDetailMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customercode'] = _customercode;
    map['customername'] = _customername;
    map['address'] = _address;
    map['zone_id'] = _zoneId;
    map['zone_code'] = _zoneCode;
    map['zone_name'] = _zoneName;
    map['region_id'] = _regionId;
    map['region_code'] = _regionCode;
    map['region_name'] = _regionName;
    map['depot_id'] = _depotId;
    map['depot_code'] = _depotCode;
    map['depot_name'] = _depotName;
    map['territory_id'] = _territoryId;
    map['territory_code'] = _territoryCode;
    map['territory_name'] = _territoryName;
    map['OpenBalance'] = _openBalance;
    if (_ledgerStatementDetailMaster != null) {
      map['LedgerStatementDetailMaster'] = _ledgerStatementDetailMaster?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class LedgerStatementDetailMaster {
  LedgerStatementDetailMaster({
      String? date, 
      String? documentType, 
      String? documentNo,
    dynamic? debitAmt,
    dynamic? creditAmt,
    dynamic? balance,
      String? dc, 
      String? orderreason,}){
    _date = date;
    _documentType = documentType;
    _documentNo = documentNo;
    _debitAmt = debitAmt;
    _creditAmt = creditAmt;
    _balance = balance;
    _dc = dc;
    _orderreason = orderreason;
}

  LedgerStatementDetailMaster.fromJson(dynamic json) {
    _date = json['Date'];
    _documentType = json['DocumentType'];
    _documentNo = json['DocumentNo'];
    _debitAmt = json['DebitAmt'];
    _creditAmt = json['CreditAmt'];
    _balance = json['Balance'];
    _dc = json['D_C'];
    _orderreason = json['orderreason'];
  }
  String? _date;
  String? _documentType;
  String? _documentNo;
  dynamic? _debitAmt;
  dynamic? _creditAmt;
  dynamic? _balance;
  String? _dc;
  String? _orderreason;
LedgerStatementDetailMaster copyWith({  String? date,
  String? documentType,
  String? documentNo,
  dynamic? debitAmt,
  dynamic? creditAmt,
  dynamic? balance,
  String? dc,
  String? orderreason,
}) => LedgerStatementDetailMaster(  date: date ?? _date,
  documentType: documentType ?? _documentType,
  documentNo: documentNo ?? _documentNo,
  debitAmt: debitAmt ?? _debitAmt,
  creditAmt: creditAmt ?? _creditAmt,
  balance: balance ?? _balance,
  dc: dc ?? _dc,
  orderreason: orderreason ?? _orderreason,
);
  String? get date => _date;
  String? get documentType => _documentType;
  String? get documentNo => _documentNo;
  dynamic? get debitAmt => _debitAmt;
  dynamic? get creditAmt => _creditAmt;
  dynamic? get balance => _balance;
  String? get dc => _dc;
  String? get orderreason => _orderreason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Date'] = _date;
    map['DocumentType'] = _documentType;
    map['DocumentNo'] = _documentNo;
    map['DebitAmt'] = _debitAmt;
    map['CreditAmt'] = _creditAmt;
    map['Balance'] = _balance;
    map['D_C'] = _dc;
    map['orderreason'] = _orderreason;
    return map;
  }

}