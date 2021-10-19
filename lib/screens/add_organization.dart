import 'package:flutter/material.dart';
import 'package:hibye/screens/register_organization.dart';
import 'package:hibye/components/primary_button.dart';

class AddOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const AddOrganization({Key? key}) : super(key: key);
  @override
  _AddOrganization createState() => _AddOrganization();
}

class _AddOrganization extends State<AddOrganization> {
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          decoration: InputDecoration(
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Card(
                    child: TextField(
                      decoration: InputDecoration(
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
                PrimaryButton(label: 'Submit', onPressed: () {}),
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
