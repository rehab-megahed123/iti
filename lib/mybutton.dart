import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String label;
  const MyButton({super.key, required this.label});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(widget.label)),
      ),
      
    );
  }
}
