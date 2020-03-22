import 'package:educational_robot/views/chat_box.dart';
import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';
import '../views/search.dart';


typedef NavBarItemClick = void Function(String s);

class NavBar extends StatelessWidget {
  final navLinks = ["首页", "友情链接"];

  NavBar({Key key, this.showSearch,this.onNavBarItemClick}) : super(key: key);
  final bool showSearch;

  final NavBarItemClick onNavBarItemClick;

  List<Widget> navItem() {
    return navLinks.map((text) {
      return InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold")),
        ),
        onTap: (){
          onNavBarItemClick(text);
        }
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 28),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(colors: [
                          Color(0xFFC86DD7),
                          Color(0xFF3023AE),
                        ], begin: Alignment.bottomRight, end: Alignment.topLeft)),
                    child: Center(
                      child: Text("B",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Britu", style: TextStyle(fontSize: 26)),
                  if (showSearch)
                    SearchInput()
                ],
              ),
              if (!ResponsiveLayout.isSmallScreen(context))
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[...navItem()]
                )
              else
                Image.asset("assets/menu.png", width: 26, height: 26)
            ],
          ),
        ],
      )
    );
  }
}