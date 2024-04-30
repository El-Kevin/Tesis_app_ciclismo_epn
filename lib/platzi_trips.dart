
import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/searchtrips.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/home/home_trips.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/profile/post_routes.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/profile/profile.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/routes/maps.dart';
class PlatziTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }
  
}
class _PlatziTrips extends State<PlatziTrips>{
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    MapPage(),
   PerfilWidget('Antho Chamba', 'imagenPerfil', 'Experto', 'tipoBicicleta')
  ];

  void onTapTapped(
      int index
  ){
    setState(() {
      indexTap = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
          ),
        child: BottomNavigationBar(
           //showSelectedLabels: false,
           //showUnselectedLabels: false,
           onTap: onTapTapped,
           currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ]
        ),
      ),
    ); 
  }
}