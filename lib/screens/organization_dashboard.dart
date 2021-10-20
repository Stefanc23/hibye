import 'package:flutter/material.dart';
import 'package:hibye/main.dart';
import 'package:hibye/select_organization.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/components/secondary_button.dart';
import 'package:hibye/components/organization_attendance_listview.dart';

class OrganizationDashboard extends StatefulWidget {
  static String tag = 'OrganizationDashboard';

  const OrganizationDashboard({Key? key}) : super(key: key);
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
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            title: const Text('Organization Name'),
          ),
          body: TabBarView(
            children: [
              //Ini tab ke 1
              ListView(
                children: <Widget>[
                  ListTile(
                    title: const Text('NAME'),
                    subtitle: const Text('Organization Name'),
                    onTap: (){},
                  ),
                  ListTile(
                    title: const Text('TYPE'),
                    subtitle: const Text('Organization Type'),
                    onTap: (){},
                  ),
                  ListTile(
                    title: const Text('ORGANIZATION ID'),
                    subtitle: const Text('Organization ID'),
                    onTap: (){},
                  ),
                  ListTile(
                    title: const Text('ORGANIZATION INVITE CODE'),
                    subtitle: const Text('Organization Name'),
                    onTap: (){},
                  ),
                  ListTile(
                    title: const Text('ADMIN NAME'),
                    subtitle: const Text('Admin Full Name'),
                    onTap: (){},
                  ),
                ],
              ),

              //Ini tab ke 2
              ListView(
                  children: const <Widget>[
                    AttendanceTile(name: 'rizky', label: 'check in', datetime: '10-10-2001', location: 'malang')
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
