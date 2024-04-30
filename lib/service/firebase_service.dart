import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getRoutes() async {
  List<Map<String, dynamic>> routes = [];
  
  try {
    CollectionReference collectionReferenceRoutes = db.collection("routes");
    QuerySnapshot queryRoutes = await collectionReferenceRoutes.get();
    
    // Iterar sobre los documentos y convertirlos a Map<String, dynamic>
    queryRoutes.docs.forEach((doc) {
      routes.add(doc.data() as Map<String, dynamic>);
    });
  } catch (e) {
    print("Error al obtener rutas: $e");
  }
  
  return routes;
}


Future<dynamic> getRoutesRealizableUser(String userId) async {
  try {
    CollectionReference collectionReferenceRoutes = db.collection("User");
    DocumentReference documentReference = collectionReferenceRoutes.doc(userId);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    
    if (documentSnapshot.exists) {
      var userData = documentSnapshot.data();
      
      print('Consulta a la base de datos exitosa:');
      print((userData as Map<String, dynamic>)['routes']);
      
      // Retorna solo el valor asociado con la clave "routes"
      return (userData as Map<String, dynamic>)['routes'];
    } else {
      print('No se encontró ningún usuario con el ID proporcionado: $userId');
      return null;
    }
  } catch (e) {
    print("Error al obtener rutas: $e");
    return null;
  }
}
