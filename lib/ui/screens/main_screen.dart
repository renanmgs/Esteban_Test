import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/blocs/feed_bloc.dart';
import 'package:upworkestebantest/blocs/user_info_bloc.dart';
import 'package:upworkestebantest/models/post_model.dart';
import 'package:upworkestebantest/models/user_model.dart';
import 'package:upworkestebantest/ui/screens/new_post_screen.dart';
import '../widgets/posts_feed.dart';
import '../widgets/main_menu_profile_appbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    startRoutine();
    super.initState();
  }

  void startRoutine() async {
    //Initializing
    await userBloc.logIn();
    await feedbloc.fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userBloc.userInfo,
      builder: (context, AsyncSnapshot<UserModel> userSnap) {
        if (userSnap.hasData) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Column(
              children: [
                MainMenuProfileAppbar(scrollController: scrollController),
                PostsFeed(scrollController: scrollController),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var ret = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewPostScreen()),
                );

                if (ret != null) {
                  //Creating a post, can late be done inside the Bloc only passing the content
                  PostModel newpost = PostModel(
                    userSnap.data!.userId,
                    userSnap.data!.userName,
                    'Just Now',
                    userSnap.data!.profileImageUrl,
                    ret.toString(),
                    0,
                    0,
                    0,
                  );
                  feedbloc.addPost(newpost);
                  scrollController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                }
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 7,
              child: SizedBox(
                height: 6.h,
              ),
            ),
          );
        } else if (userSnap.hasError) {
          return Text(userSnap.error.toString());
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text("Loggin In"),
              ],
            ),
          ),
        );
      },
    );
  }
}
