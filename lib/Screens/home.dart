import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive.dart';
import 'dashboard.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        key: homeKey,
        height: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!Responsive.isMobile(context))
              const Expanded(
                child: SizedBox(height: 600, width: 600, child: BioWidget()),
              ),
            Flexible(
              child: Image.asset(
                "assets/me.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BioWidget extends StatelessWidget {
  const BioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi 👋, \nI am Muhammad Azhar.",
            style: GoogleFonts.aBeeZee(fontSize: 25),
          ),
          Text(
            "\nPassionate Flutter developer with a keen eye for crafting visually appealing and highly functional mobile applications. My journey into the world of app development began with a fascination for creating seamless user experiences, and Flutter has been my tool of choice to bring those ideas to life.\n",
            style: GoogleFonts.aBeeZee(fontSize: 15),
          ),
          ElevatedButton(
              onPressed: () {
                scrollAnimate(contactKey);
              },
              child: const Text(
                "Say Hello 👋",
              )),
        ]);
  }
}
