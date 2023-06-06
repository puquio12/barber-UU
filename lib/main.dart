import 'package:flutter/material.dart';
import 'package:hero/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.black,
      ),
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => Inicio(),
        '/detalle': (context) => Detalle(),
        '/configuracion': (context) => Configuracion(),
      },
    );
  }
}

class Inicio extends StatelessWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URBAN BARBER SHOP"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://images.pexels.com/photos/7518760/pexels-photo-7518760.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Reemplaza con tu enlace de imagen
              width: 500,
              height: 500,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/detalle'),
              child: Text('Ver detalles'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/configuracion'),
              child: Text('Ver galeria'),
            ),
          ],
        ),
      ),
    );
  }
}

class Detalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
      ),
      body: Center(
        child: Text(
          "Pantalla Detalle",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hero',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
