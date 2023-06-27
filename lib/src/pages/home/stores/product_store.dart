import 'package:api_consumer/src/data/http/exceptions.dart';
import 'package:api_consumer/src/data/models/product_model.dart';
import 'package:api_consumer/src/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

class ProductStore {
  final IProductRepository repository;

  ProductStore({
    required this.repository,
  });

  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  final ValueNotifier<List<ProductModel>> state =
      ValueNotifier<List<ProductModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getProducts() async {
    isLoading.value = true;

    try {
      final result = await repository.getProduct();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
