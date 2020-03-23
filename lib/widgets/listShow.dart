

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child:ListView.builder(
          itemCount: 20,
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
                              title: Text('Horse'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              subtitle: Container(
                                child: Text('你是时候是分很多考虑')
                              ),
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