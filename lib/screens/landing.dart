import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/components/secondary_button.dart';
import 'package:hibye/screens/login.dart';
import 'package:hibye/screens/signup.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _loginOnPressed() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }

    void _signupOnPressed() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Signup()),
      );
    }

    return Stack(children: [
      Container(
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/bg.jpg')))),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 67),
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 360,
                height: 360,
              ),
            ),
            PrimaryButton(
              label: 'Log in',
              onPressed: _loginOnPressed,
            ),
            SecondaryButton(
              label: 'Sign up',
              onPressed: _signupOnPressed,
            )
          ])
    ]);
  }
}
