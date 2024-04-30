import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/service/firebase_service.dart';
import 'review.dart';
// Importa el servicio de Firebase

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Llama a getRoutesRealizableUser y pasa el ID del usuario
      future: getRoutesRealizableUser('x65EIbS53AXKdsiFZvlG'),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          // Asegúrate de que snapshot.data sea de tipo List<dynamic>
          final userRoutes = snapshot.data as List<dynamic>;
          
          // Aquí puedes usar userRoutes para construir tu ListView
          return ListView.builder(
            itemCount: userRoutes.length,
            itemBuilder: (context, index) {
              final route = userRoutes[index];
              print("hola");
              print(route);
              return Review(
                'assets/img/profile.jpg',
                route['username'] ?? 'hola',
                route['reviewInfo'] ?? 'hola',
                route['reviewText'] ?? 'hola',
              );
            },
          );
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
