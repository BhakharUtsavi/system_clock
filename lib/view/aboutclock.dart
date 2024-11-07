import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Clock extends StatefulWidget {
  const About_Clock({super.key});

  @override
  State<About_Clock> createState() => _About_ClockState();
}

class _About_ClockState extends State<About_Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Clock"),
      ),
      body: Column(
        children: [
          Image.network(
              "https://icons.iconarchive.com/icons/dtafalonso/android-lollipop/512/Clock-icon.png",height: 150,width: 200,),
          SizedBox(height: 10,),
          Text(
            "Clock",
            style: GoogleFonts.raleway(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Version: 14.9.8_17a8e9a_240704",
            style: GoogleFonts.raleway(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed("opensource");
                      },
                      child: Text(
                        "Open source licenses",
                        style: GoogleFonts.raleway(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,size: 17,color: Colors.grey,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
