import 'package:flutter/material.dart';

class ImgCard extends StatelessWidget {
  const ImgCard({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (PointerEvent e) {
        print(e.position);
      },
      child: Card(
        elevation: 5,
        child: SizedBox(
          width: 250,
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
