import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  String buttonText = "Navigate";

  ButtonPurple(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Navegando"),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 15.0,
          left: 10.0,
          right: 10.0,
        ),
        height: 25.0,
        width: 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.black), // Añadir borde negro
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: "Lato",
              color: Colors.blue, // Color del texto azul
            ),
          ),
        ),
      ),
    );
  }
}
