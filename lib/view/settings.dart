import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isSwitched=true;

  String selectedDuration = "5 minutes";

  static const List<String> durations = [
    "1 minute",
    "5 minutes",
    "10 minutes",
    "15 minutes",
    "20 minutes",
    "25 minutes"
  ];

  void showPopMenu() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: durations.map((duration) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            duration,
                            style: GoogleFonts.raleway(
                                color: Colors.grey, fontSize: 16),
                          ),
                          onTap: () {
                            setState(() {
                              selectedDuration = duration;
                            });
                            Navigator.pop(context);
                          },
                        ),
                        if (duration != durations.last)
                          Divider(color: Colors.grey),
                      ],
                    );
                  }).toList()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10, top: 20),
            child: Text(
              "Alarms",
              style: GoogleFonts.raleway(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Ring duration",
                              style: GoogleFonts.raleway(
                                  color: Colors.white, fontSize: 16),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                showPopMenu();
                              },
                              child: Text(
                                selectedDuration,
                                style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("stopalarm");
                              },
                              child: Text(
                                "Stop alarm with",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Button",
                              style: GoogleFonts.raleway(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 17,
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notify before ringing",
                          style: GoogleFonts.raleway(
                              color: Colors.white, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              "Get a notification 15 minutes before \n an alarm goes off so you have a \n chance to turn it off before it rings.",
                              style: GoogleFonts.raleway(
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            Switch(value: isSwitched, onChanged: (val) {
                              setState(() {
                                isSwitched=val;
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
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10, top: 20),
            child: Text(
              "Other",
              style: GoogleFonts.raleway(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("datetime");
                      },
                      child: Text(
                        "Date & Time",
                        style: GoogleFonts.raleway(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "System time and dual clock widget",
                          style: GoogleFonts.raleway(
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 17,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Version",
                          style: GoogleFonts.raleway(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "14.9.8_17a8e9a_240704",
                          style: GoogleFonts.raleway(
                            color: Colors.grey,
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("aboutclock");
                              },
                              child: Text(
                                "About Clock",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 17,
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("privacy");
                              },
                              child: Text(
                                "Privacy",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                              size: 17,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
