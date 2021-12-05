import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/api/api.dart';
import 'package:flutter_assignment/bloc/product-states.dart';
import 'package:flutter_assignment/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductLoading());
  final Dio dio = Dio();
  late List<Product> productList;

  Future<void> loadProducts() async {
    try {
      emit(ProductLoading());
      var localDataExists = await Hive.boxExists('product');
      log('Box-exists: $localDataExists');
      var box = await Hive.openBox<Product>('product');
      if (!localDataExists) {
        var response = await dio.get(AssignmentUrl.apiUrl);
        var data = response.data;
        if (data != null) {
          productList = List<Product>.from(
            data['Products'].map(
              (e) => Product.fromMap(e),
            ),
          );
          await box.addAll(productList);
          log('Product-saved-locally');
          emit(ProductLoaded(productList));
        } else {
          emit(ProductNotLoaded());
        }
      } else if (localDataExists) {
        productList =
            List<Product>.from(box.toMap().values.map((e) => e).toList());
        emit(ProductLoaded(productList));
      }
      box.close();
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> searchProduct(String text) async {
    try {
      emit(ProductLoading());
      var localDataExists = await Hive.boxExists('product');
      log('Box-exists: $localDataExists');
      var box = await Hive.openBox<Product>('product');
      if (localDataExists) {
        productList =
            List<Product>.from(box.toMap().values.map((e) => e).toList());
        var searchProductList = productList.where((element) {
          return element.color.toLowerCase().contains(text.toLowerCase()) ||
              element.name.toLowerCase().contains(text.toLowerCase()) ||
              element.collection.toLowerCase().contains(text.toLowerCase());
        });
        emit(ProductLoaded(searchProductList.toList()));
      }
    } catch (error) {}
  }
}
