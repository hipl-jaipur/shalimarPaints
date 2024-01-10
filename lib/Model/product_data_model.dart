class ProductDataModel {
  ProductDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ProductDataModel.fromJson(dynamic json) {
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
ProductDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ProductDataModel(  status: status ?? _status,
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
      num? productid, 
      num? marketsectorid, 
      String? marketsectorname, 
      num? productgroupid, 
      String? productgroupname, 
      num? productsubgroupid, 
      String? productsubgroupname, 
      num? productcategoryid, 
      String? productcategoryname, 
      String? productcode, 
      String? productdesc, 
      String? type, 
      num? packsize, 
      num? uomid, 
      num? dpl, 
      num? mrp, 
      num? contractrate, 
      String? division, 
      num? isValid, 
      String? createdon, 
      String? updatedon,}){
    _productid = productid;
    _marketsectorid = marketsectorid;
    _marketsectorname = marketsectorname;
    _productgroupid = productgroupid;
    _productgroupname = productgroupname;
    _productsubgroupid = productsubgroupid;
    _productsubgroupname = productsubgroupname;
    _productcategoryid = productcategoryid;
    _productcategoryname = productcategoryname;
    _productcode = productcode;
    _productdesc = productdesc;
    _type = type;
    _packsize = packsize;
    _uomid = uomid;
    _dpl = dpl;
    _mrp = mrp;
    _contractrate = contractrate;
    _division = division;
    _isValid = isValid;
    _createdon = createdon;
    _updatedon = updatedon;
}

  Data.fromJson(dynamic json) {
    _productid = json['productid'];
    _marketsectorid = json['marketsectorid'];
    _marketsectorname = json['marketsectorname'];
    _productgroupid = json['productgroupid'];
    _productgroupname = json['productgroupname'];
    _productsubgroupid = json['productsubgroupid'];
    _productsubgroupname = json['productsubgroupname'];
    _productcategoryid = json['productcategoryid'];
    _productcategoryname = json['productcategoryname'];
    _productcode = json['productcode'];
    _productdesc = json['productdesc'];
    _type = json['type'];
    _packsize = json['packsize'];
    _uomid = json['uomid'];
    _dpl = json['dpl'];
    _mrp = json['mrp'];
    _contractrate = json['contractrate'];
    _division = json['division'];
    _isValid = json['isValid'];
    _createdon = json['createdon'];
    _updatedon = json['updatedon'];
  }
  num? _productid;
  num? _marketsectorid;
  String? _marketsectorname;
  num? _productgroupid;
  String? _productgroupname;
  num? _productsubgroupid;
  String? _productsubgroupname;
  num? _productcategoryid;
  String? _productcategoryname;
  String? _productcode;
  String? _productdesc;
  String? _type;
  num? _packsize;
  num? _uomid;
  num? _dpl;
  num? _mrp;
  num? _contractrate;
  String? _division;
  num? _isValid;
  String? _createdon;
  String? _updatedon;
Data copyWith({  num? productid,
  num? marketsectorid,
  String? marketsectorname,
  num? productgroupid,
  String? productgroupname,
  num? productsubgroupid,
  String? productsubgroupname,
  num? productcategoryid,
  String? productcategoryname,
  String? productcode,
  String? productdesc,
  String? type,
  num? packsize,
  num? uomid,
  num? dpl,
  num? mrp,
  num? contractrate,
  String? division,
  num? isValid,
  String? createdon,
  String? updatedon,
}) => Data(  productid: productid ?? _productid,
  marketsectorid: marketsectorid ?? _marketsectorid,
  marketsectorname: marketsectorname ?? _marketsectorname,
  productgroupid: productgroupid ?? _productgroupid,
  productgroupname: productgroupname ?? _productgroupname,
  productsubgroupid: productsubgroupid ?? _productsubgroupid,
  productsubgroupname: productsubgroupname ?? _productsubgroupname,
  productcategoryid: productcategoryid ?? _productcategoryid,
  productcategoryname: productcategoryname ?? _productcategoryname,
  productcode: productcode ?? _productcode,
  productdesc: productdesc ?? _productdesc,
  type: type ?? _type,
  packsize: packsize ?? _packsize,
  uomid: uomid ?? _uomid,
  dpl: dpl ?? _dpl,
  mrp: mrp ?? _mrp,
  contractrate: contractrate ?? _contractrate,
  division: division ?? _division,
  isValid: isValid ?? _isValid,
  createdon: createdon ?? _createdon,
  updatedon: updatedon ?? _updatedon,
);
  num? get productid => _productid;
  num? get marketsectorid => _marketsectorid;
  String? get marketsectorname => _marketsectorname;
  num? get productgroupid => _productgroupid;
  String? get productgroupname => _productgroupname;
  num? get productsubgroupid => _productsubgroupid;
  String? get productsubgroupname => _productsubgroupname;
  num? get productcategoryid => _productcategoryid;
  String? get productcategoryname => _productcategoryname;
  String? get productcode => _productcode;
  String? get productdesc => _productdesc;
  String? get type => _type;
  num? get packsize => _packsize;
  num? get uomid => _uomid;
  num? get dpl => _dpl;
  num? get mrp => _mrp;
  num? get contractrate => _contractrate;
  String? get division => _division;
  num? get isValid => _isValid;
  String? get createdon => _createdon;
  String? get updatedon => _updatedon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productid'] = _productid;
    map['marketsectorid'] = _marketsectorid;
    map['marketsectorname'] = _marketsectorname;
    map['productgroupid'] = _productgroupid;
    map['productgroupname'] = _productgroupname;
    map['productsubgroupid'] = _productsubgroupid;
    map['productsubgroupname'] = _productsubgroupname;
    map['productcategoryid'] = _productcategoryid;
    map['productcategoryname'] = _productcategoryname;
    map['productcode'] = _productcode;
    map['productdesc'] = _productdesc;
    map['type'] = _type;
    map['packsize'] = _packsize;
    map['uomid'] = _uomid;
    map['dpl'] = _dpl;
    map['mrp'] = _mrp;
    map['contractrate'] = _contractrate;
    map['division'] = _division;
    map['isValid'] = _isValid;
    map['createdon'] = _createdon;
    map['updatedon'] = _updatedon;
    return map;
  }

}