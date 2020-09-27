import 'ProductModel.dart';

class ShoppingBasketData{
  static ShoppingBasketData _instance;

  List<ProductModel> _listItems;

  ShoppingBasketData(){
    _listItems = List<ProductModel>();
  }


  List<ProductModel> get listItems => _listItems;

  set listItems(List<ProductModel> value) {
    _listItems = value;
  }

  static ShoppingBasketData getInstance(){
    if (_instance == null){
      _instance = ShoppingBasketData();
    }
    return _instance;
  }
}