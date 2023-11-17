import 'package:flutter/material.dart';
import '../responsive.dart';
import 'contact.dart';
import 'skills.dart';
import 'widgets.dart';
import 'home.dart';
import 'projects.dart';

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
      appBar: appBar(context),
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
              const Home(),
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
              Projects(),
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
