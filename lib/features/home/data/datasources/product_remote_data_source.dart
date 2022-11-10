import 'dart:convert';

import '../../../../core/api/api_interceptor.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/api/url_creator.dart';
import '../../../../core/device/network_info.dart';
import '../../../../core/erros/exception.dart';
import '../models/product_model.dart';

abstract class IProductRemoteDataSource {
  Future<List<ProductsModel>> productList();
}

class ProductRemoteDataSource implements IProductRemoteDataSource {
  final IHttpClient client;
  final INetworkInfo networkInfo;
  final IUrlCreator urlCreator;

  ProductRemoteDataSource(this.networkInfo, this.client, this.urlCreator);

  @override
  Future<List<ProductsModel>> productList() async {
    if (await networkInfo.isConnectd) {
      final response =
          await client.get(urlCreator.create(endpoint: EndPoints.products));
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          final deliciaList = responseJson['results'] as List;
          return deliciaList.map((e) => ProductsModel.fromJson(e)).toList();
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
