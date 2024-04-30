import 'package:flutter/material.dart';
import 'package:tesis_app_ciclismo_epn/seguimiento_rutas/profile/reviewList.dart';

class PerfilWidget extends StatelessWidget {
  final String nombre;
  final String tipoBicicleta;
  final String nivelExperiencia;
  final String imagenPerfil;

  // Constructor explícito para inicializar las variables.
  PerfilWidget(
    this.nombre,
    this.imagenPerfil,
    this.nivelExperiencia,
    this.tipoBicicleta,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Mi Perfil',
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
      body: Center( // Centro el contenido
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los hijos verticalmente
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/img/profile.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                nombre,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Tipo de Bicicleta: $tipoBicicleta',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Nivel de Experiencia: $nivelExperiencia',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de historial
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistorialScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Ver Historial',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: Color(0xFF4268D3),
        elevation: 0, // Sin sombra
      ),
      body: ReviewList(), // Mostrar el widget ReviewList en la pantalla de historial
    );
  }
}

// Uso del widget PerfilWidget
void main() {
  runApp(MaterialApp(
    home: PerfilWidget(
      'John Doe',
      'assets/perfil.jpg',
      'Intermedio',
      'Montaña',
    ),
  ));
}
