import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/profile/review.dart';
import 'package:tesis_app_ciclismo_epn/service/firebase_service.dart';

class PostRoutes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PostRoutes();
  }

}

class _PostRoutes extends State<PostRoutes>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold( 
        body:FutureBuilder(
          future: getRoutes(), 
          builder: (context, snapshot) {
            if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Review('assets/img/profile.jpg', snapshot.data?[index]['bicicleta'], snapshot.data?[index]['name'], snapshot.data?[index]['name']),
                ]
              );
            },
          );

            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          
        }
        
        )
      ),
    );
    
  }

}

/* 
Text(snapshot.data?[index]['name']);
return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review('assets/img/profile.jpg', 'Jimmy.....', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy..', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy...', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy..', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy', '1 review, 5 photos', 'there is amazing place'),
        Review('assets/img/profile.jpg', 'Jimmy', '1 review, 5 photos', 'there is amazing place')
      ],
    ); */