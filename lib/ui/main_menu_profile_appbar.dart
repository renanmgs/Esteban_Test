import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sizer/sizer.dart';

import '../esteban_test_icons.dart';

class MainMenuProfileAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Latest Post ----------------------------------------
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 15.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Latest Post",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  EstebanTest.uptolatest,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        //Profile ----------------------------------------------
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          ),
          child: ListTile(
            leading: Container(
              width: 40.sp,
              height: 40.sp,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: OctoImage(
                image: const CachedNetworkImageProvider('https://i.imgur.com/6U53rf7.png'),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                ),
                errorBuilder: OctoError.icon(color: Colors.red),
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Jane Doe",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              "@janedoe_29",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      //The icon in the Figma broke on the export of fluttericons
                      Icons.search_rounded,
                      size: 30,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    EstebanTest.menu,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
