import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          // calculator display
          DisplayOne(hint: "Enter First Number"),
          SizedBox(height: 10.0),
          DisplayOne(hint: "Enter Second Number"),
          SizedBox(height: 30.0),
          Text("0",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {},
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

class DisplayOne extends StatelessWidget {
  const DisplayOne({super.key, this.hint = "Enter a Number"});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
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
