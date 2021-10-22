import 'package:flutter/material.dart';
import 'package:hibye/components/history_listview.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/screens/member_dashboard.dart';

class MemberHistory extends StatefulWidget {
  static String tag = 'memberHistory';
  final Organization org;

  const MemberHistory({Key? key, required this.org}) : super(key: key);
  @override
  _MemberHistory createState() => _MemberHistory();
}

class _MemberHistory extends State<MemberHistory> {
  bool organizationStatus = false;
  void setStatus() {
    setState(() {
      organizationStatus = !organizationStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _back() {
      Navigator.pop(
        context,
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          'History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F3C88),
        leading: GestureDetector(
          onTap: _back,
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Visibility(
            child: const Text(
              '',
              textAlign: TextAlign.center,
            ),
            visible: organizationStatus,
          ),
          Visibility(
            child: const Text(
              'Nothing Here Yet',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            visible: organizationStatus,
          ),
          const SizedBox(height: 10),
          const Visibility(
              child: HistoryTile(
            label: 'Check In',
            datetime: '10 - 10 - 2001',
            location: 'Malang',
          )),
        ],
      ),
    );
  }
}
