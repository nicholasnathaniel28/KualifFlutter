import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_training/models/item.dart';
import 'package:flutter_training/views/pages/tabs.dart';

class ListPageCsgo extends StatefulWidget{
  @override
  _ListPageCsgoState createState() => _ListPageCsgoState();
}

class _ListPageCsgoState extends State<ListPageCsgo> {
  var _ctx;

  var _data= [
    Item('kara-sapphire.png', 'Karambit Sapphire', 1, 'FN Karambit Knife Doppler Sapphire\, float 0.032', 20000000),
    Item('butterfly-ruby.png', 'Butterfly Ruby', 2, 'FN Butterfly Knife Doppler Ruby\, float 0.045', 22000000),
    Item('m9-emerald.png', 'M9 Emerald', 3, 'FN M9 Bayonet Doppler Emerald\, float 0.056', 19000000),
    Item('kara-lore.png', 'Karambit Lore', 4, 'FT Karambit Lore\, float 0.15', 9000000)
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
        title: Text('CS:GO Items'),
      ),
      body: ListView(
        children:
        _data.map<Widget>((e) => _buildWidget(e)).toList()
      ),
    );
  }
}