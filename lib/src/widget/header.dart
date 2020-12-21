import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String name = 'Jack';
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: size.width,
      height: size.height * 0.08,
      child: Text(
        'whatsup'.trArgs([name]),
        style: Theme.of(context).textTheme.headline3,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
