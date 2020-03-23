// import 'package:educational_robot/views/chat_box.dart';
import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';
import '../views/search.dart';

typedef NavBarItemClick = void Function(String s);

class NavBar extends StatelessWidget {
  final navLinks = ["首页", "问答系统"];

  NavBar({Key key, this.showSearch, this.onNavBarItemClick, this.initKey}) : super(key: key);
  final bool showSearch;
  final initKey;
  final NavBarItemClick onNavBarItemClick;

  List<Widget> navItem() {
    return navLinks.map((text) {
      return InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold")),
          ),
          onTap: () {
            onNavBarItemClick(text);
          });
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFC86DD7),
                                Color(0xFF3023AE),
                              ],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft)),
                      child: Center(
                        child: Text("B",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text("Britu", style: TextStyle(fontSize: 26)),
                    if (showSearch) 
                      SearchInput(
                        onClick: (){
                          print('何冲呀');
                        },
                        initKey: initKey
                      )
                  ],
                ),
                if (!ResponsiveLayout.isSmallScreen(context))
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[...navItem()])
                else
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 18),
                        child: InkWell(
                          child: Image.asset("assets/fairy.png",
                              width: 26, height: 26),
                          highlightColor: Colors.blueAccent,
                          onTap: (){
                            onNavBarItemClick("");
                          },
                        ),
                      ),
                      Image.asset("assets/menu.png", width: 26, height: 26)
                    ],
                  )
              ],
            ),
          ],
        ));
  }
}
