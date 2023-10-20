import 'package:flutter/material.dart';

class CardMake extends StatefulWidget {
  CardMake({super.key, required this.title});
  Map<String, dynamic> title;
  @override
  State<CardMake> createState() => _CardMakeState();
}
class _CardMakeState extends State<CardMake>{
  @override
  Widget build(BuildContext context) {
    return Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), 
  ),
  child: Container(
    width: double.infinity,
    height: 140, 
    decoration: BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
        image: AssetImage(widget.title['image']),
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        fit: BoxFit.cover, 
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.title['name'],
          style: const TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),),),),);}}
