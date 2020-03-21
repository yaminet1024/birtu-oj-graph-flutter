import 'package:flutter/material.dart';
// import '../utils/responsiveLayout.dart';

class SearchFailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
             "assets/no_result.png",
              scale: 1,
          ),
          SizedBox(
            height: 20
          ),
          Text(
            "暂时木有内容呀~ ~",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          )
        ],
      )
    );
  }
}