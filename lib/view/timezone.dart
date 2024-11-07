import 'package:flutter/material.dart';

class TimeZone extends StatefulWidget {
  const TimeZone({super.key});

  @override
  State<TimeZone> createState() => _TimeZoneState();
}

class _TimeZoneState extends State<TimeZone> {
  List<String> state = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
    'Ladakh',
    'Jammu and Kashmir'
  ];
  String selectState = "Indian Standard Time GMI+05:30";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Time Zone"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: state.map((e) {
              return ListTile(
                title: Text(e),
                onTap: () {
                  setState(() {
                    selectState = e;
                  });
                  Navigator.pop(context, selectState);
                },
              );
            }).toList(),
          ),
        ));
  }
}
