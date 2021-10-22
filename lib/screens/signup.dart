import 'package:flutter/material.dart';
import 'package:hibye/components/primary_button.dart';
import 'package:hibye/screens/login.dart';
import 'package:hibye/services/authentication_service.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _signupOnPressed() {
      context.read<AuthenticationService>().signUp(
            fullName: fullNameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    }

    void _loginOnPressed() {
      Navigator.pushReplacement(
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextFormField(
                          autovalidate: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Full name can't be empty";
                            }
                            return null;
                          },
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextFormField(
                          autovalidate: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Email can't be empty";
                            } else if (text.isValidEmailSignUp() == false) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Card(
                        child: TextFormField(
                          autovalidate: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Password can't be empty";
                            } else if(text.length < 8){
                              return "Password must have atleast 8 character";
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
                    PrimaryButton(
                        label: 'Sign up', onPressed: _signupOnPressed),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
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
