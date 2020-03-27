import 'dart:io';

import 'package:educational_robot/service/grpc_service.dart';
import 'package:educational_robot/widgets/listShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grpclib/grpclib.dart';
import '../widgets/navbar.dart';
import '../widgets/searchFailed.dart';
import '../utils/responsiveLayout.dart';

class SearchPage extends StatefulWidget{
  SearchPage({this.arguments});
  final Map arguments;

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }

}

class _SearchPageState extends State<SearchPage>{
  bool showChatView = false;
  String searchKey = "";//当前搜索的关键字
  List searchResult = [];
  int totalPages;
  double listHeight = 0;

  @override
  void initState() {
    super.initState();
    GrpcService().getProblem(1,(int errCode, List<ProblemEntity> result, int pageSize) {
      print(errCode);
      setState(() {
        // errCode == 'success' ? searchResult = result : searchResult = [];
        if(errCode == 0) {
          searchResult = result;
          totalPages = pageSize;
          listHeight = ((searchResult.length + 1) * 95) as double;
        } else {
          searchResult = [];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFF8FBFF),
          Color(0xFFFCFDFD),
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom:28),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!ResponsiveLayout.isSmallScreen(context))
                        NavBar(showSearch: true,onNavBarItemClick: (String s){
                          if (s == "首页") {
                            Navigator.pushNamed(context, '/');
                          } else {
                            setState(() {
                              showChatView = !showChatView;
                            });
                          }
                        },
                        initKey:searchKey != null ? searchKey : widget.arguments["searchContent"],
                        onInputSearchChange: (String s) {
                          setState(() {
                            searchKey = s;
                          });
                        },
                      )
                      else
                        Column(
                          children: [
                            NavBar(showSearch: false),
                            SearchInput(
                              onClick: (){
                                print('何冲呀');
                              },
                              initKey: searchKey != null ? searchKey : widget.arguments["searchContent"],
                              onInputSearchChange: (String s) {
                                setState(() {
                                  searchKey = s;
                                });
                              }
                            )
                          ]
                        )
                    ]
                  )
                ),
                searchResult.isNotEmpty ?
                  Center(
                    child: Container(
                      height: 400,
                      child: SearchFailed(),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0XFFF8FAFC),
                          Color(0xFFF8FBFF),
                        ]),
                      ),
                    )
                  )
                // )
                :
                Flexible(
                  child: Container(
                    padding: ResponsiveLayout.isSmallScreen(context)
                            ?
                            EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                            : EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                    child: ListShow(resultList: searchResult, totalPages: totalPages, seachKey: searchKey, onPageItemClick: (String searchKey, int cur) {
                      GrpcService().getProblem(cur,(int errCode, List<ProblemEntity> result, int pageSize) {
                        setState(() {
                          // errCode == 'success' ? searchResult = result : searchResult = [];
                          if(errCode == 0) {
                            searchResult = result;
                            listHeight = ((searchResult.length + 1) * 95) as double;
                          } else {
                            searchResult = [];
                          }
                        });
                      });
                    },)
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

typedef GestureTapCallback = void Function();
typedef InputSearchChange = void Function(String s);

class SearchInput extends StatelessWidget {
    // SearchInput({this.onClick});
  SearchInput({Key key, this.onClick, this.initKey, this.onInputSearchChange}) : super(key: key);

  final GestureTapCallback onClick;
  final InputSearchChange onInputSearchChange;
  final String initKey;
  final TextEditingController _selectionController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
     _selectionController.text = initKey;
     _selectionController.selection = TextSelection(baseOffset: _selectionController.text.length , extentOffset: _selectionController.text.length);
    return Stack(
      alignment: const Alignment(1, 1),
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(left:45,right:45),
          child:TextField(
            controller: _selectionController,
            style: TextStyle(textBaseline: TextBaseline.alphabetic),
            onChanged: (String s){
              onInputSearchChange(s);
            },
            decoration: InputDecoration(
              hintText: "输入问题搜索...",
              contentPadding: EdgeInsets.only(left: 20, right: 40, top: 10, bottom: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30)
                ),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color(0xFFf6f4f6)
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30)
                ),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color(0xFFc229e8)
                )
              )
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(right:60, bottom:12),
          child: InkWell(
            child: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            onTap: () {
              onClick();
            },
          ),
        ),
      ],
    );
  }
}