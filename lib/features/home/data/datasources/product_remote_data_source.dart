import 'dart:convert';

import 'package:loja_delicia_das_meninas/core/api/api_interceptor.dart';
import 'package:loja_delicia_das_meninas/core/api/endpoints.dart';
import 'package:loja_delicia_das_meninas/core/api/url_creator.dart';
import 'package:loja_delicia_das_meninas/core/device/network_info.dart';
import 'package:loja_delicia_das_meninas/core/erros/exception.dart';
import 'package:loja_delicia_das_meninas/features/home/data/models/product_model.dart';

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
      final response = await client.get(urlCreator.create(endpoint: EndPoints.products));
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          final deliciaList = responseJson['results'] as List;
          return deliciaList.map((e) => ProductsModel.fromJson(e)).toList();
        default:
          throw const ServerException();
      }
    } else {
      throw const NetworkException();
    }
  }
}
