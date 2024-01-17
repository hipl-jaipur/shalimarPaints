class OutStandingModel {
  OutStandingModel({
      bool? status, 
      String? message, 
      List<OutStandingList>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  OutStandingModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(OutStandingList.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<OutStandingList>? _data;
OutStandingModel copyWith({  bool? status,
  String? message,
  List<OutStandingList>? data,
}) => OutStandingModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<OutStandingList>? get data => _data;

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

class OutStandingList {
  OutStandingList({
      num? zoneId,
      String? zoneCode, 
      String? zoneName, 
      num? zonemgrId,
      num? regionId,
      String? regionCode, 
      String? regionName, 
      num? regionmgrId,
      num? depotId,
      String? depotCode, 
      String? depotName, 
      num? depotmgrId,
      num? areaId,
      String? areaCode, 
      String? areaName, 
      num? areamgrId,
      num? customerid,
      String? customercode, 
      String? customername, 
      String? createdon, 
      num? potential,
      String? paymentTerm, 
      num? custActiveStatus,
      dynamic companyCode, 
      num? creditLimit,
      num? total,
      num? unadjusted,
      num? age030,
      num? age3160,
      num? age6190,
      num? age91120,
      num? age121150,
      num? age151180,
      num? age181Above,
      num? periodicTotal,}){
    _zoneId = zoneId;
    _zoneCode = zoneCode;
    _zoneName = zoneName;
    _zonemgrId = zonemgrId;
    _regionId = regionId;
    _regionCode = regionCode;
    _regionName = regionName;
    _regionmgrId = regionmgrId;
    _depotId = depotId;
    _depotCode = depotCode;
    _depotName = depotName;
    _depotmgrId = depotmgrId;
    _areaId = areaId;
    _areaCode = areaCode;
    _areaName = areaName;
    _areamgrId = areamgrId;
    _customerid = customerid;
    _customercode = customercode;
    _customername = customername;
    _createdon = createdon;
    _potential = potential;
    _paymentTerm = paymentTerm;
    _custActiveStatus = custActiveStatus;
    _companyCode = companyCode;
    _creditLimit = creditLimit;
    _total = total;
    _unadjusted = unadjusted;
    _age030 = age030;
    _age3160 = age3160;
    _age6190 = age6190;
    _age91120 = age91120;
    _age121150 = age121150;
    _age151180 = age151180;
    _age181Above = age181Above;
    _periodicTotal = periodicTotal;
}

  OutStandingList.fromJson(dynamic json) {
    _zoneId = json['zone_id'];
    _zoneCode = json['zone_code'];
    _zoneName = json['zone_name'];
    _zonemgrId = json['zonemgr_id'];
    _regionId = json['region_id'];
    _regionCode = json['region_code'];
    _regionName = json['region_name'];
    _regionmgrId = json['regionmgr_id'];
    _depotId = json['depot_id'];
    _depotCode = json['depot_code'];
    _depotName = json['depot_name'];
    _depotmgrId = json['depotmgr_id'];
    _areaId = json['area_id'];
    _areaCode = json['area_code'];
    _areaName = json['area_name'];
    _areamgrId = json['areamgr_id'];
    _customerid = json['customerid'];
    _customercode = json['customercode'];
    _customername = json['customername'];
    _createdon = json['createdon'];
    _potential = json['potential'];
    _paymentTerm = json['PaymentTerm'];
    _custActiveStatus = json['custActiveStatus'];
    _companyCode = json['CompanyCode'];
    _creditLimit = json['CreditLimit'];
    _total = json['Total'];
    _unadjusted = json['Unadjusted'];
    _age030 = json['age_0_30'];
    _age3160 = json['age_31_60'];
    _age6190 = json['age_61_90'];
    _age91120 = json['age_91_120'];
    _age121150 = json['age_121_150'];
    _age151180 = json['age_151_180'];
    _age181Above = json['age_181_above'];
    _periodicTotal = json['PeriodicTotal'];
  }
  num? _zoneId;
  String? _zoneCode;
  String? _zoneName;
  num? _zonemgrId;
  num? _regionId;
  String? _regionCode;
  String? _regionName;
  num? _regionmgrId;
  num? _depotId;
  String? _depotCode;
  String? _depotName;
  num? _depotmgrId;
  num? _areaId;
  String? _areaCode;
  String? _areaName;
  num? _areamgrId;
  num? _customerid;
  String? _customercode;
  String? _customername;
  String? _createdon;
  num? _potential;
  String? _paymentTerm;
  num? _custActiveStatus;
  dynamic _companyCode;
  num? _creditLimit;
  num? _total;
  num? _unadjusted;
  num? _age030;
  num? _age3160;
  num? _age6190;
  num? _age91120;
  num? _age121150;
  num? _age151180;
  num? _age181Above;
  num? _periodicTotal;
  OutStandingList copyWith({  num? zoneId,
  String? zoneCode,
  String? zoneName,
  num? zonemgrId,
  num? regionId,
  String? regionCode,
  String? regionName,
  num? regionmgrId,
  num? depotId,
  String? depotCode,
  String? depotName,
  num? depotmgrId,
  num? areaId,
  String? areaCode,
  String? areaName,
  num? areamgrId,
  num? customerid,
  String? customercode,
  String? customername,
  String? createdon,
  num? potential,
  String? paymentTerm,
  num? custActiveStatus,
  dynamic companyCode,
  num? creditLimit,
  num? total,
  num? unadjusted,
  num? age030,
  num? age3160,
  num? age6190,
  num? age91120,
  num? age121150,
  num? age151180,
  num? age181Above,
  num? periodicTotal,
}) => OutStandingList(  zoneId: zoneId ?? _zoneId,
  zoneCode: zoneCode ?? _zoneCode,
  zoneName: zoneName ?? _zoneName,
  zonemgrId: zonemgrId ?? _zonemgrId,
  regionId: regionId ?? _regionId,
  regionCode: regionCode ?? _regionCode,
  regionName: regionName ?? _regionName,
  regionmgrId: regionmgrId ?? _regionmgrId,
  depotId: depotId ?? _depotId,
  depotCode: depotCode ?? _depotCode,
  depotName: depotName ?? _depotName,
  depotmgrId: depotmgrId ?? _depotmgrId,
  areaId: areaId ?? _areaId,
  areaCode: areaCode ?? _areaCode,
  areaName: areaName ?? _areaName,
  areamgrId: areamgrId ?? _areamgrId,
  customerid: customerid ?? _customerid,
  customercode: customercode ?? _customercode,
  customername: customername ?? _customername,
  createdon: createdon ?? _createdon,
  potential: potential ?? _potential,
  paymentTerm: paymentTerm ?? _paymentTerm,
  custActiveStatus: custActiveStatus ?? _custActiveStatus,
  companyCode: companyCode ?? _companyCode,
  creditLimit: creditLimit ?? _creditLimit,
  total: total ?? _total,
  unadjusted: unadjusted ?? _unadjusted,
  age030: age030 ?? _age030,
  age3160: age3160 ?? _age3160,
  age6190: age6190 ?? _age6190,
  age91120: age91120 ?? _age91120,
  age121150: age121150 ?? _age121150,
  age151180: age151180 ?? _age151180,
  age181Above: age181Above ?? _age181Above,
  periodicTotal: periodicTotal ?? _periodicTotal,
);
  num? get zoneId => _zoneId;
  String? get zoneCode => _zoneCode;
  String? get zoneName => _zoneName;
  num? get zonemgrId => _zonemgrId;
  num? get regionId => _regionId;
  String? get regionCode => _regionCode;
  String? get regionName => _regionName;
  num? get regionmgrId => _regionmgrId;
  num? get depotId => _depotId;
  String? get depotCode => _depotCode;
  String? get depotName => _depotName;
  num? get depotmgrId => _depotmgrId;
  num? get areaId => _areaId;
  String? get areaCode => _areaCode;
  String? get areaName => _areaName;
  num? get areamgrId => _areamgrId;
  num? get customerid => _customerid;
  String? get customercode => _customercode;
  String? get customername => _customername;
  String? get createdon => _createdon;
  num? get potential => _potential;
  String? get paymentTerm => _paymentTerm;
  num? get custActiveStatus => _custActiveStatus;
  dynamic get companyCode => _companyCode;
  num? get creditLimit => _creditLimit;
  num? get total => _total;
  num? get unadjusted => _unadjusted;
  num? get age030 => _age030;
  num? get age3160 => _age3160;
  num? get age6190 => _age6190;
  num? get age91120 => _age91120;
  num? get age121150 => _age121150;
  num? get age151180 => _age151180;
  num? get age181Above => _age181Above;
  num? get periodicTotal => _periodicTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zone_id'] = _zoneId;
    map['zone_code'] = _zoneCode;
    map['zone_name'] = _zoneName;
    map['zonemgr_id'] = _zonemgrId;
    map['region_id'] = _regionId;
    map['region_code'] = _regionCode;
    map['region_name'] = _regionName;
    map['regionmgr_id'] = _regionmgrId;
    map['depot_id'] = _depotId;
    map['depot_code'] = _depotCode;
    map['depot_name'] = _depotName;
    map['depotmgr_id'] = _depotmgrId;
    map['area_id'] = _areaId;
    map['area_code'] = _areaCode;
    map['area_name'] = _areaName;
    map['areamgr_id'] = _areamgrId;
    map['customerid'] = _customerid;
    map['customercode'] = _customercode;
    map['customername'] = _customername;
    map['createdon'] = _createdon;
    map['potential'] = _potential;
    map['PaymentTerm'] = _paymentTerm;
    map['custActiveStatus'] = _custActiveStatus;
    map['CompanyCode'] = _companyCode;
    map['CreditLimit'] = _creditLimit;
    map['Total'] = _total;
    map['Unadjusted'] = _unadjusted;
    map['age_0_30'] = _age030;
    map['age_31_60'] = _age3160;
    map['age_61_90'] = _age6190;
    map['age_91_120'] = _age91120;
    map['age_121_150'] = _age121150;
    map['age_151_180'] = _age151180;
    map['age_181_above'] = _age181Above;
    map['PeriodicTotal'] = _periodicTotal;
    return map;
  }

}