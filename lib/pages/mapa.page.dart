import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:insurancetech/components/drawer.dart';
import '../components/pageTitle.dart';
import '../components/largeButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  static const routeName = '/mapa';

  @override
  State<MapaPage> createState() => _MapaState();
}

class _MapaState extends State<MapaPage> {
  final MapController _mapController = MapController();
  final _passwordController = TextEditingController();
  double _zoom = 13.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mapWidth = screenSize.width * 0.8;
    final mapHeight = screenSize.height * 0.68;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF2a5298),
        centerTitle: true,
        title: SizedBox(
          width: 90,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          color: const Color(0xFF2a5298),
          child: ListView(children: <Widget>[
            const SizedBox(height: 10),
            const pageTitle(
              texto: 'Mapa de sinistros',
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: mapWidth,
              height: mapHeight,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('coordenadas')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  var markers = _buildMarkers(snapshot.data!.docs);
                  return FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                        center: LatLng(-8.0965798, -34.8876455),
                        zoom: _zoom,
                        minZoom: 2,
                        maxZoom: 22,
                        interactiveFlags: InteractiveFlag.all),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(markers: markers),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(),
              child: LargeButton(
                texto: 'Adicionar local de sinistro',
                onPressed: () {
                  _showPasswordDialog();
                },
              ),
            ),

            const SizedBox(height: 20),
            
          ]
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: _aumentarZoom,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: null,
            onPressed: _diminuirZoom,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void _aumentarZoom() {
    setState(() {
      _zoom++;
      if (_zoom > 19.0) {
        _zoom = 19.0;
      }
      _mapController.move(_mapController.center, _zoom);
    });
  }

  void _diminuirZoom() {
    setState(() {
      _zoom--;
      if (_zoom < 3.0) {
        _zoom = 3.0;
      }
      _mapController.move(_mapController.center, _zoom);
    });
  }

  void _showPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Senha de acesso'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Insira a senha',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Apenas os administradores têm acesso a essa função',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Voltar'),
            ),
            ElevatedButton(
              onPressed: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .doc('/senhaAcesso/9gwnsWm96rgqXk2ajeik')
                    .get();

                String senhaCorreta = snapshot.get('senha');
                String senhaDigitada = _passwordController.text;

                if (senhaCorreta == senhaDigitada) {
                  Navigator.pushNamed(context, '/coordenadas');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Senha incorreta')),
                  );
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  List<Marker> _buildMarkers(List<QueryDocumentSnapshot> docs) {
    return docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      double latitude = data['latitude'];
      double longitude = data['longitude'];

      return Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(latitude, longitude),
        builder: (ctx) => GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(doc.id),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Fechar'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.location_on, color: Colors.red, size: 50),
        ),
      );
    }).toList();
  }
}
