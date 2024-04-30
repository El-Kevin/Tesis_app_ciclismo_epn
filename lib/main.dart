import 'package:flutter/material.dart';
/*imports de firebase */
import 'package:firebase_core/firebase_core.dart';
import 'package:tesis_app_ciclismo_epn/platzi_trips.dart';
import 'package:tesis_app_ciclismo_epn/service/firebase_service.dart';
import 'firebase_options.dart';

void main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlatziTrips()
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( 
        body:FutureBuilder(
          future: getRoutes(), 
          builder: (context, snapshot) {
            if(snapshot.hasData){
return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Text(snapshot.data?[index]['name']);
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
  */
}

