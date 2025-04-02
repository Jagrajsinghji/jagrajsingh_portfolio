import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/utils/globals.dart';

import 'company_container.dart';

class CompaniesSection extends StatefulWidget {
  const CompaniesSection({super.key});

  @override
  State<CompaniesSection> createState() => _CompaniesSectionState();
}

class _CompaniesSectionState extends State<CompaniesSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: Text.rich(
              TextSpan(text: "ORGANIZATIONS", children: [
                TextSpan(
                    text: "\nwho helped me reach here",
                    style: Theme.of(context).textTheme.headlineSmall!)
              ]),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!),
        ),
        SizedBox(
          height: isMobile ? 1300 : 300,
          child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
              children:
                  organizations.map<Widget>(CompanyContainer.new).toList()),
        )
      ],
    );
  }
}
