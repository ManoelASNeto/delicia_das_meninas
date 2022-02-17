import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/widgets/list_tile_custom.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/bloc/product_bloc.dart';

class CakePage extends StatefulWidget {
  const CakePage({Key? key}) : super(key: key);

  @override
  _CakePageState createState() => _CakePageState();
}

class _CakePageState extends State<CakePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(
          'Bolos',
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

  Widget _body(HomeState state) {
    switch (state.status) {
      case ProductStatus.ready:
        return ListView.builder(
          itemCount: state.product?.length,
          itemBuilder: (context, snapshot) {
            var product = state.product?[snapshot];
            return product?.productType == 'cake'
                ? ListTileCustom(
                    title: product?.title ?? 'Sem Titulo',
                    description: product?.description ?? 'Sem Descrição',
                    price: product?.price ?? 0,
                    image: product?.image ?? 'Sem Imagem',
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
