import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    leading: InkWell(
      child: Icon(Icons.menu),
      onTap: () {},
    ),
    actions: [
      InkWell(
        child: Icon(Icons.search),
        onTap: () {},
      ),
      InkWell(
        child: Icon(Icons.notifications),
        onTap: () {},
      ),
    ],
  );
}
