import "dart:convert";

import "package:calculatorapp/icecream/model/icecream.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class Icecream_view extends StatelessWidget {
  Icecream_view({super.key});

  // @override
  // void initState() {
  //   loadIcecreams();

  //   super.initState();
  // }

  Future<List<Icecream>?> loadIcecreams() async {
    final rawIcecream = await rootBundle.loadString("assets/icecream.json");
    // final decodedIcecreams = jsonDecode(rawIcecream);
    // print(rawIcecream.toString());
    final icecreams = icecreamDatafromJson(rawIcecream.toString());
    print("debugging ************************************************");
    print("Raw ice cream data: $rawIcecream");
    print("Parsed ice cream data: $icecreams");
    print("Ice creams list: ${icecreams?.icecreams}");
    await Future.delayed(const Duration(seconds: 1));
    return icecreams!.icecreams;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Icecreams",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "We have something delicious for you.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                      future: loadIcecreams(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final icecreams = snapshot.data;
                          // return Text(
                          //   icecreams!.first.flavor,
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          // );
                          if (icecreams != null && icecreams.isNotEmpty) {
                            return Text(
                              icecreams!.first.flavor,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          } else {
                            return Text(
                                'No ice creams available'); // Handle case when icecreams is null or empty
                          }
                          // return Text("data");
                        } else {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        }
                      }),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
