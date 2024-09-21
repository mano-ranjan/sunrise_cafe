import 'package:flutter/material.dart';

class OtherTabWidget extends StatefulWidget {
  const OtherTabWidget({super.key});

  @override
  State<OtherTabWidget> createState() => _SpecialTabWidgetState();
}

class _SpecialTabWidgetState extends State<OtherTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("Other");
  }
}
