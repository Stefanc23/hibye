import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';

class RegisterOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const RegisterOrganization({Key? key}) : super(key: key);
  @override
  _RegisterOrganization createState() => _RegisterOrganization();
}

class _RegisterOrganization extends State<RegisterOrganization> {
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          decoration: InputDecoration(
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
            Column(
              children: [
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
                        labelText: 'Organization Invite Type',
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
                PrimaryButton(label: 'Submit', onPressed: () {}),
              ],
            ),
          ],
        ));
  }
}
