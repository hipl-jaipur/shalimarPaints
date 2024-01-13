class SubCatagoryDataModel {
  SubCatagoryDataModel({
    bool? status,
    String? message,
    List<SubCategory>? data,
  }) {
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
        _data?.add(SubCategory.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<SubCategory>? _data;
  SubCatagoryDataModel copyWith({
    bool? status,
    String? message,
    List<SubCategory>? data,
  }) =>
      SubCatagoryDataModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  List<SubCategory>? get data => _data;

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

class SubCategory {
  SubCategory({
    dynamic? subCategoryID,
    dynamic? categoryID,
    String? categoryName,
    String? subcategoryName,
    dynamic? isValid,
    String? createOn,
    String? updatedOn,
  }) {
    _subCategoryID = subCategoryID;
    _categoryID = categoryID;
    _categoryName = categoryName;
    _subcategoryName = subcategoryName;
    _isValid = isValid;
    _createOn = createOn;
    _updatedOn = updatedOn;
  }

  SubCategory.fromJson(dynamic json) {
    _subCategoryID = json['SubCategoryID'];
    _categoryID = json['CategoryID'];
    _categoryName = json['CategoryName'];
    _subcategoryName = json['SubcategoryName'];
    _isValid = json['IsValid'];
    _createOn = json['CreateOn'];
    _updatedOn = json['UpdatedOn'];
  }
  dynamic? _subCategoryID;
  dynamic? _categoryID;
  String? _categoryName;
  String? _subcategoryName;
  dynamic? _isValid;
  String? _createOn;
  String? _updatedOn;
  SubCategory copyWith({
    dynamic? subCategoryID,
    dynamic? categoryID,
    String? categoryName,
    String? subcategoryName,
    dynamic? isValid,
    String? createOn,
    String? updatedOn,
  }) =>
      SubCategory(
        subCategoryID: subCategoryID ?? _subCategoryID,
        categoryID: categoryID ?? _categoryID,
        categoryName: categoryName ?? _categoryName,
        subcategoryName: subcategoryName ?? _subcategoryName,
        isValid: isValid ?? _isValid,
        createOn: createOn ?? _createOn,
        updatedOn: updatedOn ?? _updatedOn,
      );
  dynamic? get subCategoryID => _subCategoryID;
  dynamic? get categoryID => _categoryID;
  String? get categoryName => _categoryName;
  String? get subcategoryName => _subcategoryName;
  dynamic? get isValid => _isValid;
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
