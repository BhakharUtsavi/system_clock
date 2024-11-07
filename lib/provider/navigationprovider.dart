import 'package:flutter/material.dart';
import 'package:system_clock/model/clock.dart';

class NavigationProvider extends ChangeNotifier{
  int menuIndex=0;

  PageController pageController=PageController();

  List<clockNum> clock=[];

  void changeMenuIndex(int index){
    menuIndex = index;
    notifyListeners();
  }
  void addTime(clockNum Time) {
    clock.add(Time);
    notifyListeners();
  }

  void editContact(clockNum Time,int index) {
    clock[index]=Time;
    notifyListeners();
  }

  void removeAlarm(int index) {
    clock.removeAt(index);
    notifyListeners();
  }
}