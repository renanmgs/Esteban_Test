import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/blocs/feed_bloc.dart';
import 'package:upworkestebantest/models/post_model.dart';
import 'package:upworkestebantest/ui/main_menu_profile_appbar.dart';
import 'package:upworkestebantest/ui/modal_add_post.dart';
import 'package:upworkestebantest/ui/posts_feed.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    bloc.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [MainMenuProfileAppbar(), PostsFeed()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ret = await showGeneralDialog(
            context: context,
            barrierColor: Colors.black12.withOpacity(0.6), // Background color
            barrierDismissible: false,
            barrierLabel: 'Dialog',
            transitionDuration: const Duration(milliseconds: 200), // How long it takes to popup dialog after button click
            pageBuilder: (_, __, ___) {
              // Makes widget fullscreen
              return const AddPostModal();
            },
          );
          if (ret != null) {
            PostModel newpost = PostModel({
              'userName': 'Jane Doe',
              'timestamp': 'Just Now',
              'profileImageUrl': 'https://i.imgur.com/6U53rf7.png',
              'textContent': ret.toString(),
              'likes': 0,
              'comments': 0,
              'shares': 0,
            });

            bloc.addPost(newpost);
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: SizedBox(
              height: 6.h,
            ))
          ],
        ),
      ),
    );
  }
}
