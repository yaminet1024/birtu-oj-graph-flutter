import 'package:educational_robot/service/grpc_service.dart';
import 'package:educational_robot/widgets/listShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  @override
  void initState() {
    super.initState();
    GrpcService().sayHelloToGrpc();
    GrpcService().getProblem();
  }

  bool showChatView = false;
  var searchKey;//让搜索框保持
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Expanded(
              //   child: Container(
              //     child: SearchFailed(),
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(colors: [
              //         Color(0XFFF8FAFC),
              //         Color(0xFFF8FBFF),
              //       ]),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFFF8FAFC),
                    Color(0xFFF8FBFF),
                   ]),
                  // color: Color(0xFFf5f3f5)
                  ),
                  padding: ResponsiveLayout.isSmallScreen(context) 
                          ?
                          EdgeInsets.symmetric(horizontal: 16, vertical: 30)
                          : EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  child: ListShow(),
                ),
              )
            ]
          )
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