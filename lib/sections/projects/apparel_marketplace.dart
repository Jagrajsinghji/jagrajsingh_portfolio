import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ApparelMarketplace extends StatelessWidget {
  const ApparelMarketplace({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.read<ThemeProvider>();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(15, 15)),
                      BoxShadow(
                          color: Colors.black26, offset: Offset(-15, -15)),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                height: 300,
                width: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/projects/apparel_marketplace.png",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (rect) {
                    return LinearGradient(
                      colors: [
                        Colors.blueGrey.shade100,
                        themeProvider.apparelMarketplaceColor,
                        Colors.blueGrey.shade100
                      ],
                    ).createShader(rect);
                  },
                  child: Text("Apparel Marketplace",
                      style: Theme.of(context).textTheme.headlineLarge!),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 700,
                child: Text.rich(
                  TextSpan(
                    text: "Apparel Marketplace ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade100,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "is a modern eCommerce platform built with Flutter for fashion lovers. It provides a smooth and stylish shopping experience.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🛍️ Browse & Shop: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Explore trendy products across multiple categories.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "❤️ Wishlist & Discounts: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Save your favorites and get exclusive deals.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "📦 Order Tracking: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.greenAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Track your purchases with real-time updates.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "⚡ Seamless & Fast: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orangeAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Built with Firebase & state management (Provider/Riverpod).",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "🚀 Checkout the code!:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink.shade100,
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(
                            MyURLs.apparelMarketplaceGithubLink)) {
                          launchUrl(MyURLs.apparelMarketplaceGithubLink);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                      child:
                          Text("GitHub", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
