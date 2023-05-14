import 'package:flutter/material.dart';

class PruebaImagen extends StatelessWidget {
  const PruebaImagen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
              image: AssetImage('assets/img/Fondo_v1.png')),
        ],
      ),
    );
  }
}
