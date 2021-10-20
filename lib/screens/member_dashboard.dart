import 'package:flutter/material.dart';
import 'package:hibye/main.dart';
import 'package:hibye/screens/select_organization.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/components/secondary_button.dart';

class MemberDashboard extends StatefulWidget {
  static String tag = 'MemberDashboard';

  const MemberDashboard({Key? key}) : super(key: key);
  @override
  _MemberDashboard createState() => _MemberDashboard();
}

class _MemberDashboard extends State<MemberDashboard> {
  bool checkStatus = false;
  void setStatus() {
    setState(() {
      checkStatus = !checkStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          'Member Name',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F3C88),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Card(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: ListTile(
            title: const Text(
              'Organization Name',
              style: TextStyle(color: Color(0xFF1F3C88)),
            ),
            contentPadding: EdgeInsets.only(right: 20, left: 20, top: 20),
            subtitle: const Text('Member'),
            onTap: () {},
            isThreeLine: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 180),
          child: ListTile(
            title: const Text(
              'Check In',
              style: TextStyle(color: Color(0xFF1F3C88)),
            ),
            contentPadding: EdgeInsets.only(right: 20, left: 20, top: 20),
            subtitle: const Text('No check in yet'),
            onTap: () {},
            isThreeLine: true,
          ),
        ),
        Visibility(
          visible: checkStatus,
          child: Column(
            children: [
              PrimaryButton(
                  label: 'Check In',
                  onPressed: () {
                    print('check in');
                  }),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
        Visibility(
          visible: !checkStatus,
          child: Column(
            children: [
              PrimaryButton(
                  label: 'Check Out',
                  onPressed: () {
                    print('check out');
                  }),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SecondaryButton(label: 'History', onPressed: () {}),
          ],
        ),
      ]),
    );
  }
}
