import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({
    Key? key,
    this.title,
    this.description,
    this.image,
    this.price,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? image;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.elliptical(40.0, 80.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(image!, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title!,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Adicionar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('info'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
