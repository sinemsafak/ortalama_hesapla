import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {

  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          "$dersSayisi Ders Girildi",
          style: TextStyle(fontSize: 20),
        ),

        SizedBox(height: 10),

        Text(
          ortalama.toStringAsFixed(2),
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
          ),
        ),

        Text("Ortalama")

      ],
    );
  }
}