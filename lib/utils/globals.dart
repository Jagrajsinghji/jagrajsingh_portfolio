import 'package:device_info_plus/device_info_plus.dart';
import 'package:jagrajsingh_portfolio/models/company.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';

Map<String, String> sections = {
  "Home": "More than code, I build digital realities",
  "Journey": "over destination",
  "Organizations": "who helped me reach here",
  "Skills": "to show off",
  "Projects": "I am proud of",
};

List<Company> organizations = [
  Company(
      name: "Immortal Ventures",
      assetImage: "assets/svg/org_svg/immortal.svg",
      experiences: [
        "I am presently in a part-time contract with Immortal Ventures",
        "I love building wonderful projects from clients across Europe.",
        "Creating digital realities while applying my knowledge of mobile applications and backend services.",
      ],
      link: MyURLs.immortalVenturesWebsite),
  Company(
      name: "Insurance & Mobility Solutions",
      assetImage: "assets/svg/org_svg/ims.svg",
      experiences: [
        "I got a wonderful Co-Op opportunity with IMS during my post graduation in Waterloo, Canada",
        "After Co-Op, I was offered a full-time role in the company as an Associate Software Engineer.",
        "It was so wonderful learning Canadian work culture, and ethics.",
      ],
      link: MyURLs.imsWebsite),
  Company(
      name: "Betaflux Pvt. Ltd.",
      assetImage: "assets/svg/org_svg/betaflux.svg",
      experiences: [
        "I got employed as an Associate Software Engineer, at Betaflux in May 2021",
        "I am involved with backend services in Java, C# and mobile apps in Flutter.",
        "Quoting Animesh (CEO) - \n \"You're putting out tremendously impacting products at Betaflux for clients across South East Asia, India, and Europe!\"",
      ],
      link: MyURLs.betafluxWebsite),
  Company(
      name: "WeExpan",
      assetImage: "assets/svg/org_svg/weexpan.svg",
      experiences: [
        "I received a job offer from WeExpan during my graduation year, in November 2020.",
        "I was appointed on Wowfas, an E-Commerce platform that we built from the ground up.",
        "It is a comprehensive online shopping business with a massive product assortment.",
      ],
      link: MyURLs.weExpanLinkedIn),
  Company(
      name: "Specso Technologies",
      assetImage: "assets/svg/org_svg/specso.svg",
      experiences: [
        "In July 2020, I began working as a summer intern at Specso Technologies.",
        "While working on several design-heavy projects, I honed my UI/UX talents.",
        "Flutter has helped me construct anything from E-Commerce applications to Service-based applications.",
      ],
      link: MyURLs.specsoLinkedIn),
  Company(
      name: "WeOtto",
      assetImage: "assets/svg/org_svg/weotto.svg",
      experiences: [
        "WeOtto was a subsidiary of Hyper, totally focused on creative IoT solutions.",
        "I started working on Home Automation platform called Weo and Otto",
        "I got the chance to work with multiple IoT protocols like MQTT, Zigbee, Matter and Raspberry-Pi Hubs",
      ],
      link: MyURLs.weOttoLinkedIn),
  Company(
      name: "Hyper",
      assetImage: "assets/svg/org_svg/hyper.svg",
      experiences: [
        "You never forget your first organisation, just as you never forget your first ♥️",
        "In August 2018, I entered Hyper during my second year of graduation.",
        "I began as a Application Developer, but the irresistible pull of curiosity drew me in, and I was given the opportunity to design groundbreaking IoT solutions.",
      ],
      link: MyURLs.hyperLinkedIn),
];

late final BrowserName browserName;
