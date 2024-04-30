import 'package:tesis_app_ciclismo_epn/button/button_purple.dart';
import 'package:flutter/material.dart';

class DescripcionPlace extends StatelessWidget {
  String usernameSend = "Desconocido";
  String descriptionPlace = "...";
  String timeSend = 'Hace 2 horas';
  String pathImgProfile = 'assets/img/profile.jpg';
  String pathImgRoutes = 'assets/img/profile.jpg';
  String distancia = '1 Km';
  String timeRoute = '1 hora';
  String bicicleta = 'Modelo x';
  String dificultad = 'Baja';
  DescripcionPlace(this.usernameSend, this.descriptionPlace, this.timeSend,this.pathImgProfile, this.pathImgRoutes, this.dificultad, this.timeRoute, this.bicicleta, this.distancia);

  @override
  Widget build(BuildContext context) {
    final userAvatar = Container(
      margin: EdgeInsets.only(
        left: 20.0,
      ),
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
              pathImgProfile), // Aquí debes proporcionar la imagen del usuario
        ),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            usernameSend,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.0),
          Row(
            children: [
              Icon(
                Icons.directions_bike,
                size: 16.0,
                color: Colors.grey,
              ),
              SizedBox(width: 4.0),
              Text(
                timeSend, // Aquí debes poner la información de la fecha de publicación
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final title_Post = Row(
      children: [
        Expanded(
          // Utilizamos Expanded para que los elementos ocupen todo el espacio disponible
          child: Container(
            margin: EdgeInsets.only(
              top: 20.0,
              left: 10.0,
              right: 20.0,
              bottom: 10.0
            ),
            child: Row(
              children: [
                userAvatar,
                userInfo,
                Spacer(), // Añadimos un Spacer para empujar el botón hacia la derecha
                ButtonPurple("Unirse"),
              ],
            ),
          ),
        ),
      ],
    );

    final description = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 30.0,
        right: 20.0,
        bottom: 10.0
      ),
      child: Text(
        descriptionPlace,
        textAlign: TextAlign.justify, // Justificar el texto
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 21, 21, 21),
        ),
      ),
    );

    final image = Container(
      margin: EdgeInsets.only(
        bottom: 10.0
      ),
  width: 200.0,
  height: 200.0,
  decoration: BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        pathImgRoutes, // Coloca la imagen que deseas mostrar
      ),
    ),
  ),
);

final centeredImage = Center(
  child: image,
);


final detailsGrid = Container(
  margin: EdgeInsets.only( bottom: 20.0), // Agrega un margen superior de 20.0 al contenedor
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Centra verticalmente el contenido
            children: [
              Text(
                "Distancia",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(height: 4),
              Text(
                distancia,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      VerticalDivider(thickness: 1),
      Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Centra verticalmente el contenido
            children: [
              Text(
                "Tiempo estimado",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(height: 4),
              Text(
                timeRoute,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      VerticalDivider(thickness: 1),
      Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Centra verticalmente el contenido
            children: [
              Text(
                "Bicicleta",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(height: 4),
              Text(
                bicicleta,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      VerticalDivider(thickness: 1),
      Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Centra verticalmente el contenido
            children: [
              Text(
                'Dificultad',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
              SizedBox(height: 4),
              Text(
                dificultad,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);


    return Container(

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title_Post,
      description,
      centeredImage,
      SizedBox(height: 10.0),
      detailsGrid,
    ],
  ),
);

  }}
