import 'package:flutter/material.dart';

class AttendanceTile extends StatelessWidget {
  final String name;
  final String label;
  final String datetime;
  final String location;

  const AttendanceTile(
      {Key? key,
        required this.name,
        required this.label,
        required this.datetime,
        required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 90, // constrain height
              child: Center(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(label.toUpperCase(),),
                          Text(' - '),
                          Text(name.toUpperCase()),
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(datetime, style: TextStyle(fontSize: 17),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(location.toUpperCase(), style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
