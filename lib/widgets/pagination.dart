
import 'package:educational_robot/utils/responsiveLayout.dart';
import 'package:flutter/material.dart';

typedef PageItemClick = void Function(String searchKey, int cur);

List makePage(total,cur,around) {
  var result = [];  
  var baseCount = around * 2 + 1 + 2 + 2 + 2; //总共元素个数
  var surplus = baseCount - 4; //只出现一个省略号 剩余元素个数
  var startPosition = 1 + 2 + around + 1;//前面出现省略号的临界点
  var endPosition = total - 2 - around - 1;//后面出现省略号的临界点
    if(total <= baseCount-2) {
      result =  List.generate(total, (value) => value + 1);
    }else{ //需要出现省略号
        if(cur < startPosition){ //1.只有后面出现省略号
            result = [...List.generate(surplus, (value) => value + 1),"...",total];
        }else if(cur > endPosition) { //2.只有前边出现省略号
            result = [1,'...',...List.generate(surplus, (value) => total - surplus + value + 1)];
        }else{ //3.两边都有省略号
            result = [1,'...',...List.generate(around * 2 + 1, (value) => cur - around + value),'...',total];
        }
    }
    return result;
}

class Pagination extends StatefulWidget {

  Pagination({this.searchKey, this.onPageItemClick, this.totalPages});

  final String searchKey;
  final int totalPages;
  final PageItemClick onPageItemClick; 

  @override
  State<StatefulWidget> createState() {
    return _PaginationState();
  }
}

class _PaginationState extends State<Pagination>{
  List pageList = [];
  int cur = 1;

  void initState () {
    super.initState();
    pageList  = makePage(widget.totalPages, cur, 2);
  }


  List<Widget> pageItem() {
    return pageList.map((text) {
      return Container(
        margin: EdgeInsets.only(left: 6, right: 6),
        child: GestureDetector(
          onTap: (){
            if (cur.toString() != text.toString() && text.toString() != '...') {
              setState(() {
                cur = text;
                pageList  = makePage(widget.totalPages, cur, 2);
              });
              widget.onPageItemClick(widget.searchKey, cur);
            }
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: cur.toString() == text.toString() ? Border.all(color: Color(0xFF50a1ff), width: 1) : Border.all(color: Color(0xFF78828c).withOpacity(0.1), width: 1),
            ),
            child: Center(
              child: cur.toString() == text.toString() ? Text(text.toString(), style: TextStyle(color: Color(0xFF50a1ff), fontFamily: "Montserrat-Bold", fontSize: 16),) :Text(text.toString(), style: TextStyle(fontFamily: "Montserrat-Bold", fontSize: 16),),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
          InkWell(
            child: Text('上一页'),
            onTap: () {
              setState(() {
                if(cur != 1) {
                  cur = cur -1;
                }
              });
              widget.onPageItemClick(widget.searchKey, cur);
            }
          ),
          !ResponsiveLayout.isSmallScreen(context) ?
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[...pageItem()],
            )
            :
            Text('$cur / ' + widget.totalPages.toString()),
          InkWell(
            child: Text('下一页'),
            onTap: () {
              setState(() {
                if(cur != widget.totalPages) {
                  cur = cur + 1;
                }
              });
              widget.onPageItemClick(widget.searchKey, cur);
            }
          ),
        ]
      )
    ); 
  }
}