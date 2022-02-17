import 'package:flutter/material.dart';

class InkWellCustom extends StatelessWidget {
  final String? image;
  final String? title;
  final VoidCallback? onTap;
  const InkWellCustom({
    Key? key,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.pink,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            image!,
            height: 75,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title!,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
