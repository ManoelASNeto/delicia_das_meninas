import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/widgets/card_custom.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/bloc/product_bloc.dart';

class DessertPage extends StatefulWidget {
  const DessertPage({Key? key}) : super(key: key);

  @override
  _DessertPageState createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(
          'Sobremesas',
          style: GoogleFonts.dancingScript(
            textStyle: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => _body(state),
      ),
    );
  }

  Widget _body<List>(HomeState state) {
    switch (state.status) {
      case ProductStatus.ready:
        return ListView.builder(
          itemCount: state.product?.length,
          itemBuilder: (context, snapshot) {
            var product = state.product?[snapshot];
            return product?.productType == 'dessert'
                ? CardCustom(
                    image: product?.image ?? 'Sem Imagem',
                    title: product?.title ?? 'Sem titulo',
                  )
                : const SizedBox();
          },
        );
      case ProductStatus.error:
        return Center(
          child: Text(state.message ?? ''),
        );
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }
}
