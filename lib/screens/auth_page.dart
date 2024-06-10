import 'package:abc/components/login_form.dart';
import 'package:abc/components/sign_up_form.dart';
import 'package:abc/components/social_button.dart';
import 'package:abc/utils/text.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
      child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.entext['Welcome_text']!,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Config.spaceSmall,
              Text(
                isSignIn
                ? AppText.entext['signIn_text']!
                : AppText.entext['register_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Config.spaceSmall,
              isSignIn ? LoginForm() : SignUpForm(),
              Config.spaceSmall,
              isSignIn ? Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(AppText.entext['forgot-password']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                ),
              ) : Container(),
              //Add social button sign in
              const Spacer(),
              Center(
                child: Text(AppText.entext['social-login']!,
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  SocialButton(social: 'google'),
                  SocialButton(social: 'facebook'),
                ],
              ),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text( isSignIn ?
                  AppText.entext['signUp_text']!
                 : AppText.entext['registered_text']!,
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),
                 TextButton(
                   onPressed: () {
                     setState(() {
                       isSignIn = !isSignIn;
                     });
                   },
                   child: Text(
                      isSignIn ? 'Sign Up': 'Sign In',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                 ),
                ],
              )
            ],
          ),
      ),
      )
    );
  }
}
