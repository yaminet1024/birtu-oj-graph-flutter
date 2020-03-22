import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBoxView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatBoxState();
  }
}

class _ChatBoxState extends State<ChatBoxView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Container(
        width: 360,
        height: 600,
        child: Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(16),
              height: 60,
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Color(0XFF50a1ff), boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                ),
              ]),
              child: Text(
                "Birtu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              height: 400,
              color: Color(0XFFf8fafc),
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 140,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                ),
              ]),
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
                      child: FlatButton(onPressed: () {},
                          child: Text("发送",style: TextStyle(color: Colors.white),),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                      )),
                  Positioned(
                    bottom: 0,
                    left: -10,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(Icons.keyboard_voice,color: Colors.blueAccent,), label: Container()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
