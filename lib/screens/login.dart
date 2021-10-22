import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/screens/signup.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _loginOnPressed() {
      context.read<AuthenticationService>().signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    }

    void _signupOnPressed() {
      Navigator.pushReplacement(
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextFormField(
                          autovalidate: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return null;
                            }
                            else if(text.isValidEmailLogin() == false){
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter a valid email address',
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextFormField(
                          autovalidate: true,
                          validator: (text) {
                            if (text!.length < 8 && text.isNotEmpty) {
                              return "Password can't be under 8 characters";
                            }
                            else if(text.isEmpty){
                              return null;
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
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
                    PrimaryButton(label: 'Log in', onPressed: _loginOnPressed),
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
