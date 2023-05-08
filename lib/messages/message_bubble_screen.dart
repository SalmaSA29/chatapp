import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message,this.username,this.userImage,this.isMe,{required this.key});
  final Key key ;
  final String message;
  final String username;
  final String userImage;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
            mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color:isMe? Colors.deepOrange: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 140,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children:<Widget> [
                    Text(username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentTextTheme.titleMedium!.color,
                      ),),
                    Text(message,
                      style: TextStyle(
                        color: Theme.of(context).accentTextTheme.titleMedium!.color,
                      ),),
                  ],

                ),

              ),
            ]
        ),
       Positioned(
         top: -0,
         left: isMe? null:120,
         right: isMe? 120 :null,
         child: CircleAvatar(
         backgroundImage: NetworkImage(userImage),
       ),),
      ],
        clipBehavior: Clip.none,
    );
  }
}
