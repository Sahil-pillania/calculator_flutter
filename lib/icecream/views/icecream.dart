import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class Icecream_view extends StatelessWidget {
  Icecream_view({super.key});

  // @override
  // void initState() {
  //   loadIcecreams();

  //   super.initState();
  // }

  Future<Map<String, dynamic>> loadIcecreams() async {
    final rawIcecream = await rootBundle.loadString("assets/icecream.json");
    final decodedIcecreams = jsonDecode(rawIcecream);
    // print(decodedIcecreams);
    await Future.delayed(const Duration(seconds: 3));
    return decodedIcecreams;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Icecreams",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "We have something delicious for you.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Expanded(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: loadIcecreams(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data as Map<String, dynamic>;

                      return Text(icecreams["icecreams"][0]["flavor"]);
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  }),
            ],
          ),
        ))
      ]),
    );
  }
}
