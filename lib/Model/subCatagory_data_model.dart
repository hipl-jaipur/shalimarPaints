class SubCatagoryDataModel {
  SubCatagoryDataModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SubCatagoryDataModel.fromJson(dynamic json) {
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
SubCatagoryDataModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => SubCatagoryDataModel(  status: status ?? _status,
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
      num? subCategoryID, 
      num? categoryID, 
      String? categoryName, 
      String? subcategoryName, 
      num? isValid, 
      String? createOn, 
      String? updatedOn,}){
    _subCategoryID = subCategoryID;
    _categoryID = categoryID;
    _categoryName = categoryName;
    _subcategoryName = subcategoryName;
    _isValid = isValid;
    _createOn = createOn;
    _updatedOn = updatedOn;
}

  Data.fromJson(dynamic json) {
    _subCategoryID = json['SubCategoryID'];
    _categoryID = json['CategoryID'];
    _categoryName = json['CategoryName'];
    _subcategoryName = json['SubcategoryName'];
    _isValid = json['IsValid'];
    _createOn = json['CreateOn'];
    _updatedOn = json['UpdatedOn'];
  }
  num? _subCategoryID;
  num? _categoryID;
  String? _categoryName;
  String? _subcategoryName;
  num? _isValid;
  String? _createOn;
  String? _updatedOn;
Data copyWith({  num? subCategoryID,
  num? categoryID,
  String? categoryName,
  String? subcategoryName,
  num? isValid,
  String? createOn,
  String? updatedOn,
}) => Data(  subCategoryID: subCategoryID ?? _subCategoryID,
  categoryID: categoryID ?? _categoryID,
  categoryName: categoryName ?? _categoryName,
  subcategoryName: subcategoryName ?? _subcategoryName,
  isValid: isValid ?? _isValid,
  createOn: createOn ?? _createOn,
  updatedOn: updatedOn ?? _updatedOn,
);
  num? get subCategoryID => _subCategoryID;
  num? get categoryID => _categoryID;
  String? get categoryName => _categoryName;
  String? get subcategoryName => _subcategoryName;
  num? get isValid => _isValid;
  String? get createOn => _createOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SubCategoryID'] = _subCategoryID;
    map['CategoryID'] = _categoryID;
    map['CategoryName'] = _categoryName;
    map['SubcategoryName'] = _subcategoryName;
    map['IsValid'] = _isValid;
    map['CreateOn'] = _createOn;
    map['UpdatedOn'] = _updatedOn;
    return map;
  }

}