import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
          ],
        ),
      ),
    );
  }
}

