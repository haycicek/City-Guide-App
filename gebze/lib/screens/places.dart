import 'package:flutter/material.dart';
import 'package:gebze/utilities/card_maker.dart';
import 'package:gebze/screens/description.dart';
import 'package:gebze/screens/havadurumu.dart';

class Placescreen extends StatefulWidget {
 final Map<String, dynamic> document;

 const Placescreen({Key? key, required this.document}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlacescreenState();
}

class _PlacescreenState extends State<Placescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Geri tuşu ikonu
              onPressed: () {
                Navigator.pop(context); // Geri tuşuna basıldığında önceki sayfaya geri git
              },
            ),
            title: Text(widget.document['name']),
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
          body: Column(
            children: [
              Expanded(
                //kategoriler
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: widget.document['subcategories'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Kategoriye tıklanınca ne yapılacağını burada tanımlayabilirsiniz.
                            // Örneğin başka bir sayfaya yönlendirebilirsiniz.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  // Kategoriye tıklandığında açılacak sayfanın yapısını burada oluşturabilirsiniz.
                                  return Description(fieldArray: widget.document['subcategories'][index]);
                                },
                              ),
                            );
                          },
                          child: CardMake(title: widget.document['subcategories'][index]),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
