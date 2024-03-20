import "package:flutter/material.dart";

class Icecream_view extends StatefulWidget {
  const Icecream_view({super.key});

  @override
  State<Icecream_view> createState() => _Icecream_viewState();
}

class _Icecream_viewState extends State<Icecream_view> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text("Icecream"),
      ]),
    );
  }
}
