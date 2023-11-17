import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  Projects({
    super.key,
  });
  final List<Map> projects = [
    {
      "name": "House Constructor",
      "desc": ''' An ecommerce mobile application to hire contractors for
house renovation.
'''
    },
    {
      "name": "Milk Supply Management System",
      "desc": ''' Mobile app for milk suppliers to manage their customers
billing and share invoice to the customers.
'''
    },
    {
      "name": "Health Care",
      "desc": ''' Mobile application to look for doctors and hospitals for
health care services. Patients can search for the service
they need through categories, state, city or zip code of
their area. Patient can also find their service through map
in the selected area.
'''
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Projects",
          style: TextStyle(fontSize: 30),
        ),
        CarouselSlider(
          options: CarouselOptions(height: 400.0),
          items: projects.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ProjectShow(
                  text: i['name'],
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
            child: Stack(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          )),
    );
  }
}
