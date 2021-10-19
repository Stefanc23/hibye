import 'package:flutter/material.dart';
import 'package:hibye/main.dart';
import 'package:hibye/add_organization.dart';
import 'package:hibye/register_organization.dart';
import 'package:hibye/components/primary_button.dart';

class SelectOrganization extends StatefulWidget {
  static String tag = 'admin-addorg-page';

  const SelectOrganization({Key? key}) : super(key: key);
  @override
  _SelectOrganization createState() => _SelectOrganization();
}

class _SelectOrganization extends State<SelectOrganization> {
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddOrganization(),
                  ));
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(children: <Widget>[
          Column(
            children: [
              SizedBox(height: 100,),
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
          SizedBox(height: 10,),
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
          SizedBox(height: 200,),
          Column(
            children: [
              PrimaryButton(label: 'Submit', onPressed: () {}),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterOrganization(),
                                ));
                          },
                          child: Text(
                            'Register Organization',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                color:
                                Theme.of(context).primaryColor),
                          ))
                    ]),
              ),
            ],
          ),
        ],
        ));
  }
}
