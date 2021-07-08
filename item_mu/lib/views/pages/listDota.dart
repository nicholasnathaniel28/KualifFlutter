import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/item.dart';
import 'package:flutter_training/views/pages/listdetail.dart';
import 'package:flutter_training/views/pages/tabs.dart';

class ListPageDota extends StatefulWidget{
  @override
  _ListPageDotaState createState() => _ListPageDotaState();
}

class _ListPageDotaState extends State<ListPageDota> {
  var _ctx;

  var _data= [
    Item('mace-of-aeons.png', 'Mace of Aeons', 5, 'Immortal Faceless Void ultra are', 3000000),
    Item('fantoccini-set.jpg', 'Fantoccini Set', 6, 'Set Puppet Fantoccini buat Rubick', 1200000),
    Item('magus-cypher.png', 'Magus Cypher Full Unlock', 7, 'Arcana Rubick 40 wins full unlock all spells', 450000),
    Item('manifold-paradox.jpg', 'Manifold Paradox Style 3', 8, 'Arcana Phantom Assassin style 3 unlocked', 450000)
  ];

  void _onPressed(Item i){
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder){
      return TabPage(i);
    }));
  }

  Widget _buildWidget(Item i){
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 44,
            minWidth: 44,
            maxHeight: 64,
            maxWidth: 64,
          ),
          child: Image.asset(
            'assets/${i.img}',
            fit: BoxFit.contain,
          )
        ),
        title: Text(i.name),
        trailing: Text('IDR ' + i.price.toString()),
        onTap: ()=>_onPressed(i),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('DOTA2 Items'),
      ),
      body: ListView(
        children:
        _data.map<Widget>((e) => _buildWidget(e)).toList()
      ),
    );
  }
}