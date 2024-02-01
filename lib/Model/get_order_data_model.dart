class GetOrderDataModel {
  GetOrderDataModel({
      bool? status, 
      String? message, 
      List<OrderData>? orderData,}){
    _status = status;
    _message = message;
    _orderData = orderData;
}

  GetOrderDataModel.fromJson(dynamic json) {
    _status = json['Status'];
    _message = json['Message'];
    if (json['OrderData'] != null) {
      _orderData = [];
      json['OrderData'].forEach((v) {
        _orderData?.add(OrderData.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<OrderData>? _orderData;
GetOrderDataModel copyWith({  bool? status,
  String? message,
  List<OrderData>? orderData,
}) => GetOrderDataModel(  status: status ?? _status,
  message: message ?? _message,
  orderData: orderData ?? _orderData,
);
  bool? get status => _status;
  String? get message => _message;
  List<OrderData>? get orderData => _orderData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['Message'] = _message;
    if (_orderData != null) {
      map['OrderData'] = _orderData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderData {
  OrderData({
      num? activityDetailID,
      String? orderSource, 
      String? customercode, 
      String? customercodeshipto, 
      String? createdOn, 
      String? remarks, 
      String? ordernumber, 
      String? orderdate, 
      num? activityID,
      num? userID,
      num? latitude,
      num? longitude,
      num? orderTotalQty,
      num? orderTotalMRP,
      num? orderTotalDPL,
      String? sAPordernumber, 
      String? sAPRemark, 
      String? orderStatus, 
      String? customername, 
      String? zoneName, 
      String? depotName, 
      String? territoryName, 
      String? firstName, 
      List<OrderDetailMaster>? orderDetailMaster,}){
    _activityDetailID = activityDetailID;
    _orderSource = orderSource;
    _customercode = customercode;
    _customercodeshipto = customercodeshipto;
    _createdOn = createdOn;
    _remarks = remarks;
    _ordernumber = ordernumber;
    _orderdate = orderdate;
    _activityID = activityID;
    _userID = userID;
    _latitude = latitude;
    _longitude = longitude;
    _sAPordernumber = sAPordernumber;
    _sAPRemark = sAPRemark;
    _orderStatus = orderStatus;
    _customername = customername;
    _zoneName = zoneName;
    _depotName = depotName;
    _territoryName = territoryName;
    _firstName = firstName;
    _orderDetailMaster = orderDetailMaster;
    _orderTotalQty = orderTotalQty;
    _orderTotalMRP = orderTotalMRP;
    _orderTotalDPL = orderTotalDPL;
}

  OrderData.fromJson(dynamic json) {
    _activityDetailID = json['ActivityDetailID'];
    _orderSource = json['OrderSource'];
    _customercode = json['customercode'];
    _customercodeshipto = json['customercodeshipto'];
    _createdOn = json['CreatedOn'];
    _remarks = json['remarks'];
    _ordernumber = json['ordernumber'];
    _orderdate = json['orderdate'];
    _activityID = json['ActivityID'];
    _userID = json['UserID'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _sAPordernumber = json['SAPordernumber'];
    _sAPRemark = json['SAPRemark'];
    _orderStatus = json['OrderStatus'];
    _customername = json['customername'];
    _zoneName = json['zone_name'];
    _depotName = json['depot_name'];
    _territoryName = json['territory_name'];
    _firstName = json['FirstName'];
    _orderTotalQty = json['OrderTotalQty'];
    _orderTotalMRP = json['OrderTotalMRP'];
    _orderTotalDPL = json['OrderTotalDPL'];
    if (json['OrderDetailMaster'] != null) {
      _orderDetailMaster = [];
      json['OrderDetailMaster'].forEach((v) {
        _orderDetailMaster?.add(OrderDetailMaster.fromJson(v));
      });
    }
  }
  num? _activityDetailID;
  num? _orderTotalQty;
  num? _orderTotalMRP;
  num? _orderTotalDPL;
  String? _orderSource;
  String? _customercode;
  String? _customercodeshipto;
  String? _createdOn;
  String? _remarks;
  String? _ordernumber;
  String? _orderdate;
  num? _activityID;
  num? _userID;
  num? _latitude;
  num? _longitude;
  String? _sAPordernumber;
  String? _sAPRemark;
  String? _orderStatus;
  String? _customername;
  String? _zoneName;
  String? _depotName;
  String? _territoryName;
  String? _firstName;
  List<OrderDetailMaster>? _orderDetailMaster;
OrderData copyWith({ 
  num? activityDetailID,
  num? orderTotalDPL,
  num? orderTotalMRP,
  num? orderTotalQty,
  String? orderSource,
  String? customercode,
  String? customercodeshipto,
  String? createdOn,
  String? remarks,
  String? ordernumber,
  String? orderdate,
  num? activityID,
  num? userID,
  num? latitude,
  num? longitude,
  String? sAPordernumber,
  String? sAPRemark,
  String? orderStatus,
  String? customername,
  String? zoneName,
  String? depotName,
  String? territoryName,
  String? firstName,
  List<OrderDetailMaster>? orderDetailMaster,
}) => OrderData(  activityDetailID: activityDetailID ?? _activityDetailID,
  orderSource: orderSource ?? _orderSource,
  customercode: customercode ?? _customercode,
  customercodeshipto: customercodeshipto ?? _customercodeshipto,
  createdOn: createdOn ?? _createdOn,
  remarks: remarks ?? _remarks,
  ordernumber: ordernumber ?? _ordernumber,
  orderdate: orderdate ?? _orderdate,
  activityID: activityID ?? _activityID,
  userID: userID ?? _userID,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  sAPordernumber: sAPordernumber ?? _sAPordernumber,
  sAPRemark: sAPRemark ?? _sAPRemark,
  orderStatus: orderStatus ?? _orderStatus,
  customername: customername ?? _customername,
  zoneName: zoneName ?? _zoneName,
  depotName: depotName ?? _depotName,
  territoryName: territoryName ?? _territoryName,
  firstName: firstName ?? _firstName,
  orderTotalQty: orderTotalQty ?? _orderTotalQty,
  orderTotalMRP: orderTotalMRP ?? _orderTotalMRP,
  orderTotalDPL: orderTotalDPL ?? _orderTotalDPL,
  orderDetailMaster: orderDetailMaster ?? _orderDetailMaster,
);
  num? get activityDetailID => _activityDetailID;
  num? get orderTotalDPL => _orderTotalDPL;
  num? get orderTotalMRP => _orderTotalMRP;
  num? get orderTotalQty => _orderTotalQty;
  String? get orderSource => _orderSource;
  String? get customercode => _customercode;
  String? get customercodeshipto => _customercodeshipto;
  String? get createdOn => _createdOn;
  String? get remarks => _remarks;
  String? get ordernumber => _ordernumber;
  String? get orderdate => _orderdate;
  num? get activityID => _activityID;
  num? get userID => _userID;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  String? get sAPordernumber => _sAPordernumber;
  String? get sAPRemark => _sAPRemark;
  String? get orderStatus => _orderStatus;
  String? get customername => _customername;
  String? get zoneName => _zoneName;
  String? get depotName => _depotName;
  String? get territoryName => _territoryName;
  String? get firstName => _firstName;
  List<OrderDetailMaster>? get orderDetailMaster => _orderDetailMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ActivityDetailID'] = _activityDetailID;
    map['OrderSource'] = _orderSource;
    map['customercode'] = _customercode;
    map['customercodeshipto'] = _customercodeshipto;
    map['CreatedOn'] = _createdOn;
    map['remarks'] = _remarks;
    map['ordernumber'] = _ordernumber;
    map['orderdate'] = _orderdate;
    map['ActivityID'] = _activityID;
    map['UserID'] = _userID;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['SAPordernumber'] = _sAPordernumber;
    map['SAPRemark'] = _sAPRemark;
    map['OrderStatus'] = _orderStatus;
    map['customername'] = _customername;
    map['zone_name'] = _zoneName;
    map['depot_name'] = _depotName;
    map['territory_name'] = _territoryName;
    map['FirstName'] = _firstName;
    map['OrderTotalDPL'] = _orderTotalDPL;
    map['OrderTotalMRP'] = _orderTotalMRP;
    map['OrderTotalQty'] = _orderTotalQty;
    if (_orderDetailMaster != null) {
      map['OrderDetailMaster'] = _orderDetailMaster?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderDetailMaster {
  OrderDetailMaster({
      String? ordernumber, 
      String? productcode, 
      num? qty,
      num? dpl,
      num? mrp,
      String? productdesc, 
      String? marketsectorname, 
      String? productgroupname,}){
    _ordernumber = ordernumber;
    _productcode = productcode;
    _qty = qty;
    _dpl = dpl;
    _mrp = mrp;
    _productdesc = productdesc;
    _marketsectorname = marketsectorname;
    _productgroupname = productgroupname;
}

  OrderDetailMaster.fromJson(dynamic json) {
    _ordernumber = json['ordernumber'];
    _productcode = json['productcode'];
    _qty = json['Qty'];
    _dpl = json['dpl'];
    _mrp = json['mrp'];
    _productdesc = json['productdesc'];
    _marketsectorname = json['marketsectorname'];
    _productgroupname = json['productgroupname'];
  }
  String? _ordernumber;
  String? _productcode;
  num? _qty;
  num? _dpl;
  num? _mrp;
  String? _productdesc;
  String? _marketsectorname;
  String? _productgroupname;
OrderDetailMaster copyWith({  String? ordernumber,
  String? productcode,
  num? qty,
  num? dpl,
  num? mrp,
  String? productdesc,
  String? marketsectorname,
  String? productgroupname,
}) => OrderDetailMaster(  ordernumber: ordernumber ?? _ordernumber,
  productcode: productcode ?? _productcode,
  qty: qty ?? _qty,
  dpl: dpl ?? _dpl,
  mrp: mrp ?? _mrp,
  productdesc: productdesc ?? _productdesc,
  marketsectorname: marketsectorname ?? _marketsectorname,
  productgroupname: productgroupname ?? _productgroupname,
);
  String? get ordernumber => _ordernumber;
  String? get productcode => _productcode;
  num? get qty => _qty;
  num? get dpl => _dpl;
  num? get mrp => _mrp;
  String? get productdesc => _productdesc;
  String? get marketsectorname => _marketsectorname;
  String? get productgroupname => _productgroupname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ordernumber'] = _ordernumber;
    map['productcode'] = _productcode;
    map['Qty'] = _qty;
    map['dpl'] = _dpl;
    map['mrp'] = _mrp;
    map['productdesc'] = _productdesc;
    map['marketsectorname'] = _marketsectorname;
    map['productgroupname'] = _productgroupname;
    return map;
  }

}