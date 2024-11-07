import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:system_clock/model/clock.dart';
import 'package:system_clock/provider/navigationprovider.dart';
import '../provider/themeprovider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  TextEditingController timeController = TextEditingController();
  TextEditingController editController = TextEditingController();

  String calculateTimeDifference(TimeOfDay selectedTime) {
    final now = TimeOfDay.now();
    final selectedTimeInMinutes = selectedTime.hour * 60 + selectedTime.minute;
    final nowInMinutes = now.hour * 60 + now.minute;
    final differenceInMinutes = selectedTimeInMinutes - nowInMinutes;

    if (differenceInMinutes < 0) {
      return "Time has passed";
    }
    final hours = differenceInMinutes ~/ 60;
    final minutes = differenceInMinutes % 60;
    return "$hours hours and $minutes minutes remaining";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                }),
          );
        }),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: "settings", child: Text("Settings")),
              ];
            },
            onSelected: (val) {
              if (val == "settings") {
                Navigator.of(context).pushNamed("setting");
              }
            },
          ),
        ],
      ),
      bottomNavigationBar:
          Consumer<NavigationProvider>(builder: (context, value, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: value.menuIndex,
          onTap: (index) {
            value.pageController?.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
            value.changeMenuIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarm"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_outlined), label: "Stopwatch"),
            BottomNavigationBarItem(
                icon: Icon(Icons.restore_page_outlined), label: "Timer"),
          ],
        );
      }),
      body: PageView(
        controller: Provider.of<NavigationProvider>(context, listen: false)
            .pageController,
        onPageChanged: (value) {
          Provider.of<NavigationProvider>(context, listen: false)
              .changeMenuIndex(value);
        },
        children: [
          Consumer<NavigationProvider>(
            builder: (BuildContext context, NavigationProvider value,
                Widget? child) {
              if (value.clock.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/022/160/215/small_2x/unproductive-and-excuse-concept-lazy-man-sleeping-with-no-clue-to-wake-up-with-big-sticky-note-word-later-on-alarm-clock-putting-off-doing-it-later-putting-off-going-to-work-tomorrow-vector.jpg",
                      height: 300,
                      width: 300,
                    ),
                    Center(
                      child: Text(
                        "No Alarm",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue.shade300,
                          shape: const StadiumBorder(),
                          child: const Icon(Icons.add),
                          onPressed: () async {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setModalState) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Cancel"),
                                              ),
                                              const Spacer(),
                                              Text("New Alarm",
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.grey,
                                                      fontSize: 18)),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {
                                                  Provider.of<NavigationProvider>(
                                                          context,
                                                          listen: false)
                                                      .addTime(
                                                    clockNum(
                                                      time: timeController.text,
                                                      ring: "Ring Once",
                                                    ),
                                                  );
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Done"),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 150),
                                          Text(
                                            timeController.text.isEmpty
                                                ? "Ring in 1 day"
                                                : "Ring in ${timeController.text}",
                                            style: GoogleFonts.raleway(
                                                color: Colors.grey,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () async {
                                              TimeOfDay? time =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              if (time != null) {
                                                setModalState(() {
                                                  timeController.text =
                                                      "${time.hour} hour ${time.minute} minute";
                                                });
                                              }
                                            },
                                            child: const Text("Choose Time"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text("Alarm",
                        style: GoogleFonts.raleway(
                            color: Colors.grey, fontSize: 30)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.clock.length,
                        itemBuilder: (context, index) {
                          clockNum alarm = value.clock[index];
                          TextEditingController editController =
                              TextEditingController(text: alarm.time);
                          TextEditingController timeController =
                              TextEditingController();

                          return ListTile(
                            onTap: () async {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancel"),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "Edit Alarm",
                                                  style: GoogleFonts.raleway(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                ),
                                                const Spacer(),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      alarm.time =
                                                          editController.text;
                                                      alarm.isActive = true;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Save"),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 150),
                                            Text(
                                              editController.text.isEmpty
                                                  ? "Ring in 1 day"
                                                  : "Ring in ${editController.text}",
                                              style: GoogleFonts.raleway(
                                                  color: Colors.grey,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () async {
                                                TimeOfDay? time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                );
                                                if (time != null) {
                                                  String timeDiff =
                                                      calculateTimeDifference(
                                                          time);
                                                  setModalState(() {
                                                    editController.text =
                                                        "${time.hour} hour ${time.minute} minute\n$timeDiff";
                                                  });
                                                }
                                              },
                                              child: const Text("Choose Time"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            title: Text(
                              alarm.time ?? "",
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            subtitle: Text(
                              alarm.ring ?? "",
                              style: GoogleFonts.raleway(
                                  fontSize: 18, color: Colors.grey),
                            ),
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: "delete",
                                    child: Text("Delete"),
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                if (value == "delete") {
                                  Provider.of<NavigationProvider>(context,
                                          listen: false)
                                      .removeAlarm(index);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Stop_Watch(),
          Timer_Clock(),
        ],
      ),
    );
  }
}

class Stop_Watch extends StatefulWidget {
  const Stop_Watch({super.key});

  @override
  State<Stop_Watch> createState() => _Stop_WatchState();
}

class _Stop_WatchState extends State<Stop_Watch> {
  int lastMilliseconds = 0;
  bool isRunning = false;
  List<String> timeHistory = [];

  String get formattedTime {
    int hours = lastMilliseconds ~/ 3600000;
    int minutes = (lastMilliseconds % 3600000) ~/ 60000;
    int seconds = (lastMilliseconds % 60000) ~/ 1000;
    int milliseconds = (lastMilliseconds % 1000) ~/ 10;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${milliseconds.toString().padLeft(2, '0')}';
  }

  void tick() {
    if (isRunning) {
      setState(() {
        lastMilliseconds += 10;
      });
      Future.delayed(Duration(milliseconds: 10), tick);
    }
  }

  void _start() {
    if (isRunning) return;
    setState(() {
      isRunning = true;
    });
    tick();
  }

  void _stop() {
    setState(() {
      isRunning = false;
    });
  }

  void _reset() {
    _stop();
    setState(() {
      lastMilliseconds = 0;
      timeHistory.clear();
    });
  }

  void _saveTime() {
    setState(() {
      timeHistory.insert(0, formattedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  formattedTime,
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                  onPressed: _stop,
                  child: Icon(
                    Icons.stop,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                  onPressed: _start,
                  child: Icon(
                    Icons.play_arrow,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                  onPressed: _reset,
                  child: Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.white,
                  onPressed: _saveTime,
                  child: Icon(
                    Icons.save,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Lap",style: GoogleFonts.raleway(fontSize: 16),),
                Text("Lap time",style: GoogleFonts.raleway(fontSize: 16),),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: timeHistory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Lap ${timeHistory.length - index}',
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          timeHistory[index],
                          style: GoogleFonts.raleway(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Timer_Clock extends StatefulWidget {
  const Timer_Clock({super.key});

  @override
  State<Timer_Clock> createState() => _Timer_ClockState();
}

class _Timer_ClockState extends State<Timer_Clock> {
  Timer? _timer;
  int _remainingSeconds = 3600;

  String get _formattedTime {
    int hours = _remainingSeconds ~/ 3600;
    int minutes = (_remainingSeconds % 3600) ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _remainingSeconds = 3600;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 0, minute: 1),
    );

    if (pickedTime != null) {
      setState(() {
        _remainingSeconds = (pickedTime.hour * 3600) + (pickedTime.minute * 60);
      });
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: _selectTime,
                child: Text(
                  "Add",
                  style: GoogleFonts.raleway(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(
                _formattedTime,
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: _stopTimer,
                  child: Icon(
                    Icons.stop,
                    size: 30,
                    color: Colors.blue,
                  )),
              const SizedBox(width: 40),
              FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: _startTimer,
                  child: Icon(
                    Icons.play_arrow,
                    size: 35,
                    color: Colors.blue,
                  )),
              const SizedBox(width: 40),
              FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: _resetTimer,
                  child: Icon(
                    Icons.refresh,

                    size: 30,
                    color: Colors.blue,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
