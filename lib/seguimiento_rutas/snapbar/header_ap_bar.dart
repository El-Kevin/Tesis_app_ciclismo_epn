
import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/snapbar/gradient_back.dart';
class HeaderAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
       children: [
        GradientBack("Eventos"),
       ],
    );
  }

}