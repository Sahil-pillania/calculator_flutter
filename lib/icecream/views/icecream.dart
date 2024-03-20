import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class Icecream_view extends StatefulWidget {
  const Icecream_view({super.key});

  @override
  State<Icecream_view> createState() => _Icecream_viewState();
}

class _Icecream_viewState extends State<Icecream_view> {
  Map<String, dynamic>? decodedIcecreams;

  @override
  void initState() {
    loadIcecreams();

    super.initState();
  }

  Future<void> loadIcecreams() async {
    final rawIcecream = await rootBundle.loadString("assets/icecream.json");
    decodedIcecreams = jsonDecode(rawIcecream);
    print(decodedIcecreams);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Icecream",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "We have something delicious for you.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (decodedIcecreams != null)
          const Text("Icecreams loaded.")
        else
          Center(child: const CircularProgressIndicator.adaptive())
      ]),
    );
  }
}
