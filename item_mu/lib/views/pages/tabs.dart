import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/models/item.dart';
import 'package:flutter_training/models/review.dart';
import 'package:flutter_training/models/utils/config.dart';

class TabPage extends StatefulWidget{
  Item i;

  TabPage(this.i);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>{

  var _tempList = [];
  var _ctrlReview = TextEditingController();
  

  Widget _buildWidget(Review r){
    return 
    Container(
      height: null,
      child:
      Card(
        child:Padding(
          padding: EdgeInsets.all(10),
          child:Column(
            children: [
              Row(children: [Text(r.reviewer, overflow: TextOverflow.clip)]),
              Divider(height:10, thickness: 2, color: Colors.blue),
              Container(
                child:Row(
                  children: [
                    Flexible(child: Text(r.review))
                  ]
                )
              )
            ],
          ),
        )
      )
    );
    
  }

  @override
  Widget build(BuildContext context) {
    _tempList.clear();
    for(var i = 0; i<reviewList.length; i++){
      if(reviewList[i].itemId == widget.i.id){
        _tempList.add(reviewList[i]);
      }
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.i.name),
          bottom:TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag), text: "Item Details"),
              Tab(icon: Icon(Icons.comment), text: "Reviews"),
            ],
          )
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Image(image: AssetImage('assets/' + widget.i.img)),
                ListTile(
                  leading:Text('Item Name: '),
                  trailing:Text(widget.i.name)
                ),
                ListTile(
                  leading: Text(widget.i.description, overflow: TextOverflow.visible)
                ),
                ListTile(
                  leading:Text('Item Price: '),
                  trailing:Text('IDR ' + widget.i.price.toString())
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: ' Input you review here',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 50,
                  controller: _ctrlReview,
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: (){
                  if(_ctrlReview.text.length <= 0){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Review must be filled!'),));
                  }else{
                    Review temp = Review(loggedInUsername, _ctrlReview.text, widget.i.id);
                    reviewList.add(temp);
                    print(loggedInUsername);
                    final reviewMap = reviewList.asMap();
                    for(var i=0; i<reviewMap.length; i++){
                      print(reviewMap[i].reviewer + ' ' + reviewMap[i].review + ' ' + reviewMap[i].itemId.toString());
                    }
                    setState(() {
                      _ctrlReview.text = '';
                    });
                  }
                }, child: Text('Submit Review'))
              ]
            ),
            ListView(
              children:
              _tempList.map<Widget>((e) => _buildWidget(e)).toList()
            ),
          ],
        ),
      )
    );
  }
}