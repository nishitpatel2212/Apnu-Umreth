import 'package:apnu_umreth/components/common_app_bar.dart';
import 'package:flutter/material.dart';

class TrainDetailScreen extends StatelessWidget {
  final String title;

  TrainDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Schedule',
        actions: [],
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
