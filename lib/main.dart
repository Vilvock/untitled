import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/res/owner_colors.dart';

import 'midias/onboarding_facebook.dart';




void main() async {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "IControl",
    initialRoute:'/ui/onboarding',
    color: OwnerColors.colorPrimary,
    routes: {
      '/ui/onboarding': (context) => Onboarding(),

    },
  ));
}