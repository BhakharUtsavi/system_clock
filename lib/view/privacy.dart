import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed("privacypolicy");
                    },
                    child: Text("Privacy Policy",style: GoogleFonts.raleway(fontSize: 16,color: Colors.white),)),
                Spacer(),
                Icon(Icons.arrow_forward_ios,size: 17,color: Colors.grey,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
