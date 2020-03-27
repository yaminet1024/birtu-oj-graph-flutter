import 'package:educational_robot/widgets/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:grpclib/grpclib.dart';

typedef PageItemClick = void Function(String searchKey, int cur);

class ListShow extends StatelessWidget {
  final List<ProblemEntity> resultList;
  final String seachKey;
  final PageItemClick onPageItemClick;
  final int totalPages;
  ListShow(
      {this.resultList, this.seachKey, this.onPageItemClick, this.totalPages});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: resultList.length == 0 ? 0 : resultList.length + 1,
        itemBuilder: (context, index) {
          if (index == resultList.length) {
            return Container(
              child: Center(
                child: Pagination(
                    searchKey: seachKey,
                    onPageItemClick: onPageItemClick,
                    totalPages: totalPages),
              ),
            );
          } else {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                //滑动动画
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  //渐隐渐现动画
                  child: InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(
                                color: Color(0xFFff5f3f5),
                                width: 1,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                color: Color(0xFFff5f3f5),
                                width: 1,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                color: Color(0xFFff5f3f5),
                                width: 1,
                                style: BorderStyle.solid),
                          )),
                      child: ListTile(
                          leading: Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(
                                resultList[index].pid,
                                style: TextStyle(color: Colors.grey),
                              )),
                          title: Text(resultList[index].title),
                          trailing: Container(
                            width: 200,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(itemBuilder: (BuildContext context, int tagIndex){
                                    return Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 8),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Text(
                                            resultList[index].tags[tagIndex].tagString,style: TextStyle(color: Colors.white),),
                                      ),
                                    );
                                  },
                                    itemCount: resultList[index].tags.length > 1 ? 1 : resultList[index].tags.length,
                                    scrollDirection:Axis.horizontal,
                                  ),
                                ),
                                SizedBox(width: 16,),
                                Text(
                                    resultList[index].difficulty.difficultyString)
                              ],
                            ),
                          )),
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
