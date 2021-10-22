import 'package:flutter/material.dart';
import 'package:hibye/db/database.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/models/user.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/components/secondary_button.dart';
import 'package:hibye/screens/member_history.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:provider/provider.dart';

class MemberDashboard extends StatefulWidget {
  static String tag = 'MemberDashboard';
  final Organization org;

  const MemberDashboard({Key? key, required this.org}) : super(key: key);
  @override
  _MemberDashboard createState() => _MemberDashboard();
}

class _MemberDashboard extends State<MemberDashboard> {
  bool hasJustCheckedIn = false;
  late User _user;

  DataBaseService db = DataBaseService();

  void fetchUserData() async {
    await db
        .fetchUserData(
            context.read<AuthenticationService>().firebaseAuth.currentUser!.uid)
        .then((value) => setState(() {
              _user = value;
            }));
  }

  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  void setStatus() {
    setState(() {
      hasJustCheckedIn = !hasJustCheckedIn;
    });
  }

  void _historyOnPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MemberHistory(org: widget.org)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          _user.fullName,
          style: const TextStyle(color: Colors.white),
        ),
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
            title: Text(
              widget.org.name,
              style: const TextStyle(color: Color(0xFF1F3C88)),
            ),
            contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            subtitle: Text(widget.org.role),
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
            contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            subtitle: const Text('No check in yet'),
            onTap: () {},
            isThreeLine: true,
          ),
        ),
        hasJustCheckedIn
            ? PrimaryButton(
                label: 'Check In',
                onPressed: () {
                  setStatus();
                })
            : PrimaryButton(
                label: 'Check Out',
                onPressed: () {
                  setStatus();
                }),
        Column(
          children: [
            SecondaryButton(label: 'History', onPressed: _historyOnPressed),
          ],
        ),
      ]),
    );
  }
}
