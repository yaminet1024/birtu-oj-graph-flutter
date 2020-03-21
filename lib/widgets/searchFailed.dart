import 'package:flutter/material.dart';
// import '../utils/responsiveLayout.dart';

class SearchFailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
             "assets/no_result.png",
              // width: ResponsiveLayout.isSmallScreen(context)
              //     ? 12
              //     : ResponsiveLayout.isMediumScreen(context) ? 12 : 20,
              // height: ResponsiveLayout.isSmallScreen(context)
              //     ? 12
              //     : ResponsiveLayout.isMediumScreen(context) ? 12 : 20,
              width: 50,
              height: 50,
          ),
          Text("暂时木有内容呀~ ~")
        ],
      )
    );
  }
}