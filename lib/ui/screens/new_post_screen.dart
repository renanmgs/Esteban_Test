import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/blocs/user_info_bloc.dart';
import '../widgets/posts_feed.dart';
import '../widgets/main_menu_profile_appbar.dart';
import '../widgets/ProfileListTile.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreen();
}

class _NewPostScreen extends State<NewPostScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileListTile(
              colorContrast: false,
            ),
            Container(
              margin: EdgeInsets.all(10.sp),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'New Post',
                  style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.headline6),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined, color: Colors.grey))
              ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.sp, right: 10.sp),
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  width: 40.sp,
                  height: 40.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(userBloc.user.profileImageUrl),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  userBloc.user.userName,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 2.sp),
              color: Colors.white,
              child: TextField(
                maxLength: 2500,
                maxLines: 5,
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your text here...',
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.all(10.sp),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFCF20FB),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                ),
                onPressed: () async {
                  if ((controller.text.isNotEmpty)) {
                    Navigator.pop(context, controller.text);
                  }
                },
                child: Text(
                  "publish",
                  style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.button, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.home_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 7,
          child: SizedBox(
            height: 6.h,
          )),
    );
  }
}
