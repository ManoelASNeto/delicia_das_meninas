import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigations/routes.dart';
import '../../../home/presentation/bloc/product_bloc.dart';
import '../bloc/highlight_bloc.dart';
import '../bloc/highlight_state.dart';
import '../widgets/inkwell_custom.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: const Text('Delicia das Meninas'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage(
                    'images/back.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: BlocBuilder<HighLightBloc, HighLightState>(
            builder: (context, highLightstate) {
              return BlocBuilder<HomeBloc, HomeState>(
                builder: (context, productState) {
                  return _highlights(highLightstate, productState);
                },
              );
            },
          ),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home, title: 'Inicio'),
            TabItem(icon: Icons.shopping_cart, title: 'Carrinho'),
            TabItem(icon: Icons.view_list, title: 'Pedidos'),
            TabItem(icon: Icons.info, title: 'Info'),
          ],
          initialActiveIndex: _currentPage,
          onTap: (index) {},
          backgroundColor: Colors.pinkAccent,
        ),
      ),
    );
  }

  Widget _highlights(HighLightState highLightstate, HomeState homeState) {
    switch (highLightstate.status) {
      case HighLightStatus.ready:
        return successBuilder(highLightstate, homeState);

      case HighLightStatus.error:
        return Center(
          child: Text(highLightstate.message ?? ''),
        );
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  Widget successBuilder(
    HighLightState highLightstate,
    HomeState homeState,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
          ),
          Text(
            'Destaques do Mês',
            style: GoogleFonts.caveat(textStyle: const TextStyle(fontSize: 35, color: Colors.black)),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              scrollDirection: Axis.horizontal,
            ),
            itemCount: highLightstate.highlight?.length,
            itemBuilder: (context, int, snapshot) {
              var product = highLightstate.highlight?[snapshot];
              return Image.network(
                product?.image ?? '',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                InkWellCustom(
                  title: 'Bolos',
                  image: 'https://cdn-icons-png.flaticon.com/512/308/308510.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.cakePage);
                  },
                ),
                InkWellCustom(
                  title: 'Pães',
                  image: 'https://img.icons8.com/ios/500/bread.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.breadPage);
                  },
                ),
                InkWellCustom(
                    title: 'Sobremesas',
                    image: 'https://cdn-icons-png.flaticon.com/512/1731/1731172.png',
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.dessertPage);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
