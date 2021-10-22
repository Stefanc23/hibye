import 'package:flutter/material.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/components/organization_attendance_listview.dart';

class OrganizationDashboard extends StatefulWidget {
  static String tag = 'OrganizationDashboard';
  final Organization org;

  const OrganizationDashboard({Key? key, required this.org}) : super(key: key);
  @override
  _OrganizationDashboard createState() => _OrganizationDashboard();
}

class _OrganizationDashboard extends State<OrganizationDashboard> {
  bool checkStatus = false;
  void setStatus() {
    setState(() {
      checkStatus = !checkStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1F3C88),
            leading: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("Profile"),
                ),
                Tab(child: Text("Attendance")),
              ],
            ),
            title: Text(widget.org.name),
          ),
          body: TabBarView(
            children: [
              //Ini tab ke 1
              ListView(
                children: <Widget>[
                  ListTile(
                    title: const Text('NAME'),
                    subtitle: Text(widget.org.name),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('TYPE'),
                    subtitle: Text(widget.org.type),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('ORGANIZATION ID'),
                    subtitle: Text(widget.org.id),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('ORGANIZATION INVITE CODE'),
                    subtitle: Text(widget.org.inviteCode),
                    onTap: () {},
                  ),
                ],
              ),

              //Ini tab ke 2
              ListView(
                children: const <Widget>[
                  AttendanceTile(
                      name: 'rizky',
                      label: 'check in',
                      datetime: '10-10-2001',
                      location: 'malang')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
