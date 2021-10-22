import 'package:flutter/material.dart';
import 'package:hibye/models/organization.dart';
import 'package:hibye/screens/add_organization.dart';
import 'package:hibye/screens/member_dashboard.dart';
import 'package:hibye/screens/organization_dashboard.dart';
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
        .fetchOrganizationsByUser(
            context.read<AuthenticationService>().firebaseAuth.currentUser!.uid)
        .then((value) => setState(() {
              organizations = value;
            }));
  }

  @override
  void initState() {
    fetchOrganizations();
    super.initState();
  }

  void _addOrganizationOnPressed() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AddOrganization(),
        ));
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
              onTap: _addOrganizationOnPressed,
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
          ? const EmptyList()
          : OrganizationList(organizations: organizations),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: 13,
      alignment: Alignment.center,
      child:
          Text('Nothing here yet!', style: Theme.of(context).textTheme.caption),
    );
  }
}

class OrganizationList extends StatelessWidget {
  List<Organization> organizations;

  OrganizationList({
    Key? key,
    required this.organizations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: organizations.map((org) => OrganizationCard(org: org)).toList(),
    );
  }
}

class OrganizationCard extends StatelessWidget {
  final Organization org;

  const OrganizationCard({
    Key? key,
    required this.org,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => org.role == 'member' ? MemberDashboard(org: org) : OrganizationDashboard(org: org)),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Card(
        child: ListTile(
          title: Text(org.name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          subtitle: Text(org.role),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: _onPressed,
        ),
      ),
    );
  }
}
