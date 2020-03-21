import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Container(
          //       width: 60,
          //       height: 60,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(18),
          //         gradient: LinearGradient(
          //           colors: [Color(0xFFC86DD7),Color(0xFF3023AE)],
          //           begin: Alignment.bottomRight,
          //           end: Alignment.topLeft,
          //           )),
          //       child: Text(
          //         "B",
          //         style: TextStyle(fontSize: 30, color: Colors.white),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 16
          //     ),
          //     Text(
          //       "Britu",
          //       style: TextStyle(fontSize: 26)
          //     )
          //   ],
          // ),
          Text("他娘的"),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(18),
                //   gradient: LinearGradient(
                //     colors: [
                //       Color(0xFFC86DD7),
                //       Color(0xFF3023AE),
                //     ],
                //     begin: Alignment.bottomRight,
                //     end: Alignment.topLeft
                //   ),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}