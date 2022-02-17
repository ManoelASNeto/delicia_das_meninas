import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final String? title;
  final String? description;
  final double? price;
  final String? image;
  const ListTileCustom({
    Key? key,
    this.title,
    this.description,
    this.price,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(description!),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'R\$ ${price!}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            thickness: 5,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
