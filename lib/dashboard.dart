import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'responsive.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

GlobalKey skillsKey = GlobalKey();
GlobalKey contactKey = GlobalKey();
GlobalKey homeKey = GlobalKey();
ScrollController _scrollController = ScrollController();
List skills = [
  "https://firebasestorage.googleapis.com/v0/b/portfolio-1361d.appspot.com/o/flutter-160860.png?alt=media&token=359f2e7b-bdc9-435c-9121-fdc65bf9eefb",
  "https://firebasestorage.googleapis.com/v0/b/portfolio-1361d.appspot.com/o/pngwing.com%20(3).png?alt=media&token=f304c962-925f-428b-9b05-14eb7c943e20",
  "https://firebasestorage.googleapis.com/v0/b/portfolio-1361d.appspot.com/o/pngwing.com%20(1).png?alt=media&token=8a3ccc51-68bb-48c3-a9b6-90257cc70dac",
  "https://firebasestorage.googleapis.com/v0/b/portfolio-1361d.appspot.com/o/pngwing.com%20(5).png?alt=media&token=19f7f7e8-7389-46f5-99f7-931dd3e53f7a"
];

class _DashboardState extends State<Dashboard> {
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.minScrollExtent) {
        setState(() {
          isVisible = true;
        });
      } else {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = Responsive.getSize(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      floatingActionButton: isVisible
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              width: size.width,
              child: Image.asset(
                fit: BoxFit.fill,
                "assets/background.jpg",
              ),
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  key: homeKey,
                  height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!Responsive.isMobile(context))
                        const Expanded(
                          child: SizedBox(
                              height: 600, width: 600, child: BioWidget()),
                        ),
                      Flexible(
                        child: Image.asset(
                          "assets/me.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 0,
              ),
              if (Responsive.isMobile(context))
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BioWidget(),
                ),
              const SizedBox(
                height: 50,
              ),
              const Skills(),
              const SizedBox(
                height: 50,
              ),
              const Projects(),
              const SizedBox(
                height: 50,
              ),
              Cantact(size: size),
              const SizedBox(
                height: 50,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Projects",
          style: TextStyle(fontSize: 30),
        ),
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ProjectShow(
                  text: i.toString(),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}

class ProjectShow extends StatelessWidget {
  const ProjectShow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'text $text',
              style: TextStyle(fontSize: 16.0),
            ),
          )),
    );
  }
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

void scrollAnimate(GlobalKey<State<StatefulWidget>> widgetKey) {
  RenderBox renderBox =
      widgetKey.currentContext!.findRenderObject() as RenderBox;
  double positionToScroll = renderBox.localToGlobal(Offset.zero).dy;
  // Scroll to the specified position
  _scrollController.animateTo(
    positionToScroll,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

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

class Cantact extends StatelessWidget {
  const Cantact({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.4,
      key: contactKey,
      child: Column(children: [
        const Text(
          "Contact",
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Email:        ",
            ),
            Flexible(
              child: SizedBox(
                width: size.width / 1.5,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Subject:   ",
            ),
            Flexible(
              child: SizedBox(
                width: size.width / 1.5,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Body:        ",
            ),
            Flexible(
              child: SizedBox(
                width: size.width / 1.5,
                child: TextFormField(
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(16)),
              fixedSize: MaterialStatePropertyAll(Size(100, 40))),
          onPressed: () {},
          icon: Text("Send"),
          label: Icon(Icons.send),
        )
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
