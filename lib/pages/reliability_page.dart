import 'package:flutter/material.dart';

class ReliabilityPage extends StatelessWidget {
  final String page;
  const ReliabilityPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        page == "month"
            ? "Reliability Report: 1 Month"
            : "Reliability Report: 1 Year",
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}