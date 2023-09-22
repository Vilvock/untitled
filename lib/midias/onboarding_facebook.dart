import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../res/dimens.dart';
import '../res/strings.dart';
import '../res/styles.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  Map userObj = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> handleAppleSignIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'de.lunaone.flutter.signinwithappleexample.service',
          redirectUri: Uri.parse(
            'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
          ),
        ),
      );

      final email = credential.email;
      final firstName = credential.givenName;
      final lastName = credential.familyName;
      final authorizationCode = credential.authorizationCode;
      final nonce = credential.userIdentifier;
      final state = credential.state;

      print("$email, $firstName, $lastName");
    } catch (error) {
      print('Erro ao fazer login com a Apple: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            SizedBox(height: 40,),
            Text(userObj.isNotEmpty ? userObj['name'] : "aaaa", style: TextStyle(color: Colors.black87)),
            Text(userObj.isNotEmpty ? userObj['email'] : "aaaa", style: TextStyle(color: Colors.black87)),

            Container(
              margin: EdgeInsets.all(Dimens.minMarginApplication),
              child: ElevatedButton(
                  style: Styles().styleDefaultButton,
                  onPressed: () async {
                    FacebookAuth.instance.login(permissions: ['public_profile', 'email']).then((value) {
                          FacebookAuth.instance.getUserData().then((userData) async {

                            setState(() {
                              userObj = userData;
                              print("dsasdassda" + userObj.toString());
                            });
                          });
                    });
                  },
                  child: Text(
                    "facebook",
                    style: Styles().styleDefaultTextButton,
                  )),
            ),

            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.all(Dimens.minMarginApplication),
              child: ElevatedButton(
                  style: Styles().styleDefaultButton,
                  onPressed: () async {

                  },
                  child: Text(
                    "google",
                    style: Styles().styleDefaultTextButton,
                  )),
            ),

            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.all(Dimens.minMarginApplication),
              child: ElevatedButton(
                  style: Styles().styleDefaultButton,
                  onPressed: () async {

                  },
                  child: Text(
                    "apple",
                    style: Styles().styleDefaultTextButton,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

