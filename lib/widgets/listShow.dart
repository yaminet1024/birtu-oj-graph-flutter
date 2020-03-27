

import 'package:educational_robot/widgets/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

typedef PageItemClick = void Function(String searchKey, int cur);


class ListShow extends StatelessWidget {
  final List resultList;
  final String seachKey;
  final PageItemClick onPageItemClick; 
  final int totalPages;
  ListShow({this.resultList, this.seachKey ,this.onPageItemClick, this.totalPages});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child:ListView.builder(
        itemCount: resultList.length == 0 ? 0 : resultList.length + 1,
        itemBuilder: (context,index){
              if(index == resultList.length) {
                return Container(
                  child: Center(
                    child: Pagination(searchKey: seachKey, onPageItemClick: onPageItemClick, totalPages: totalPages),
                  ),
                );
              } else {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation( //滑动动画
                      verticalOffset: 50.0,
                      child: FadeInAnimation( //渐隐渐现动画
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                                right: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                                left: BorderSide(color: Color(0xFFff5f3f5), width: 1, style: BorderStyle.solid),
                              )
                            ),
                            child: ListTile(
                              title: Text(resultList[index].pid),
                              // title: Text('P1111'),
                              // trailing: Icon(Icons.keyboard_arrow_right),
                              // subtitle: Text('买卖股票的最佳时期'),
                              subtitle: Container(
                                child: Text(resultList[index].title)
                                // child: Html(data: resultList[index].content),
                              ),
                            ),
                          ), 
                        ),
                      ),
                  ),
              );
              }
        },
       ),
   );
  }
}