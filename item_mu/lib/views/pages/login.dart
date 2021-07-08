import 'package:flutter/material.dart';
import 'package:flutter_training/models/utils/config.dart';
import 'package:flutter_training/views/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();
  var _errorTextEmail = '';
  var _errorTextPassword = '';

  bool validate(){
    var flag = 0;
    if(_ctrlUsername.text.length <= 0){
      setState(() {
        _errorTextEmail = 'Email must be filled!';
      });
      flag = 1;
    }else if(!_ctrlUsername.text.contains('@')){
      setState(() {
        _errorTextEmail = 'Email must contain @!';
      });
      flag = 1;
    }else{
      setState(() {
        _errorTextEmail = '';
      });
    }
    if(_ctrlPass.text.length <= 0){
      setState(() {
        _errorTextPassword = 'Password must be filled!';
      });
      flag = 1;
    }else if(_ctrlPass.text.length < 5){
      setState(() {
        _errorTextPassword = 'Password must be atleast 5 characters long!';
      });
      flag = 1;
    }else{
      setState(() {
        _errorTextPassword = '';
      });
      flag = 0;
    }
    if(flag == 0){
      return true;
    }else return false;
  }
  void _onPressed(BuildContext ctx){
    if(validate()){
      loggedInUsername = _ctrlUsername.text.substring(0, _ctrlUsername.text.indexOf('@'));
      print(loggedInUsername + ' Logged In');
      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (builder){
        return HomePage();
      }));
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ItemMu'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image(image: AssetImage('assets/logo.jpg'), width: 80, height: 80),
          TextField(
            decoration: InputDecoration(hintText: 'Username', errorText: _errorTextEmail),
            controller: _ctrlUsername,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password', errorText: _errorTextPassword),
            controller: _ctrlPass,
          ),
          ElevatedButton(onPressed: ()=>_onPressed(context), child: Text('Log In'))
        ]
      )
    );
  }
}