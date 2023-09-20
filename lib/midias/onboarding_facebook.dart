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

            Text(userObj.isNotEmpty ? userObj['name'] : ""),
            Text(userObj.isNotEmpty ? userObj['email'] : "" ),

            Container(
              margin: EdgeInsets.all(Dimens.minMarginApplication),
              child: ElevatedButton(
                  style: Styles().styleDefaultButton,
                  onPressed: () {
                    FacebookAuth.instance.login(permissions: ['public_profile' , 'email']).then((value) => (value) {
                          FacebookAuth.instance.getUserData().then((userData) async {

                            setState(() {
                              userObj = userData;
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

