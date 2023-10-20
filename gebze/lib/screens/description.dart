import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Description extends StatefulWidget {
  final Map<String, dynamic> fieldArray;
  const Description({Key? key, required this.fieldArray}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height / 2,
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 0, 0, 0),
    image: DecorationImage(
      image: AssetImage(widget.fieldArray['image']),
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.6),
        BlendMode.dstATop,
      ),
      fit: BoxFit.cover,
    ),
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(20.0), // Sol alt köşeyi yuvarlar
      bottomRight: Radius.circular(20.0), // Sağ alt köşeyi yuvarlar
    ),
  ),
),

                Positioned(
                  top: MediaQuery.of(context).size.height / 44, // Sol üst köşeye yakın bir pozisyon
                  left: MediaQuery.of(context).size.height / 200,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white, // Geri tuşu ikonu
                    onPressed: () {
                      Navigator.pop(
                          context); // Geri tuşuna basıldığında önceki sayfaya geri git
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4.5,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          widget.fieldArray['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Text(
                          "", // LOGONUN ÜSTÜNDEKİ YAZI
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
  top: MediaQuery.of(context).size.height / 3 + 100, // Çizgiyi biraz aşağı kaydır
  left: MediaQuery.of(context).size.width / 2.5 - 50, // Çizgiyi simgeye göre sola kaydır
  right: MediaQuery.of(context).size.width / 2.5 - 50, // Çizgiyi simgeye göre sağa kaydır
  child: const Divider(
    thickness: 1, // Çizginin kalınlığını ayarlayabilirsiniz
    color: Colors.white, // Çizginin rengini ayarlayabilirsiniz
  ),
),

                Positioned(
                  top: MediaQuery.of(context).size.height / 4 - MediaQuery.of(context).size.height / 4.12335, // Simgeyi metin kutusunun üstüne koy
                  left: MediaQuery.of(context).size.width / 2 - MediaQuery.of(context).size.height / 5.5,
                  child: IconButton(
                    iconSize: 43,
                    icon: const Icon(Icons.location_on_sharp,color:Color.fromARGB(255, 252, 243, 243),),
                    onPressed: () {
                      launchUrl(Uri.parse(widget.fieldArray['konum']));
                    },
                  ),
                ),
                if(widget.fieldArray.containsKey('menu'))
                  Positioned(
                  top: MediaQuery.of(context).size.height / 3, // Simgeyi metin kutusunun üstüne koy
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: IconButton(
                    iconSize: 43,
                    icon: const Icon(Icons.restaurant,color:Color.fromARGB(255, 252, 243, 243),),
                    onPressed: () {
                      launchUrl(Uri.parse(widget.fieldArray['menu']));
                    },
                  ),
                ),
                if (widget.fieldArray.containsKey('menu'))
                Positioned(
                top: MediaQuery.of(context).size.height / 3 + 50, // Menüler yazısı için biraz aşağı kaydır
                left: MediaQuery.of(context).size.width / 2.5,
                child: const Text(
                "Menüler",
                style: TextStyle(
                color: Colors.white, // Menüler yazısının rengini ayarlayabilirsiniz
                fontSize: 18,
      ),
    ),
  ),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.fieldArray['description'],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
