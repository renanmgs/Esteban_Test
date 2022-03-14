import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/blocs/user_info_bloc.dart';

import '../../esteban_test_icons.dart';

class ProfileListTile extends StatelessWidget {
  final bool colorContrast;

  const ProfileListTile({Key? key, required this.colorContrast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        style: TextStyle(
          color: colorContrast ? Colors.white : null,
        ),
      ),
      subtitle: Text(
        "@${userBloc.user.userTag}",
        style: TextStyle(
          color: colorContrast ? Colors.white : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                //The icon in the Figma broke on the export of fluttericons
                Icons.search_rounded,
                size: 30,
                color: colorContrast ? Colors.white : null,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              EstebanTest.menu,
              size: 20,
              color: colorContrast ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
