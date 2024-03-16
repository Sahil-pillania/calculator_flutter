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

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
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
          Text(z.toString(),
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
          )
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
          // labelText: "0",
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
