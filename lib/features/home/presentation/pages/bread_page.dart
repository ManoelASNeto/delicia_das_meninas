import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/widgets/card_custom.dart';
import 'package:loja_delicia_das_meninas/features/highlight/presentation/widgets/list_tile_custom.dart';
import 'package:loja_delicia_das_meninas/features/home/presentation/bloc/product_bloc.dart';

class BreadPage extends StatefulWidget {
  const BreadPage({Key? key}) : super(key: key);

  @override
  _BreadPageState createState() => _BreadPageState();
}

class _BreadPageState extends State<BreadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(
          'Pães',
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
            return product?.productType == 'bread'
                ? ListTileCustom(
                    image: product?.image ?? 'Sem Imagem',
                    description: product?.description ?? 'Sem descrição',
                    title: product?.title ?? 'Sem titulo',
                    price: product?.price ?? 0,
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
