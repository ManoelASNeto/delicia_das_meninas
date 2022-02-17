import 'dart:convert';

import 'package:loja_delicia_das_meninas/core/api/api_interceptor.dart';
import 'package:loja_delicia_das_meninas/core/api/endpoints.dart';
import 'package:loja_delicia_das_meninas/core/api/url_creator.dart';
import 'package:loja_delicia_das_meninas/core/device/network_info.dart';
import 'package:loja_delicia_das_meninas/core/erros/exception.dart';
import 'package:loja_delicia_das_meninas/features/highlight/data/models/highlight_model.dart';

abstract class IHomeRemoteDataSource {
  Future<List<HighLightModel>> highLightList();
}

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  final IHttpClient client;
  final INetworkInfo networkInfo;
  final IUrlCreator urlCreator;

  HomeRemoteDataSource(this.client, this.networkInfo, this.urlCreator);

  @override
  Future<List<HighLightModel>> highLightList() async {
    if (await networkInfo.isConnectd) {
      final response = await client.get(urlCreator.create(endpoint: EndPoints.highLight));
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          final highLightList = responseJson['results'] as List;
          return highLightList.map((e) => HighLightModel.fromJson(e)).toList();
        default:
          throw const ServerException();
      }
    } else {
      throw const NetworkException();
    }
  }
}
