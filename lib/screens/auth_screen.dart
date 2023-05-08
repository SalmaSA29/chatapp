import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLoading = false;
  final _auth = FirebaseAuth.instance;

  void _submitAuthform(
      String email,
      String username,
      String password,
      File image,
      bool islogin,
      ) async{
    UserCredential authResult;
    try{
      setState(() {
        _isLoading= true;
      });
      if(islogin){
        authResult =await _auth.signInWithEmailAndPassword(email: email,
            password: password);
      }else{
        authResult =await _auth.createUserWithEmailAndPassword(email: email,
            password: password);
        UploadTask uploadTask =
        FirebaseStorage.instance.ref().child('user_images/${authResult.user!.uid}.jpg')
            .putFile(image);

        var imageUrl = await (await uploadTask).ref.getDownloadURL();

        print(" url ---------- "+imageUrl);

       await FirebaseFirestore.instance.collection('users')
            .doc(authResult.user!.uid)
           .set({
          'username':username,
          'email':email,
          'image_url':imageUrl,
        });
      }
    } on PlatformException catch(error){
      setState(() {
        _isLoading= false;
      });
      var message = 'an error occured please check credentials!';
      if(error.message !=null){
        message=error.message!;
        print(message);
      }
    } catch(error){
      setState(() {
        _isLoading= false;
      });
      print(error.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitAuthform,_isLoading),
    );
  }
}
