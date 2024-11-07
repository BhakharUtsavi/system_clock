import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:system_clock/view/timezone.dart';
import 'clock2.dart';

class Date_Time extends StatefulWidget {
  const Date_Time({super.key});

  @override
  State<Date_Time> createState() => _Date_TimeState();
}

class _Date_TimeState extends State<Date_Time> {
  String selectedDate = "Wednesday, October 30, 2024";
  String selectTime = "21:42";

  bool isSwitched = true;
  bool isSwitched1 = true;
  bool isSwitched2 = true;

  String selectedTime = "24-hour";
  static const List<String> timeFormate = ["24-hour", "12-hour"];

  void time() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: timeFormate.map((e) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          e,
                          style: GoogleFonts.raleway(
                              color: Colors.grey, fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTime = e;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      if (e != timeFormate.last)
                        Divider(
                          color: Colors.grey,
                        ),
                    ],
                  );
                }).toList()),
          );
        });
  }

  String selectedCity = "Rajkot GMT+05:30";
  String selectState = "Indian Standard Time GMI+05:30";

  Future<void> selectedState() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TimeZone()),
    );

    if (result != null && result is String) {
      setState(() {
        selectState = result;
      });
    }
  }

  Future<void> selectCity() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Clock2()),
    );

    if (result != null && result is String) {
      setState(() {
        selectedCity = result;
      });
    }
  }
  String selectedDualClock = "Lock screen & Home screen clock widget";
  List<String> dualClock = [
    "Lock screen",
    "Home screen clock widget",
    "Lock screen & Home screen clock widget"
  ];

  void selectDualClock() {
    showModalBottomSheet(
        backgroundColor: Colors.grey.shade900,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "Display dual clock on",
                  style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 20,
                ),
                ...dualClock.map((e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDualClock = e;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        e,
                        style: GoogleFonts.raleway(color: Colors.grey),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancle")),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date & Time"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          time();
                        },
                        child: Text(
                          "Time Format",
                          style: GoogleFonts.raleway(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        selectedTime,
                        style: GoogleFonts.raleway(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Set time automatically",
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Switch(
                              value: isSwitched,
                              onChanged: (val) {
                                setState(() {
                                  isSwitched = val;
                                });
                              }),
                        ],
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () async {
                          DateTime? selectDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2025),
                              currentDate: DateTime.now());
                          if (selectDate != null) {
                            setState(() {
                              selectedDate =
                                  "${selectDate.day}-${selectDate.month}-${selectDate.year}";
                            });
                          }
                        },
                        child: Text(
                          "Date",
                          style: GoogleFonts.raleway(
                            color: isSwitched
                                ? Colors.grey.shade700
                                : Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        selectedDate,
                        style: GoogleFonts.raleway(
                          color:
                              isSwitched ? Colors.grey.shade700 : Colors.blue,
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            setState(() {
                              selectTime = "${time.hour}:${time.minute}";
                            });
                          }
                        },
                        child: Text(
                          "Time",
                          style: GoogleFonts.raleway(
                            color: isSwitched
                                ? Colors.grey.shade700
                                : Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        selectTime,
                        style: GoogleFonts.raleway(
                          color:
                              isSwitched ? Colors.grey.shade700 : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Set time zone automatically",
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Switch(
                              value: isSwitched1,
                              onChanged: (val) {
                                setState(() {
                                  isSwitched1 = val;
                                });
                              }),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed("timezone");
                                },
                                child: GestureDetector(
                                  onTap: (){
                                    selectedState();
                                  },
                                  child: Text(
                                    "Time zone",
                                    style: GoogleFonts.raleway(
                                      color: isSwitched1
                                          ? Colors.grey.shade700
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                selectState,
                                //"India Standard Time GMI+05:30",
                                style: GoogleFonts.raleway(
                                  color: isSwitched1
                                      ? Colors.grey.shade700
                                      : Colors.blue,
                                ),
                              ),
                            ],
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dual Clock",
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Display both clocks when they \n are set to different the zones",
                                style: GoogleFonts.raleway(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                              value: isSwitched2,
                              onChanged: (val) {
                                setState(() {
                                  isSwitched2 = val;
                                });
                              }),
                        ],
                      ),
                      Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Clock 1",
                            style: GoogleFonts.raleway(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            "GMT+05:30 (System time zone)",
                            style: GoogleFonts.raleway(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectCity();
                                },
                                child: Text(
                                  "Clock 2",
                                  style: GoogleFonts.raleway(
                                    color: isSwitched2
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                selectedCity,
                                style: GoogleFonts.raleway(
                                  color:
                                      isSwitched2 ? Colors.blue : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 17,
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectDualClock();
                                },
                                child: Text(
                                  "Display dual clock on",
                                  style: GoogleFonts.raleway(
                                    color: isSwitched2
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                selectedDualClock,
                                style: GoogleFonts.raleway(
                                  color:
                                      isSwitched2 ? Colors.blue : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
