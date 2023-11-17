import 'package:flutter/material.dart';

import 'dashboard.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: skillsKey,
      child: Column(children: [
        const Text(
          "Skills",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: List.generate(
                skills.length, (index) => SkillsWidget(url: skills[index])))
      ]),
    );
  }
}

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: Image.network(
        url,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
