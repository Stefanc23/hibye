import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/screens/add_organization.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:hibye/db/database.dart';
import 'package:provider/provider.dart';

class SelectOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const SelectOrganization({Key? key}) : super(key: key);
  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  List<Organization> organizations = [];
  DataBaseService db = DataBaseService();

  void fetchOrganizations() async {
    await db
        .fetchOrganizationsByUser(context.watch<User>().uid)
        .then((value) => setState(() {
              organizations = value;
            }));
  }

  @override
  void initState() {
    fetchOrganizations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          'Select Organization',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F3C88),
        leading: GestureDetector(
          onTap: () {
            context.read<AuthenticationService>().signOut(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddOrganization(),
                    ));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 26.0,
              ),
            ),
          )
        ],
      ),
      body: organizations.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 24),
              width: double.infinity,
              height: 13,
              alignment: Alignment.center,
              child: Text('Nothing here yet!',
                  style: Theme.of(context).textTheme.caption),
            )
          : const OrganizationList(),
    );
  }
}

class OrganizationList extends StatelessWidget {
  const OrganizationList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 10),
        Card(
          child: ListTile(
            title: const Text('Organization Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            subtitle: const Text('Admin'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: ListTile(
            title: const Text('Organization Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            subtitle: const Text('Member'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
