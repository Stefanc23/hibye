import 'package:flutter/material.dart';
import 'package:hibye/screens/add_organization.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:provider/src/provider.dart';

class SelectOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const SelectOrganization({Key? key}) : super(key: key);
  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  bool organizationStatus = false;
  void setStatus() {
    setState(() {
      organizationStatus = !organizationStatus;
    });
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
            context.read<AuthenticationService>().signOut();
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
          SizedBox(height: 10),
          Visibility(
            child: Card(
              child: ListTile(
                title: const Text('Organization Name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                subtitle: const Text('Admin'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
            visible: !organizationStatus,
          ),
          SizedBox(height: 10),
          Visibility(
            child: Card(
              child: ListTile(
                title: const Text('Organization Name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                subtitle: const Text('Member'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
            ),
            visible: !organizationStatus,
          ),
        ],
      ),
    );
  }
}
