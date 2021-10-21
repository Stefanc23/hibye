import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hibye/db/database.dart';
import 'package:hibye/screens/register_organization.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/screens/select_organization.dart';
import 'package:provider/provider.dart';
import 'package:hibye/services/authentication_service.dart';

class AddOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const AddOrganization({Key? key}) : super(key: key);
  @override
  _AddOrganization createState() => _AddOrganization();
}

class _AddOrganization extends State<AddOrganization> {
  final TextEditingController organizationIdController =
      TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();

  void _submitOnPressed() {
    DataBaseService db = DataBaseService();
    db.addOrganization(
        context.read<AuthenticationService>().firebaseAuth.currentUser!.uid,
        organizationIdController.text,
        inviteCodeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            'Add Organization',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF1F3C88),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectOrganization(),
                  ));
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
            const SizedBox(
              height: 200,
            ),
            Column(
              children: [
                PrimaryButton(label: 'Submit', onPressed: _submitOnPressed),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterOrganization(),
                                  ));
                            },
                            child: Text(
                              'Register Organization',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ))
                      ]),
                ),
              ],
            ),
          ],
        ));
  }
}
