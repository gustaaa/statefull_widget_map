import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;

  const Convert({
    Key? key,
    required this.konvertHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
        onPressed: (() {
          konvertHandler();
        }),
        child: Text(
          "Konversi Suhu",
          style: TextStyle(
            color: Color(0xffffffffff),
          ),
        ),
      ),
    );
  }
}
