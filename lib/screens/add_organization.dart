import 'package:flutter/material.dart';
import 'package:hibye/main.dart';
import 'package:hibye/select_organization.dart';

class AddOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const AddOrganization({Key? key}) : super(key: key);
  @override
  _AddOrganizationState createState() => _AddOrganizationState();
}

class _AddOrganizationState extends State<AddOrganization>{

  bool organizationStatus = false;
  void setStatus(){
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
        title: const Text('Select Organization', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF1F3C88),
        leading: GestureDetector(
          onTap: () {},
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
                      builder: (context) => const SelectOrganization(),
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
              '', textAlign: TextAlign.center,
            ),
            visible: organizationStatus,
          ),
          Visibility(
            child: const Text(
              'Nothing Here Yet', textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            visible: organizationStatus,
          ),
          SizedBox(height: 10),
          Visibility(
            child: Card(
              child: ListTile(
                title: const Text('Organization Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
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
                title: const Text('Organization Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
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