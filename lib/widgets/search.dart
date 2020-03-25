import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';
import 'sendbtn.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();

}

class _SearchState extends State {
  String _inputText = '';
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.0,
        right: ResponsiveLayout.isSmallScreen(context) ? 4 : 74,
        top: 10,
        bottom: 40,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 8), blurRadius: 8)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '输入你的问题',
                        ),
                        onChanged: (String val) {
                          setState(() {
                            _inputText = val;
                          });
                        },
                  )),
              Expanded(
                flex: 2,
                child: SendBtn(searchText: _inputText),
              )
            ],
          ),
        ),
      ),
    );
  }
}