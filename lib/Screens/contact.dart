import 'package:flutter/material.dart';

import 'dashboard.dart';

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
