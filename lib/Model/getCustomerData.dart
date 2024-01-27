class GetCustomerData {
  GetCustomerData({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetCustomerData.fromJson(dynamic json) {
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
GetCustomerData copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetCustomerData(  status: status ?? _status,
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
      dynamic? customerid,
      String? customercode, 
      String? customername, 
      String? address1, 
      String? address2, 
      String? address3, 
      String? city, 
      String? postalcode, 
      String? district, 
      num? territoryid, 
      String? territoryName, 
      num? customerGroupID, 
      String? customerGroupName, 
      String? customertypeid, 
      String? customertype, 
      String? telephone, 
      String? telephone2, 
      String? club, 
      String? parentdalercode, 
      bool? isvalid, 
      dynamic distributionChannel, 
      num? potential, 
      dynamic paymentTerm, 
      dynamic latitude, 
      dynamic longitude, 
      String? createdon, 
      String? updatedon, 
      String? image, 
      String? zoneName, 
      String? depotName, 
      bool? isvalid1, 
      dynamic islock, 
      String? column1, 
      String? status,}){
    _customerid = customerid;
    _customercode = customercode;
    _customername = customername;
    _address1 = address1;
    _address2 = address2;
    _address3 = address3;
    _city = city;
    _postalcode = postalcode;
    _district = district;
    _territoryid = territoryid;
    _territoryName = territoryName;
    _customerGroupID = customerGroupID;
    _customerGroupName = customerGroupName;
    _customertypeid = customertypeid;
    _customertype = customertype;
    _telephone = telephone;
    _telephone2 = telephone2;
    _club = club;
    _parentdalercode = parentdalercode;
    _isvalid = isvalid;
    _distributionChannel = distributionChannel;
    _potential = potential;
    _paymentTerm = paymentTerm;
    _latitude = latitude;
    _longitude = longitude;
    _createdon = createdon;
    _updatedon = updatedon;
    _image = image;
    _zoneName = zoneName;
    _depotName = depotName;
    _isvalid1 = isvalid1;
    _islock = islock;
    _column1 = column1;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _customerid = json['customerid'];
    _customercode = json['customercode'];
    _customername = json['customername'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _address3 = json['address3'];
    _city = json['city'];
    _postalcode = json['postalcode'];
    _district = json['district'];
    _territoryid = json['territoryid'];
    _territoryName = json['territory_name'];
    _customerGroupID = json['customer_GroupID'];
    _customerGroupName = json['Customer_GroupName'];
    _customertypeid = json['customertypeid'];
    _customertype = json['customertype'];
    _telephone = json['telephone'];
    _telephone2 = json['telephone2'];
    _club = json['club'];
    _parentdalercode = json['parentdalercode'];
    _isvalid = json['isvalid'];
    _distributionChannel = json['distribution_channel'];
    _potential = json['potential'];
    _paymentTerm = json['PaymentTerm'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _createdon = json['createdon'];
    _updatedon = json['updatedon'];
    _image = json['Image'];
    _zoneName = json['zone_name'];
    _depotName = json['depot_name'];
    _isvalid1 = json['isvalid1'];
    _islock = json['islock'];
    _column1 = json['Column1'];
    _status = json['Status'];
  }
  dynamic? _customerid;
  String? _customercode;
  String? _customername;
  String? _address1;
  String? _address2;
  String? _address3;
  String? _city;
  String? _postalcode;
  String? _district;
  num? _territoryid;
  String? _territoryName;
  num? _customerGroupID;
  String? _customerGroupName;
  String? _customertypeid;
  String? _customertype;
  String? _telephone;
  String? _telephone2;
  String? _club;
  String? _parentdalercode;
  bool? _isvalid;
  dynamic _distributionChannel;
  num? _potential;
  dynamic _paymentTerm;
  dynamic _latitude;
  dynamic _longitude;
  String? _createdon;
  String? _updatedon;
  String? _image;
  String? _zoneName;
  String? _depotName;
  bool? _isvalid1;
  dynamic _islock;
  String? _column1;
  String? _status;
Data copyWith({  dynamic? customerid,
  String? customercode,
  String? customername,
  String? address1,
  String? address2,
  String? address3,
  String? city,
  String? postalcode,
  String? district,
  num? territoryid,
  String? territoryName,
  num? customerGroupID,
  String? customerGroupName,
  String? customertypeid,
  String? customertype,
  String? telephone,
  String? telephone2,
  String? club,
  String? parentdalercode,
  bool? isvalid,
  dynamic distributionChannel,
  num? potential,
  dynamic paymentTerm,
  dynamic latitude,
  dynamic longitude,
  String? createdon,
  String? updatedon,
  String? image,
  String? zoneName,
  String? depotName,
  bool? isvalid1,
  dynamic islock,
  String? column1,
  String? status,
}) => Data(  customerid: customerid ?? _customerid,
  customercode: customercode ?? _customercode,
  customername: customername ?? _customername,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  address3: address3 ?? _address3,
  city: city ?? _city,
  postalcode: postalcode ?? _postalcode,
  district: district ?? _district,
  territoryid: territoryid ?? _territoryid,
  territoryName: territoryName ?? _territoryName,
  customerGroupID: customerGroupID ?? _customerGroupID,
  customerGroupName: customerGroupName ?? _customerGroupName,
  customertypeid: customertypeid ?? _customertypeid,
  customertype: customertype ?? _customertype,
  telephone: telephone ?? _telephone,
  telephone2: telephone2 ?? _telephone2,
  club: club ?? _club,
  parentdalercode: parentdalercode ?? _parentdalercode,
  isvalid: isvalid ?? _isvalid,
  distributionChannel: distributionChannel ?? _distributionChannel,
  potential: potential ?? _potential,
  paymentTerm: paymentTerm ?? _paymentTerm,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdon: createdon ?? _createdon,
  updatedon: updatedon ?? _updatedon,
  image: image ?? _image,
  zoneName: zoneName ?? _zoneName,
  depotName: depotName ?? _depotName,
  isvalid1: isvalid1 ?? _isvalid1,
  islock: islock ?? _islock,
  column1: column1 ?? _column1,
  status: status ?? _status,
);
  dynamic? get customerid => _customerid;
  String? get customercode => _customercode;
  String? get customername => _customername;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get address3 => _address3;
  String? get city => _city;
  String? get postalcode => _postalcode;
  String? get district => _district;
  num? get territoryid => _territoryid;
  String? get territoryName => _territoryName;
  num? get customerGroupID => _customerGroupID;
  String? get customerGroupName => _customerGroupName;
  String? get customertypeid => _customertypeid;
  String? get customertype => _customertype;
  String? get telephone => _telephone;
  String? get telephone2 => _telephone2;
  String? get club => _club;
  String? get parentdalercode => _parentdalercode;
  bool? get isvalid => _isvalid;
  dynamic get distributionChannel => _distributionChannel;
  num? get potential => _potential;
  dynamic get paymentTerm => _paymentTerm;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  String? get createdon => _createdon;
  String? get updatedon => _updatedon;
  String? get image => _image;
  String? get zoneName => _zoneName;
  String? get depotName => _depotName;
  bool? get isvalid1 => _isvalid1;
  dynamic get islock => _islock;
  String? get column1 => _column1;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerid'] = _customerid;
    map['customercode'] = _customercode;
    map['customername'] = _customername;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['address3'] = _address3;
    map['city'] = _city;
    map['postalcode'] = _postalcode;
    map['district'] = _district;
    map['territoryid'] = _territoryid;
    map['territory_name'] = _territoryName;
    map['customer_GroupID'] = _customerGroupID;
    map['Customer_GroupName'] = _customerGroupName;
    map['customertypeid'] = _customertypeid;
    map['customertype'] = _customertype;
    map['telephone'] = _telephone;
    map['telephone2'] = _telephone2;
    map['club'] = _club;
    map['parentdalercode'] = _parentdalercode;
    map['isvalid'] = _isvalid;
    map['distribution_channel'] = _distributionChannel;
    map['potential'] = _potential;
    map['PaymentTerm'] = _paymentTerm;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['createdon'] = _createdon;
    map['updatedon'] = _updatedon;
    map['Image'] = _image;
    map['zone_name'] = _zoneName;
    map['depot_name'] = _depotName;
    map['isvalid1'] = _isvalid1;
    map['islock'] = _islock;
    map['Column1'] = _column1;
    map['Status'] = _status;
    return map;
  }

}