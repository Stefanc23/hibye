import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/db/database.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:provider/provider.dart';

class RegisterOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const RegisterOrganization({Key? key}) : super(key: key);
  @override
  _RegisterOrganization createState() => _RegisterOrganization();
}

class _RegisterOrganization extends State<RegisterOrganization> {
  final TextEditingController organizationNameController =
      TextEditingController();
  final TextEditingController organizationIdController =
      TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();
  final TextEditingController organizationTypeController =
      TextEditingController();

  void _submitOnPressed() {
    DataBaseService db = DataBaseService();
    db.registerOrganization(
        context.read<AuthenticationService>().firebaseAuth.currentUser!.uid,
        organizationIdController.text,
        organizationNameController.text,
        inviteCodeController.text,
        organizationTypeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            'Register Organization',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1F3C88),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          controller: organizationNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Organization Name',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Card(
                    child: TextField(
                      controller: organizationIdController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Organization ID',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          controller: inviteCodeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Organization Invite Code',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Card(
                    child: TextField(
                      controller: organizationTypeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Organization Type',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                PrimaryButton(label: 'Submit', onPressed: _submitOnPressed),
              ],
            ),
          ],
        ));
  }
}
