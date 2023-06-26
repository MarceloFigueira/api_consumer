import 'package:api_consumer/src/data/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProduct();
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getProduct() {
    throw UnimplementedError();
  }
}
