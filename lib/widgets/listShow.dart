

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListShow extends StatelessWidget {
  final resultList;
  ListShow({this.resultList});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child:ListView.builder(
        // scrollDirection: Axis.horizontal,
        // itemCount: resultList.length,
        itemCount: 10,
        itemBuilder: (context,index){
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation( //滑动动画
                    verticalOffset: 50.0,
                    child: FadeInAnimation( //渐隐渐现动画
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                              right: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                              left: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                            )
                          ),
                          child: ListTile(
                            // title: Text(resultList[index].pid),
                            title: Text('P1111'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            subtitle: Text('买卖股票的最佳时期'),
                            // subtitle: Container(
                            //   child: Text(resultList[index].title)
                            //   // child: Html(data: resultList[index].content),
                            // ),
                          ),
                        ), 
                      ),
                    ),
                ),
            );
        },
       ),
   );
  }
}