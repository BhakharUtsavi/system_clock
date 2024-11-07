import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clock2 extends StatefulWidget {
  const Clock2({super.key});

  @override
  State<Clock2> createState() => _Clock2State();
}

class _Clock2State extends State<Clock2> {
  
  String selectCities="India";
  
  static const List<String> cities=[
    "Thailand",
    "Japan",
    "Greece",
    "India",
    "Chaina",
    "New York",
    "Paris",
    "London",
    "Tokyo",
    "Rome",
    "Dubai",
    "Moscow",
    "Sydney",
    "Singapore",
    "Beijing",
    "Athens",
    "Viatnam",
    "Malaysia",
    "Rasia",
    "USA",
    "Australia",
    "Africa",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cities"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: cities.map((e){
            return ListTile(
              title: Text(e,style: GoogleFonts.raleway(),),
              onTap: (){
                setState(() {
                  selectCities=e;
                });
                Navigator.pop(context,selectCities);
              },
            );
          }).toList()
        ),
      ),
    );
  }
}
