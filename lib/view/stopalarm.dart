import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stop_Alarm extends StatefulWidget {
  const Stop_Alarm({super.key});

  @override
  State<Stop_Alarm> createState() => _Stop_AlarmState();
}

class _Stop_AlarmState extends State<Stop_Alarm> {
  String? status = "Off";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stop alarm with"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.phone_android,
                        size: 165,
                      ),
                      Text(
                        "Button",
                        style: GoogleFonts.raleway(
                          color: Colors.grey,
                        ),
                      ),
                      Radio(
                          value: "Off",
                          groupValue: status,
                          onChanged: (val) {
                            setState(() {
                              status = val!;
                            });
                          }),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.phone_android,
                        size: 165,
                      ),
                      Text(
                        "Gesture",
                        style: GoogleFonts.raleway(
                          color: Colors.grey,
                        ),
                      ),
                      Radio(
                          value: "On",
                          groupValue: status,
                          onChanged: (val) {
                            setState(() {
                              status = val!;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
