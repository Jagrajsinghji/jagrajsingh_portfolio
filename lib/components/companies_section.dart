import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/my_theme.dart';
import 'companies/betaflux_container.dart';
import 'companies/hyper_container.dart';
import 'companies/specso_container.dart';
import 'companies/weexpan_container.dart';
import 'footer.dart';

class CompaniesSection extends StatefulWidget {
  const CompaniesSection({Key? key}) : super(key: key);

  @override
  State<CompaniesSection> createState() => _CompaniesSectionState();
}

class _CompaniesSectionState extends State<CompaniesSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width<=620;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          MyTheme.greenBush.withOpacity(.1),
          MyTheme.whatStandButton.withOpacity(.4)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: Text.rich(
              TextSpan(text: "Organizations", children: [
                TextSpan(
                  text: "\nwho helped me reach here",
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
          SizedBox(
            height: isMobile?1300:300,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: isMobile?Axis.vertical:Axis.horizontal,
              children: const [
                HyperContainer(),
                SpecsoContainer(),
                WeExpanContainer(),
                BetafluxContainer()
              ],
            ),
          ),
          const SizedBox(height: 40,),
          const Footer()
        ],
      ),
    );
  }
}
