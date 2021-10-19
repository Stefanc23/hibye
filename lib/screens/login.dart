import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/screens/signup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _signupOnPressed() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Signup()),
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
          child: Text('Welcome Back',
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
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
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
                    PrimaryButton(label: 'Log in', onPressed: () {}),
                    Container(
                      margin: const EdgeInsets.only(bottom: 48),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No account yet? ',
                                style: Theme.of(context).textTheme.caption),
                            TextButton(
                                onPressed: _signupOnPressed,
                                child: Text(
                                  'Sign up!',
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
