// ignore_for_file: prefer_const_constructors

import 'package:chat_buddy/helpers/constants.dart';
import 'package:chat_buddy/models/user_model.dart';
import 'package:chat_buddy/screens/bottom_navigation.dart';
import 'package:chat_buddy/screens/users_screen/followers_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetFollowers extends StatelessWidget {
  const GetFollowers({Key? key, this.isRequire = false}) : super(key: key);

  final bool isRequire;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    print('GetFollowers');

    CollectionReference followerCollection =
        FirebaseFirestore.instance.collection('follower');
    return Scaffold(
      backgroundColor: kBlueShadeColor,
      body: FutureBuilder<DocumentSnapshot>(
        future: followerCollection.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong, Please try again',
                  style: kSettingComponentAppBarTextStyle),
            );
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            print(UserModel.followers);
            print('doneeee');

            return isRequire ? FollowersScreen() : BottomNavigation();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            print('done');
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            print('follower list');
            print(data['follower']);
            print(UserModel.followers);

            UserModel.followers = data['follower'];

            return isRequire ? FollowersScreen() : BottomNavigation();
          }
          return Center(
            child: CircularProgressIndicator(color: kGreenShadeColor),
          );
        },
      ),
    );
  }
}
