import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/my_theme.dart';
import 'footer.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          MyTheme.whatStandButton.withOpacity(.4),
          MyTheme.whatStandButton
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: Text.rich(
              TextSpan(text: "Certificates", children: [
                TextSpan(
                  text: "\nmy baby steps",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      color: MyTheme.text,
                      fontSize: 12),
                )
              ]),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.text,
                  fontSize: 50),
            ),
          ),
          Expanded(flex: 0,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children:  [
               Container(decoration: const BoxDecoration(color:
               Colors.white,
                 boxShadow: [
                   BoxShadow(color: Colors.black12,offset: Offset(15, 15)),
                   BoxShadow(color: Colors.black26,offset: Offset(-15, -15)),
                 ],borderRadius: BorderRadius.only(
                     bottomLeft:Radius.circular(20),
                     topRight:Radius.circular(20),

                   )
               ),height: 300,margin:const EdgeInsets.symmetric(horizontal: 30),)
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Footer()
        ],
      ),
    );
  }
}
