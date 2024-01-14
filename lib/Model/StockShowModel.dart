class StockShowModel {
  StockShowModel({
      bool? status, 
      String? message, 
      List<StockMaster>? stockMaster,}){
    _status = status;
    _message = message;
    _stockMaster = stockMaster;
}

  StockShowModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['StockMaster'] != null) {
      _stockMaster = [];
      json['StockMaster'].forEach((v) {
        _stockMaster?.add(StockMaster.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<StockMaster>? _stockMaster;
StockShowModel copyWith({  bool? status,
  String? message,
  List<StockMaster>? stockMaster,
}) => StockShowModel(  status: status ?? _status,
  message: message ?? _message,
  stockMaster: stockMaster ?? _stockMaster,
);
  bool? get status => _status;
  String? get message => _message;
  List<StockMaster>? get stockMaster => _stockMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Message'] = _message;
    if (_stockMaster != null) {
      map['StockMaster'] = _stockMaster?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StockMaster {
  StockMaster({
      String? productcode, 
      dynamic? marketsectorid, 
      String? marketsectorname, 
      String? productdesc, 
      String? uomname, 
      dynamic? dpl, 
      dynamic? mrp, 
      dynamic? packsize, 
      List<StockDetailMaster>? stockDetailMaster,}){
    _productcode = productcode;
    _marketsectorid = marketsectorid;
    _marketsectorname = marketsectorname;
    _productdesc = productdesc;
    _uomname = uomname;
    _dpl = dpl;
    _mrp = mrp;
    _packsize = packsize;
    _stockDetailMaster = stockDetailMaster;
}

  StockMaster.fromJson(dynamic json) {
    _productcode = json['productcode'];
    _marketsectorid = json['marketsectorid'];
    _marketsectorname = json['marketsectorname'];
    _productdesc = json['productdesc'];
    _uomname = json['uomname'];
    _dpl = json['dpl'];
    _mrp = json['mrp'];
    _packsize = json['packsize'];
    if (json['StockDetailMaster'] != null) {
      _stockDetailMaster = [];
      json['StockDetailMaster'].forEach((v) {
        _stockDetailMaster?.add(StockDetailMaster.fromJson(v));
      });
    }
  }
  String? _productcode;
  dynamic? _marketsectorid;
  String? _marketsectorname;
  String? _productdesc;
  String? _uomname;
  dynamic? _dpl;
  dynamic? _mrp;
  dynamic? _packsize;
  List<StockDetailMaster>? _stockDetailMaster;
StockMaster copyWith({  String? productcode,
  dynamic? marketsectorid,
  String? marketsectorname,
  String? productdesc,
  String? uomname,
  dynamic? dpl,
  dynamic? mrp,
  dynamic? packsize,
  List<StockDetailMaster>? stockDetailMaster,
}) => StockMaster(  productcode: productcode ?? _productcode,
  marketsectorid: marketsectorid ?? _marketsectorid,
  marketsectorname: marketsectorname ?? _marketsectorname,
  productdesc: productdesc ?? _productdesc,
  uomname: uomname ?? _uomname,
  dpl: dpl ?? _dpl,
  mrp: mrp ?? _mrp,
  packsize: packsize ?? _packsize,
  stockDetailMaster: stockDetailMaster ?? _stockDetailMaster,
);
  String? get productcode => _productcode;
  dynamic? get marketsectorid => _marketsectorid;
  String? get marketsectorname => _marketsectorname;
  String? get productdesc => _productdesc;
  String? get uomname => _uomname;
  dynamic? get dpl => _dpl;
  dynamic? get mrp => _mrp;
  dynamic? get packsize => _packsize;
  List<StockDetailMaster>? get stockDetailMaster => _stockDetailMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productcode'] = _productcode;
    map['marketsectorid'] = _marketsectorid;
    map['marketsectorname'] = _marketsectorname;
    map['productdesc'] = _productdesc;
    map['uomname'] = _uomname;
    map['dpl'] = _dpl;
    map['mrp'] = _mrp;
    map['packsize'] = _packsize;
    if (_stockDetailMaster != null) {
      map['StockDetailMaster'] = _stockDetailMaster?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class StockDetailMaster {
  StockDetailMaster({
      String? productcode, 
      dynamic? depotId, 
      String? depotName, 
      String? depotCode, 
      dynamic? availbleQty, 
      dynamic? amount,}){
    _productcode = productcode;
    _depotId = depotId;
    _depotName = depotName;
    _depotCode = depotCode;
    _availbleQty = availbleQty;
    _amount = amount;
}

  StockDetailMaster.fromJson(dynamic json) {
    _productcode = json['productcode'];
    _depotId = json['depot_id'];
    _depotName = json['depot_name'];
    _depotCode = json['depot_code'];
    _availbleQty = json['AvailbleQty'];
    _amount = json['Amount'];
  }
  String? _productcode;
  dynamic? _depotId;
  String? _depotName;
  String? _depotCode;
  dynamic? _availbleQty;
  dynamic? _amount;
StockDetailMaster copyWith({  String? productcode,
  dynamic? depotId,
  String? depotName,
  String? depotCode,
  dynamic? availbleQty,
  dynamic? amount,
}) => StockDetailMaster(  productcode: productcode ?? _productcode,
  depotId: depotId ?? _depotId,
  depotName: depotName ?? _depotName,
  depotCode: depotCode ?? _depotCode,
  availbleQty: availbleQty ?? _availbleQty,
  amount: amount ?? _amount,
);
  String? get productcode => _productcode;
  dynamic? get depotId => _depotId;
  String? get depotName => _depotName;
  String? get depotCode => _depotCode;
  dynamic? get availbleQty => _availbleQty;
  dynamic? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productcode'] = _productcode;
    map['depot_id'] = _depotId;
    map['depot_name'] = _depotName;
    map['depot_code'] = _depotCode;
    map['AvailbleQty'] = _availbleQty;
    map['Amount'] = _amount;
    return map;
  }

}