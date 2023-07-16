import 'package:flutter/material.dart';

class TextFiledContainer extends StatelessWidget {
  final Widget child;
  const TextFiledContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size w = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: w.width * 1,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class ButtomContainer extends StatelessWidget {
  final Widget child;
  const ButtomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      width: size.width * 1,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
