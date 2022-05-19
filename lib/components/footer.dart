import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
            color: MyTheme.primary,
            border: const Border(top: BorderSide(color: MyTheme.white))),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Copyright © 2022 Jagraj Singh. All rights reserved.",
              style: TextStyle(fontSize: 14, color: MyTheme.white),
            )));
  }
}
