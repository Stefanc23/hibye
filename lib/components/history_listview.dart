import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  final String label;
  final String datetime;
  final String location;

  const HistoryTile(
      {Key? key,
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
                      child: Text(label, style: TextStyle(fontSize: 17),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(datetime, style: TextStyle(fontSize: 17),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text(location, style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
