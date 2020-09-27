class ProductModel {
  String _productName;
  String _imageUrl;
  int _id;
  String _price;
  bool _off;
  String _description;

  ProductModel(this._productName, this._imageUrl, this._id, this._price,
      this._off, this._description);

  String get description => _description;

  bool get off => _off;

  String get price => _price;

  int get id => _id;

  String get imageUrl => _imageUrl;

  String get productName => _productName;
}