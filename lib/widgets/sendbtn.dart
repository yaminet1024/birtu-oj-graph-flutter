import 'package:flutter/material.dart';
import '../utils/responsiveLayout.dart';

class SendBtn extends StatelessWidget {
  SendBtn({Key key, this.searchText}) : super(key: key);
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints: BoxConstraints(
          minWidth: 50
        ),
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFC86DD7),
              Color(0xFF3023AE),
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // print(searchText);
              Navigator.pushNamed(context, '/search',  arguments: {"searchContent": searchText} );
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("搜索",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat-Bold",
                          fontSize: ResponsiveLayout.isSmallScreen(context)
                              ? 12
                              : ResponsiveLayout.isMediumScreen(context)
                                  ? 12
                                  : 16,
                          letterSpacing: 1.0)),
                  SizedBox(
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? 4
                        : ResponsiveLayout.isMediumScreen(context) ? 6 : 8,
                  ),
                  Image.asset(
                    "assets/sent.png",
                    color: Colors.white,
                    width: ResponsiveLayout.isSmallScreen(context)
                        ? 12
                        : ResponsiveLayout.isMediumScreen(context) ? 12 : 20,
                    height: ResponsiveLayout.isSmallScreen(context)
                        ? 12
                        : ResponsiveLayout.isMediumScreen(context) ? 12 : 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
