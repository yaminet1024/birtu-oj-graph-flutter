// import 'package:educational_robot/service/grpc_service.dart';
import 'package:flutter/material.dart';
// import 'widgets/navbar.dart';
// import 'utils/responsiveLayout.dart';
// import 'widgets/search.dart';
// import './views/search.dart';
import 'routes/routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '中小学信息奥数教育机器人',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '中小学信息奥数教育机器人',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//       routes: {
//         '/home': (BuildContext context) => MyHomePage(),
//         '/search': (BuildContext context) => SearchPage(),
//       },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return MyHomePageState();
//   }

// }

// class MyHomePageState extends State<MyHomePage> {


//   @override
//   void initState() {
//     super.initState();
//     GrpcService().sayHelloToGrpc();
//     GrpcService().getProblem();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [
//           Color(0xFFF8FBFF),
//           Color(0xFFFCFDFD),
//         ]),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               NavBar(showSearch: false,),
//               Body()
//             ]
//           )
//         )
//       ),
//     );
//   }
// }

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveLayout(
//       largeScreen: LargeChild(),
//       smallScreen: SmallChild(),
//     );
//   }
// }

// class LargeChild extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           FractionallySizedBox(
//             alignment: Alignment.centerRight,
//             widthFactor: .6,
//             child: Image.asset("assets/image_01.png", scale: .85),
//           ),
//           FractionallySizedBox(
//             alignment: Alignment.centerLeft,
//             widthFactor: .6,
//             child: Padding(
//               padding: EdgeInsets.only(left: 48),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Hello!",
//                       style: TextStyle(
//                           fontSize: 60,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "Montserrat-Regular",
//                           color: Color(0xFF8591B0))),
//                   RichText(
//                     text: TextSpan(
//                         text: "WellCome To ",
//                         style:
//                             TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
//                         children: [
//                           TextSpan(
//                               text: "Britu",
//                               style: TextStyle(
//                                   fontSize: 60,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87))
//                         ]),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 12.0, top: 20),
//                       child: Text("开始我们的学习吧！"),
//                      ),
//                     ),
//                   Search()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SmallChild extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "Hello!",
//               style: TextStyle(
//                   fontSize: 40,
//                   color: Color(0xFF8591B0),
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "Montserrat-Regular"),
//             ),
//             RichText(
//               text: TextSpan(
//                 text: 'WellCome To ',
//                 style: TextStyle(fontSize: 40, color: Color(0xFF8591B0)),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: 'Britu',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 40,
//                           color: Colors.black87)),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 12.0, top: 20),
//               child: Text("开始我们的学习吧！"),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: Image.asset(
//                 "assets/image_01.png",
//                 scale: 1,
//               ),
//             ),
//             SizedBox(
//               height: 32,
//             ),
//             Search(),
//             SizedBox(
//               height: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
