
import 'package:educational_robot/utils/responsiveLayout.dart';
import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {

  // Pagination({this.pageList, this.cur});

  final List pageList = ['1', '2', '3', '...'];
  final cur = 1;

  List<Widget> pageItem() {
    return pageList.map((text) {
      return Container(
        margin: EdgeInsets.only(left: 6, right: 6),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: cur.toString() == text ? Border.all(color: Color(0xFF50a1ff), width: 1) : Border.all(color: Color(0xFF78828c).withOpacity(0.1), width: 1),
        ),
        child: Center(
          child: InkWell(
            child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold"),),
            onTap: () {
            }),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveLayout.isSmallScreen(context) 
              ?
              EdgeInsets.symmetric(horizontal: 16, vertical: 30)
              : EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
          Text('111'),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[...pageItem()],
          ),
          Text('data')
        ]
      )
    ); 
  }
}