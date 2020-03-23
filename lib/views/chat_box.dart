import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef RemoveClick = void Function();

class ChatBoxView extends StatefulWidget {
  ChatBoxView({Key key, this.onRemoveClick}) : super(key: key);

  final RemoveClick onRemoveClick;

  @override
  State<StatefulWidget> createState() {
    return _ChatBoxState();
  }
}

class _ChatBoxState extends State<ChatBoxView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
          color: Colors.black54.withOpacity(0.1),
          blurRadius: 20,
          spreadRadius: 1,
        ),
      ]),
      child: SingleChildScrollView(
        child: Container(
          width: 340,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(16),
                  height: 60,
                  alignment: Alignment.centerLeft,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0XFF50a1ff),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Birtu",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onTap: () {
                          widget.onRemoveClick();
                        },
                      )
                    ],
                  )),
              //聊天框
              Container(
                height: 400,
//                color: Color(0XFFf8fafc),
              color: Colors.white,
                width: double.maxFinite,
                child:  ListView(
                  children: <Widget>[
                    chatItem(),
                    myChatItem(),
                    chatItem(),
                    myChatItem(),
                    chatItem(),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        blurRadius: 30,
                        spreadRadius: 1,
                        offset: Offset(0, -30)
                      )
                    ],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16)),
                    ),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: '问我点什么吧，比如P101的题目是什么？',
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        border: const OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 2,
                        right: 8,
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "发送",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))))),
                    Positioned(
                      bottom: 0,
                      left: -10,
                      child: FlatButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.keyboard_voice,
                            color: Colors.blueAccent,
                          ),
                          label: Container()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  
  Widget chatItem(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset("assets/fairy.png",
                  width: 28, height: 28),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Text("Birtu机器人"),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 36,bottom: 16,right: 16,top: 4),
            padding: EdgeInsets.all(12),
            child: Text("你好呀，我是你的专属学习顾问Birtu精灵。",style: TextStyle(
              color: Color(0XFF3c4248)
            ),),
            decoration: BoxDecoration(
              color: Color(0XFFf8f8f8),
              borderRadius: BorderRadius.circular(16)
            ),
          ),
        ],
      ),
    );
  }

  Widget myChatItem(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Text("我"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(Icons.person,size: 26,)
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 36,bottom: 16,right: 16,top: 4),
            padding: EdgeInsets.all(12),
            child: Text("请问P101的题解是多少？",style: TextStyle(
                color: Color(0XFF3c4248)
            ),),
            decoration: BoxDecoration(
                color: Color(0XFFf8f8f8),
                borderRadius: BorderRadius.circular(16)
            ),
          ),
        ],
      ),
    );
  }
  
}
