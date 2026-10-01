import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

// Requisito 1: MaterialApp + Scaffold con AppBar
class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil Académico Interactivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PerfilAcademico(),
    );
  }
}

// Requisito 5: debe ser StatefulWidget porque el contador de logros
// cambia con el botón y la pantalla necesita "recordar" ese cambio.
class PerfilAcademico extends StatefulWidget {
  const PerfilAcademico({super.key});

  @override
  State<PerfilAcademico> createState() => _PerfilAcademicoState();
}

class _PerfilAcademicoState extends State<PerfilAcademico> {
  // ---- Requisito 2: 4 variables de distinto tipo ----
  final String nombre = 'Royer Huamantuma Mamani';
  final int np = 77; // Número Personal
  final double promedioPonderado = 15.8; // dato ficticio
  final bool matriculado = true;

  // Contador de logros académicos, inicializado en el NP (no en 0)
  late int logros;

  @override
  void initState() {
    super.initState();
    logros = np; // se inicializa exactamente en el NP
  }

  // Requisito 5: método que incrementa el contador usando setState()
  void sumarLogro() {
    setState(() {
      logros++;
    });
  }

  // ---- Requisito 3: lógica con if-else ----
  String clasificarParidad() {
    if (np % 2 == 0) {
      return 'Tu número personal es par';
    } else {
      return 'Tu número personal es impar';
    }
  }

  String clasificarMagnitud() {
    if (np > 50) {
      return 'Número personal alto';
    } else {
      return 'Número personal bajo';
    }
  }

  // ---- Requisito 4: lógica con for (NO escrito a mano) ----
  List<int> generarMultiplos() {
    List<int> multiplos = [];
    for (int i = 1; i <= 5; i++) {
      multiplos.add(np * i);
    }
    return multiplos;
  }

  @override
  Widget build(BuildContext context) {
    final multiplos = generarMultiplos();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text(nombre), // AppBar con nombre completo
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // ---- Sección de variables ----
            const Text(
              'Datos personales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Nombre: $nombre'),
            Text('Número Personal (NP): $np'),
            Text('Promedio ponderado: $promedioPonderado'),
            Text('Matriculado este periodo: ${matriculado ? "Sí" : "No"}'),

            const Divider(height: 32),

            // ---- Sección if-else ----
            const Text(
              'Clasificación del NP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(clasificarParidad()),
            Text(clasificarMagnitud()),

            const Divider(height: 32),

            // ---- Sección for: múltiplos del NP ----
            const Text(
              'Primeros 5 múltiplos de mi NP',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: multiplos
                  .map((m) => Text('NP × ${multiplos.indexOf(m) + 1} = $m'))
                  .toList(),
            ),

            const Divider(height: 32),

            // ---- Sección StatefulWidget: contador de logros ----
            const Text(
              'Logros académicos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Logros: $logros', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: sumarLogro,
              child: const Text('Sumar logro'),
            ),
          ],
        ),
      ),
    );
  }
}
