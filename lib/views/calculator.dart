import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

// lifecycle declaration
  late AppLifecycleListener _listener;
  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    // lifecycle initialization
    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetact,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  // lifecycle methods
  void _onShow() => print("onShow called **********************************");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetact() => print("onDetected called");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  void _onStateChange(AppLifecycleState state) =>
      print("onStateChange called : $state");

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          // calculator display
          Display(hint: "Enter First Number", controller: displayOneController),
          const SizedBox(height: 10.0),
          Display(
              hint: "Enter Second Number", controller: displayTwoController),
          const SizedBox(height: 30.0),
          Text(
              key: Key("result"),
              z.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  z = num.tryParse(displayOneController.text)! +
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  z = num.tryParse(displayOneController.text)! -
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  z = num.tryParse(displayOneController.text)! *
                      num.tryParse(displayTwoController.text)!;
                  print(z);
                  setState(() {});
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  z = num.tryParse(displayOneController.text)! /
                      num.tryParse(displayTwoController.text)!;
                  setState(() {});
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
          ),
          //Expand
          // calculator buttons
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display(
      {super.key, this.hint = "Enter a Number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          // labelText: "",
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
