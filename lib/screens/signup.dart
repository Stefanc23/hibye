import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    void _loginOnPressed() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg')))),
        Container(
          margin: const EdgeInsets.only(top: 89),
          width: double.infinity,
          height: 47,
          alignment: Alignment.center,
          child: Text('Create Account',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Theme.of(context).primaryColor)),
        ),
        Container(
            margin: const EdgeInsets.only(top: 160),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))),
        Container(
          margin: const EdgeInsets.only(top: 208),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            labelText: 'Full Name',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(label: 'Sign up', onPressed: () {}),
                    Container(
                      margin: const EdgeInsets.only(bottom: 48),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',
                                style: Theme.of(context).textTheme.caption),
                            TextButton(
                                onPressed: _loginOnPressed,
                                child: Text(
                                  'Log in!',
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
              ]),
        )
      ]),
    );
  }
}
