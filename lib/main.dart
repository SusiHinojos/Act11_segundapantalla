import 'package:flutter/material.dart';

void main() => runApp(const JardinMaravillasApp());

class JardinMaravillasApp extends StatelessWidget {
  const JardinMaravillasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jardín de las Maravillas',
      theme: ThemeData(useMaterial3: true),
      home: const AtraccionesPage(),
    );
  }
}

class AtraccionesPage extends StatelessWidget {
  const AtraccionesPage({super.key});

  static const IconData attractions = IconData(0xe0b4, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    const Color purpleTheme = Colors.deepPurple;
    
    // Detectamos el ancho de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    // Si es más ancho de 600px (Web/Tablet), ponemos 3 columnas, si no, 2.
    int crossAxisCount = screenWidth > 600 ? 3 : 2;

    final List<Map<String, String>> listaAtracciones = [
      {'nombre': 'Rueda de la fortuna', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/rueda.jpg'},
      {'nombre': 'Carrusel', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/carrusel.jpg'},
      {'nombre': 'Tren del parque', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/tren.jpg'},
      {'nombre': 'Barco vikingo', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/barco.jpg'},
      {'nombre': 'Tazas giratorias', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/tazas.jpg'},
      {'nombre': 'Sillas voladoras', 'img': 'https://raw.githubusercontent.com/SusiHinojos/imagenes_paraflutter_6J_Febrero_2026/refs/heads/main/sillas.jpg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purpleTheme,
        elevation: 0,
        leading: const Icon(attractions, color: Colors.white, size: 28),
        centerTitle: true, 
        title: const Text(
          'Jardín de las Maravillas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          const Text(
            'Atracciones básicas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: purpleTheme),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // Aumentamos este valor para que el contenedor sea más bajito (compacto)
                childAspectRatio: 1.1, 
              ),
              itemCount: listaAtracciones.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: purpleTheme, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        listaAtracciones[index]['nombre']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: purpleTheme),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              listaAtracciones[index]['img']!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: purpleTheme, width: 2.0)),
        ),
        child: BottomAppBar(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.person, color: purpleTheme), onPressed: () {}),
              IconButton(icon: const Icon(attractions, color: purpleTheme, size: 28), onPressed: () {}),
              IconButton(icon: const Icon(Icons.home, color: purpleTheme), onPressed: () {}),
              IconButton(icon: const Icon(Icons.confirmation_number, color: purpleTheme), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_cart, color: purpleTheme), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}