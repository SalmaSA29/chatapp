import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble_screen.dart';
class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //------- instance mn el firestore w 3amalna collection esmo chat bnratebo
      // b order by de bta5od el key w bnratebhom descending l2eno by default bytrateb
      // ascending order
        stream: FirebaseFirestore.instance.collection('chat')
            .orderBy('createdAt',descending: true).snapshots(),
        builder:(context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data!.docs;
          return FutureBuilder(
            future: Future.value(FirebaseAuth.instance.currentUser),
            builder:(context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );}
              return ListView.builder(
                reverse: true, //3alashan tarteeb el messages yb2aa mn ta7t lfo2
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return MessageBubble(data[index]['text'],
                    data[index]['username'],
                    data[index]['userImage'],
                    data[index]['usedID'] == snapshot.data!.uid,
                      key: ValueKey(data[index].id),);
                  // ana msh fahma lesa how ba3at hena key leh

                },
              );
            }
            );
        },
        );
  }
}
