import 'package:flutter_assignment/model/product.dart';

abstract class ProductStates {}

class ProductLoading extends ProductStates {}

class ProductLoaded extends ProductStates {
  List<Product> products;
  ProductLoaded(this.products);
}

class ProductNotLoaded extends ProductStates {}
