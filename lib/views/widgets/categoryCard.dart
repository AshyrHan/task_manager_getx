import 'package:flutter/material.dart';
import 'package:task_manager_getx/style/appColors.dart';
import 'package:task_manager_getx/style/style.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      height: size.height * 0.18,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          final _complateTask = cardList[index].complateTasts;
          final _initTask = cardList[index].initTasks;
          return Container(
            margin: EdgeInsets.only(right: 10.0),
            width: size.width * 0.5,
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${cardList[index].complateTasts}/${cardList[index].initTasks} Tasks',
                      style: Style.h4(),
                    ),
                    Text(
                      cardList[index].cardName,
                      style: Style.h2(),
                    ),
                    LinearProgressIndicator(
                      value: _complateTask / _initTask,
                      backgroundColor: Colors.black12,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(cardList[index].color),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardClass {
  String cardName;
  int complateTasts;
  int initTasks;
  Color color;
  CardClass({this.cardName, this.complateTasts, this.initTasks, this.color});
}

List<CardClass> cardList = [
  CardClass(
      cardName: 'Business',
      complateTasts: 14,
      initTasks: 27,
      color: AppColors.taskColor),
  CardClass(
      cardName: 'Pesonal',
      complateTasts: 10,
      initTasks: 14,
      color: AppColors.taskColor2),
  CardClass(
      cardName: 'Family',
      complateTasts: 4,
      initTasks: 19,
      color: AppColors.taskColor3),
];
