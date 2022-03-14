import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sizer/sizer.dart';

import '../../esteban_test_icons.dart';
import '../../models/user_model.dart';
import 'ProfileListTile.dart';

class MainMenuProfileAppbar extends StatelessWidget {
  final ScrollController scrollController;

  const MainMenuProfileAppbar({Key? key, required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //StatusBar Background
        Container(
          color: Theme.of(context).primaryColor,
          height: 56,
        ),
        //Profile ----------------------------------------------
        Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: Theme.of(context).colorScheme.secondary,
            )),
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                ),
                child: const ProfileListTile(
                  colorContrast: true,
                )),
          ],
        ),
        //Latest Post ----------------------------------------
        InkWell(
          onTap: () {
            scrollController.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(16, 10.sp, 20.sp.sp, 10.sp),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest Post",
                  style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.button, color: Colors.white, letterSpacing: 0),
                ),
                const Icon(
                  EstebanTest.uptolatest,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
