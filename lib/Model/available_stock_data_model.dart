class AvailableStockDataModel {
  AvailableStockDataModel({
    bool? status,
    String? message,
    List<Data>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  AvailableStockDataModel.fromJson(dynamic json) {
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
  AvailableStockDataModel copyWith({
    bool? status,
    String? message,
    List<Data>? data,
  }) =>
      AvailableStockDataModel(
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
    String? productcode,
    String? plantcode,
    String? productdesc,
    String? division,
    dynamic? marketsectorid,
    dynamic? productgroupid,
    dynamic? productsubgroupid,
    dynamic? productcategoryid,
    dynamic? availbleQty,
    dynamic? packsize,
    dynamic? uomid,
    dynamic? mrp,
    dynamic? dpl,
    String? uomname,
    String? marketsectorname,
    String? productgroupname,
    String? productsubgroupname,
    String? productcategoryname,
    dynamic? openorderQty,
    String? lastUpdatedOn,
  }) {
    _productcode = productcode;
    _plantcode = plantcode;
    _productdesc = productdesc;
    _division = division;
    _marketsectorid = marketsectorid;
    _productgroupid = productgroupid;
    _productsubgroupid = productsubgroupid;
    _productcategoryid = productcategoryid;
    _availbleQty = availbleQty;
    _packsize = packsize;
    _uomid = uomid;
    _mrp = mrp;
    _dpl = dpl;
    _uomname = uomname;
    _marketsectorname = marketsectorname;
    _productgroupname = productgroupname;
    _productsubgroupname = productsubgroupname;
    _productcategoryname = productcategoryname;
    _openorderQty = openorderQty;
    _lastUpdatedOn = lastUpdatedOn;
  }

  Data.fromJson(dynamic json) {
    _productcode = json['productcode'];
    _plantcode = json['plantcode'];
    _productdesc = json['productdesc'];
    _division = json['division'];
    _marketsectorid = json['marketsectorid'];
    _productgroupid = json['productgroupid'];
    _productsubgroupid = json['productsubgroupid'];
    _productcategoryid = json['productcategoryid'];
    _availbleQty = json['AvailbleQty'];
    _packsize = json['packsize'];
    _uomid = json['uomid'];
    _mrp = json['mrp'];
    _dpl = json['dpl'];
    _uomname = json['uomname'];
    _marketsectorname = json['marketsectorname'];
    _productgroupname = json['productgroupname'];
    _productsubgroupname = json['productsubgroupname'];
    _productcategoryname = json['productcategoryname'];
    _openorderQty = json['openorderQty'];
    _lastUpdatedOn = json['lastUpdatedOn'];
  }
  String? _productcode;
  String? _plantcode;
  String? _productdesc;
  String? _division;
  dynamic? _marketsectorid;
  dynamic? _productgroupid;
  dynamic? _productsubgroupid;
  dynamic? _productcategoryid;
  dynamic? _availbleQty;
  dynamic? _packsize;
  dynamic? _uomid;
  dynamic? _mrp;
  dynamic? _dpl;
  String? _uomname;
  String? _marketsectorname;
  String? _productgroupname;
  String? _productsubgroupname;
  String? _productcategoryname;
  dynamic? _openorderQty;
  String? _lastUpdatedOn;
  Data copyWith({
    String? productcode,
    String? plantcode,
    String? productdesc,
    String? division,
    dynamic? marketsectorid,
    dynamic? productgroupid,
    dynamic? productsubgroupid,
    dynamic? productcategoryid,
    dynamic? availbleQty,
    dynamic? packsize,
    dynamic? uomid,
    dynamic? mrp,
    dynamic? dpl,
    String? uomname,
    String? marketsectorname,
    String? productgroupname,
    String? productsubgroupname,
    String? productcategoryname,
    dynamic? openorderQty,
    String? lastUpdatedOn,
  }) =>
      Data(
        productcode: productcode ?? _productcode,
        plantcode: plantcode ?? _plantcode,
        productdesc: productdesc ?? _productdesc,
        division: division ?? _division,
        marketsectorid: marketsectorid ?? _marketsectorid,
        productgroupid: productgroupid ?? _productgroupid,
        productsubgroupid: productsubgroupid ?? _productsubgroupid,
        productcategoryid: productcategoryid ?? _productcategoryid,
        availbleQty: availbleQty ?? _availbleQty,
        packsize: packsize ?? _packsize,
        uomid: uomid ?? _uomid,
        mrp: mrp ?? _mrp,
        dpl: dpl ?? _dpl,
        uomname: uomname ?? _uomname,
        marketsectorname: marketsectorname ?? _marketsectorname,
        productgroupname: productgroupname ?? _productgroupname,
        productsubgroupname: productsubgroupname ?? _productsubgroupname,
        productcategoryname: productcategoryname ?? _productcategoryname,
        openorderQty: openorderQty ?? _openorderQty,
        lastUpdatedOn: lastUpdatedOn ?? _lastUpdatedOn,
      );
  String? get productcode => _productcode;
  String? get plantcode => _plantcode;
  String? get productdesc => _productdesc;
  String? get division => _division;
  dynamic? get marketsectorid => _marketsectorid;
  dynamic? get productgroupid => _productgroupid;
  dynamic? get productsubgroupid => _productsubgroupid;
  dynamic? get productcategoryid => _productcategoryid;
  dynamic? get availbleQty => _availbleQty;
  dynamic? get packsize => _packsize;
  dynamic? get uomid => _uomid;
  dynamic? get mrp => _mrp;
  dynamic? get dpl => _dpl;
  String? get uomname => _uomname;
  String? get marketsectorname => _marketsectorname;
  String? get productgroupname => _productgroupname;
  String? get productsubgroupname => _productsubgroupname;
  String? get productcategoryname => _productcategoryname;
  dynamic? get openorderQty => _openorderQty;
  String? get lastUpdatedOn => _lastUpdatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productcode'] = _productcode;
    map['plantcode'] = _plantcode;
    map['productdesc'] = _productdesc;
    map['division'] = _division;
    map['marketsectorid'] = _marketsectorid;
    map['productgroupid'] = _productgroupid;
    map['productsubgroupid'] = _productsubgroupid;
    map['productcategoryid'] = _productcategoryid;
    map['AvailbleQty'] = _availbleQty;
    map['packsize'] = _packsize;
    map['uomid'] = _uomid;
    map['mrp'] = _mrp;
    map['dpl'] = _dpl;
    map['uomname'] = _uomname;
    map['marketsectorname'] = _marketsectorname;
    map['productgroupname'] = _productgroupname;
    map['productsubgroupname'] = _productsubgroupname;
    map['productcategoryname'] = _productcategoryname;
    map['openorderQty'] = _openorderQty;
    map['lastUpdatedOn'] = _lastUpdatedOn;
    return map;
  }
}
