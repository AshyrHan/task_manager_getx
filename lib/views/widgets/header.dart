import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/style.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: size.width,
      height: size.height * 0.08,
      //color: Colors.amberAccent,
      child: Text(
        'What\'s up, Olivia ',
        style: Style.h1(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
