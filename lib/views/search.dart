import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../utils/responsiveLayout.dart';


class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }

}

class SearchPageState extends State<SearchPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minWidth: 300
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, offset: Offset(-30, -30), blurRadius: 8)
                ]
              ),
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
                            print("喻彩平大宝贝，我爱你呀");
                          },
                        )
                      ]
                    )
                ]
              )
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0XFFF8FAFC),
                    Color(0xFFF8FBFF),
                  ]),      
                ), 
              ),
              ),
          ]
        )
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
  const SearchInput({this.onClick});

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
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        Positioned(
          child: InkWell(
            child: Icon(
              Icons.search,
              color: Colors.black54,
            ),
            onTap: onClick,
          ),
          right: 60,
          top: 12,
        ),
      ],
    );
  }
}