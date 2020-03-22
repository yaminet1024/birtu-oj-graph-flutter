import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/searchFailed.dart';
import '../utils/responsiveLayout.dart';


class SearchPage extends StatefulWidget{
  // SearchPage({this.arguments});
  // final String arguments;
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
    // TODO: implement initState
    super.initState();
    // print(1);
    print(widget.arguments);
    // print(arguments['searchContent']);
  }
  // var _searchResult = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // constraints: BoxConstraints(
          //   minWidth: 300
          // ),
          child: Column(
            children: <Widget>[
              // Text("$arguments[]"),
              Container(
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  boxShadow: [
//                    BoxShadow(
//                        color: Colors.black38, offset: Offset(-30, -30), blurRadius: 8)
//                  ]
//                ),
                padding: EdgeInsets.only(bottom:28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!ResponsiveLayout.isSmallScreen(context))
                      NavBar(showSearch: true)
                    else
                      Column(
                        children: [
                          NavBar(showSearch: false),
                          SearchInput(
                            onClick: (){
                            },
                          )
                        ]
                      )
                  ]
                )
              ),
              Expanded(
                child: Container(
                  // height: double.infinity,
                  child: SearchFailed(),
                  width: double.infinity,
                  // height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0XFFF8FAFC),
                      // Colors.red,
                      Color(0xFFF8FBFF),
                    ]),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}

typedef GestureTapCallback = void Function();


//class SearchInput extends StatefulWidget {
//  @override
//  _SearchInputState createState() => _SearchInputState();
//}

class SearchInput extends StatelessWidget {
    // SearchInput({this.onClick});
    SearchInput({Key key, this.onClick}) : super(key: key);

  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(1, 1),
      children: <Widget>[
        Container(
          width: 500,
          padding: EdgeInsets.only(left:45,right:45),
          child:TextField(
            style: TextStyle(textBaseline: TextBaseline.alphabetic),
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
            // onTap: onClick,
            onTap: () {
              // print(this.arguments);
            },
          ),
        ),
      ],
    );
  }
}