import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/home/description_place.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/snapbar/gradient_back.dart';
import 'package:tesis_app_ciclismo_epn/service/firebase_service.dart';

class HomeTrips extends StatefulWidget {
  @override
  _HomeTripsState createState() => _HomeTripsState();
}

class _HomeTripsState extends State<HomeTrips> {
  late Future<List<Map<String, dynamic>>> routes;

  @override
  void initState() {
    super.initState();
    routes = getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
        ),
        backgroundColor: Color(0xFF4268D3),
        elevation: 0, // Sin sombra
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: routes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: DescripcionPlace(
                            snapshot.data![index]['usernameSend'] ??
                                'Nombre de usuario desconocido',
                            snapshot.data![index]['descriptionPlace'] ?? '',
                            snapshot.data![index]['timeSend'] ?? '',
                            snapshot.data![index]['pathImgProfile'] ?? '',
                            snapshot.data![index]['pathImgRoutes'] ?? '',
                            snapshot.data![index]['dificultad'] ?? '',
                            snapshot.data![index]['timeRoute'] ?? '',
                            snapshot.data![index]['bicicleta'] ?? '',
                            snapshot.data![index]['distancia'] ?? '',
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
