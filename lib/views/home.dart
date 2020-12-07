import 'package:flutter/material.dart';
import 'package:task_manager_getx/views/widgets/appBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Text('Begin'),
      ),
    );
  }
}
