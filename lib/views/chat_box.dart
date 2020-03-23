import 'dart:async';

import 'package:educational_robot/service/qa_service.dart';
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

class MessageModel{
  int author = 0; //0是机器人，1是自己
  String message;
}

class _ChatBoxState extends State<ChatBoxView> {

  List<MessageModel> chatListData = [];

  final qaController = TextEditingController();
  final ScrollController _listController = ScrollController();



  @override
  void initState() {
    super.initState();
    MessageModel welcomeMessage = MessageModel();
    welcomeMessage.message = "你好呀，我是你的专属学习顾问Birtu精灵。";
    welcomeMessage.author = 0;
    setState(() {
      chatListData.add(welcomeMessage);
    });
  }

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
              color: Colors.white,
                width: double.maxFinite,
                child:  ListView.builder(itemBuilder: (BuildContext context,int index){
                  if(chatListData[index].author == 0){
                    return chatItem(chatListData[index]);
                  }else{
                    return myChatItem(chatListData[index]);
                  }
                },itemCount: chatListData.length,controller: _listController,),
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
                      controller: qaController,
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
                            onPressed: () async{
                              if(qaController.text.isEmpty){
                                return;
                              }
                              String inputText = qaController.text;
                              qaController.clear();

                              MessageModel myMessageModel = MessageModel();
                              myMessageModel.message = inputText;
                              myMessageModel.author = 1;
                              setState(() {
                                chatListData.add(myMessageModel);
                                scrollToListBottom();
                              });

                              QAService().getAnswer(inputText, (int errCode, String s){
                                MessageModel birtuMessageModel = MessageModel();
                                birtuMessageModel.message = s;
                                birtuMessageModel.author = 0;
                                setState(() {
                                  chatListData.add(birtuMessageModel);
                                  scrollToListBottom();
                                });
                              });
                            },
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

  void scrollToListBottom(){
    if(chatListData.length > 0){
      Timer(Duration(milliseconds: 100), (){
        _listController.animateTo(_listController.position.maxScrollExtent, duration: const Duration(milliseconds: 100), curve: Curves.easeOut,);
      });
    }
  }
  
  
  Widget chatItem(MessageModel messageModel){
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
            child: Text(messageModel.message,style: TextStyle(
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

  Widget myChatItem(MessageModel messageModel){
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
            child: Text(messageModel.message,style: TextStyle(
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
