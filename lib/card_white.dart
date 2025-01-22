import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({super.key,this.value});
final value;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text("$value"),
    );
  }
}
