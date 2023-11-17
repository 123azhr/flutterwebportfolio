import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive.dart';
import 'dashboard.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    leadingWidth: !Responsive.isMobile(context) ? 250 : 300,
    leading: !Responsive.isMobile(context)
        ? Center(
            child: Text(
              "Muhammad Azhar",
              style: GoogleFonts.pinyonScript(fontSize: 30),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runSpacing: 0,
              spacing: 0,
              children: [
                BarButton(
                  onTap: () {
                    scrollAnimate(homeKey);
                  },
                  text: "Home",
                ),
                const SizedBox(
                  width: 20,
                ),
                BarButton(
                  onTap: () {
                    scrollAnimate(skillsKey);
                  },
                  text: "Skills",
                ),
                const SizedBox(
                  width: 20,
                ),
                BarButton(
                  onTap: () {
                    scrollAnimate(contactKey);
                  },
                  text: "Contact",
                ),
              ],
            ),
          ),
    actions: !Responsive.isMobile(context)
        ? [
            BarButton(
              onTap: () {
                scrollAnimate(homeKey);
              },
              text: "Home",
            ),
            const SizedBox(
              width: 20,
            ),
            BarButton(
              onTap: () {
                scrollAnimate(skillsKey);
              },
              text: "Skills",
            ),
            const SizedBox(
              width: 20,
            ),
            BarButton(
              onTap: () {
                scrollAnimate(contactKey);
              },
              text: "Contact",
            ),
            const SizedBox(
              width: 20,
            )
          ]
        : null,
  );
}

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
          ),
        ));
  }
}
