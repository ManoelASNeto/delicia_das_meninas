import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/bloc/highlight_bloc.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/bloc/highlight_event.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/pages/home_page.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/bloc/product_bloc.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/pages/bread_page.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/pages/cake_page.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/pages/cart_page.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/pages/dessert_page.dart';

import '../../injection_container.dart';
import 'routes.dart';

class AppRouter {
  final _highlightBloc = sl<HighLightBloc>();
  final _productBloc = sl<HomeBloc>();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider.value(value: _highlightBloc..add(HighLight())),
                  BlocProvider.value(value: _productBloc)
                ], child: const HomePage()));
      case Routes.cakePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _productBloc..add(Product()),
                  child: const CakePage(),
                ));
      case Routes.breadPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _productBloc..add(Product()),
                  child: const BreadPage(),
                ));
      case Routes.dessertPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _productBloc..add(Product()),
                  child: const DessertPage(),
                ));
      case Routes.cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Erro'),
                  ),
                ));
    }
  }
}
