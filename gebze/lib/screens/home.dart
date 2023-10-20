import 'package:flutter/material.dart';
import 'package:gebze/utilities/card_maker.dart';
import 'package:gebze/screens/havadurumu.dart';
import 'package:gebze/screens/places.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
 List<Map<String,dynamic>> documents = [];
 Homescreen({Key? key, required this.documents}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Rehber Gebze"),
          backgroundColor: const Color.fromARGB(255, 37, 31, 31),
          actions: [
            IconButton(
              icon: const Icon(Icons.device_thermostat_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WeatherScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // İlk kart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0), // Yandan boşluk eklemek için padding kullanılır
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Placescreen(
                              document: widget.documents[0],
                            );
                          },
                        ),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 180, // İlk kartın yüksekliğini buradan ayarlayabilirsiniz
                      child: CardMake(title: widget.documents[0]),
                    ),
                  ),
                ),
                const SizedBox(height: 1.0), // İlk kart ile ikinci kart arasında boşluk

                // Diğer kartlar ikili olarak sıralanır
                for (int rowIndex = 1; rowIndex < widget.documents.length; rowIndex += 2)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0), // Yandan boşluk eklemek için padding kullanılır
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Placescreen(
                                        document: widget.documents[rowIndex],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: CardMake(title: widget.documents[rowIndex]),
                            ),
                          ),
                          const SizedBox(width: 3.0), // İki kart arasında boşluk
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Placescreen(
                                        document: widget.documents[rowIndex+1],
                                      );
                                    },
                                  ),
                                );
                              },
                              child: CardMake(title: widget.documents[rowIndex+1]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
