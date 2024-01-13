class ProductDataModel {
  ProductDataModel({
      bool? status, 
      String? message, 
      List<Product>? data,}){
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
        _data?.add(Product.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Product>? _data;
ProductDataModel copyWith({  bool? status,
  String? message,
  List<Product>? data,
}) => ProductDataModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Product>? get data => _data;

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

class Product {
  Product({
      dynamic? productid, 
      dynamic? marketsectorid, 
      String? marketsectorname, 
      dynamic? productgroupid, 
      String? productgroupname, 
      dynamic? productsubgroupid, 
      String? productsubgroupname, 
      dynamic? productcategoryid, 
      String? productcategoryname, 
      String? productcode, 
      String? productdesc, 
      String? type, 
      dynamic? packsize, 
      dynamic? uomid, 
      dynamic? dpl, 
      dynamic? mrp, 
      dynamic? contractrate, 
      String? division, 
      dynamic? isValid, 
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

  Product.fromJson(dynamic json) {
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
  dynamic? _productid;
  dynamic? _marketsectorid;
  String? _marketsectorname;
  dynamic? _productgroupid;
  String? _productgroupname;
  dynamic? _productsubgroupid;
  String? _productsubgroupname;
  dynamic? _productcategoryid;
  String? _productcategoryname;
  String? _productcode;
  String? _productdesc;
  String? _type;
  dynamic? _packsize;
  dynamic? _uomid;
  dynamic? _dpl;
  dynamic? _mrp;
  dynamic? _contractrate;
  String? _division;
  dynamic? _isValid;
  String? _createdon;
  String? _updatedon;
Product copyWith({  dynamic? productid,
  dynamic? marketsectorid,
  String? marketsectorname,
  dynamic? productgroupid,
  String? productgroupname,
  dynamic? productsubgroupid,
  String? productsubgroupname,
  dynamic? productcategoryid,
  String? productcategoryname,
  String? productcode,
  String? productdesc,
  String? type,
  dynamic? packsize,
  dynamic? uomid,
  dynamic? dpl,
  dynamic? mrp,
  dynamic? contractrate,
  String? division,
  dynamic? isValid,
  String? createdon,
  String? updatedon,
}) => Product(  productid: productid ?? _productid,
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
  dynamic? get productid => _productid;
  dynamic? get marketsectorid => _marketsectorid;
  String? get marketsectorname => _marketsectorname;
  dynamic? get productgroupid => _productgroupid;
  String? get productgroupname => _productgroupname;
  dynamic? get productsubgroupid => _productsubgroupid;
  String? get productsubgroupname => _productsubgroupname;
  dynamic? get productcategoryid => _productcategoryid;
  String? get productcategoryname => _productcategoryname;
  String? get productcode => _productcode;
  String? get productdesc => _productdesc;
  String? get type => _type;
  dynamic? get packsize => _packsize;
  dynamic? get uomid => _uomid;
  dynamic? get dpl => _dpl;
  dynamic? get mrp => _mrp;
  dynamic? get contractrate => _contractrate;
  String? get division => _division;
  dynamic? get isValid => _isValid;
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