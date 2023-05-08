import 'dart:io';
import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';
import '../pickers/image_picker.dart';
class AuthForm extends StatefulWidget {
  AuthForm(this.submitfn,this.isloading);
  bool isloading;
  void Function(
      String email,
      String username,
      String password,
      File image,
      bool islogin,
      ) submitfn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  String _userEmail='';
  String _username='';
  String _userpassword='';
  bool islogin = true;
  late File _userimageFile = File('');

  void _pickedImage(File image){
    if(image !=null){
      _userimageFile=image;
    }
  }
  void _trysubmit(){
    final isValid= _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();//close the keyboard on submit the value

    if(_pickedImage == null && !islogin){
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("please pick an image"),
      ));
    }
    if(isValid!){
      _formkey.currentState!.save();
      //to remove any white spaces before or after use trim()
      widget.submitfn(
          _userEmail.trim(),
          _username.trim(),
          _userpassword.trim(),
          _userimageFile,
          islogin);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                if(!islogin)
                UserImagePicker(_pickedImage),
                TextFormField(
                  key: ValueKey('Enter email'),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter email',
                  ),
                  validator: (value) {
                    if(value!.isEmpty || !value.contains('@hassanallam.com')){
                      return 'please enter a valid email address';}
                  else {return null;}},
                  onSaved: (newValue) {
                    _userEmail=newValue!;
                  },
                ),
                if(!islogin)
                TextFormField(
                  key: ValueKey('Username'),
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if(value!.isEmpty || value.length<4){
                      return 'please enter a valid username';
                  }
                  else{
                    return null;
                }
                  },
                  onSaved: (newValue) {
                    _username=newValue!;
                  },
                ),
                TextFormField(
                  key: ValueKey('Password'),
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if(value!.isEmpty || value.length<7){
                      return 'password is too short';
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    _userpassword=newValue!;
                  },
                ),
                SizedBox(height: 12.0),
                if(widget.isloading)
                  CircularProgressIndicator(),
                if(!widget.isloading)
                MaterialButton(onPressed:_trysubmit,
                child: Text(islogin? 'LOGIN' : 'SIGNUP'),
                textColor: Theme.of(context).colorScheme.background,),
                if(!widget.isloading)
                MaterialButton(onPressed:() {
                  setState(() {
                    islogin=!islogin;
                  });
                },
                child: Text(islogin?'CREATE AN ACCOUNT':'I ALREADY HAVE AN ACCOUNT'),
                textColor: Theme.of(context).backgroundColor,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
