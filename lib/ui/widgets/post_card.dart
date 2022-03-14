import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:octo_image/octo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:upworkestebantest/ui/widgets/modal_add_post.dart';

import '../../blocs/feed_bloc.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {Key? key,
      required this.userId,
      required this.userName,
      required this.timestamp,
      required this.profileImageUrl,
      required this.textContent,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.postIndex})
      : super(key: key);

  final userId;
  final userName;
  final timestamp;
  final profileImageUrl;
  final textContent;
  final likes;
  final comments;
  final shares;
  final postIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.sp),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  width: 35.sp,
                  height: 35.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(profileImageUrl),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  userName,
                ),
                subtitle: Text(
                  timestamp,
                  style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodySmall),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: () {},
                          icon: const Icon(
                            //The icon in the Figma broke on the export of fluttericons
                            Icons.edit_note_rounded,
                            color: Color(0xFFD8D8D8),
                            size: 20,
                          )),
                    ),
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () async {
                          var ret = await showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black12.withOpacity(0.6), // Background color
                            barrierDismissible: false,
                            barrierLabel: 'Dialog',
                            transitionDuration: Duration(milliseconds: 200), // How long it takes to popup dialog after button click
                            pageBuilder: (_, __, ___) {
                              // Makes widget fullscreen
                              return const DeletePostModal();
                            },
                          );

                          if (ret == true) {
                            feedbloc.deletePost(postIndex);
                          }
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Color(0xFFD8D8D8),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15.sp, 10.sp, 15.sp, 10.sp),
                child: Text(
                  textContent,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodySmall, color: Colors.black),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5.sp),
                        height: 30.0,
                        width: 30.0,
                        child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {},
                            icon: const Icon(
                              //The icon in the Figma broke on the export of fluttericons
                              Icons.favorite,
                              color: Color(0xFFD8D8D8),
                              size: 15,
                            )),
                      ),
                      Text(
                        likes.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFADADAD),
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment,
                          color: Color(0xFFD8D8D8),
                          size: 15,
                        ),
                      ),
                    ),
                    Text(
                      comments.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFADADAD),
                      ),
                    )
                  ]),
                  Row(children: [
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Color(0xFFD8D8D8),
                          size: 15,
                        ),
                      ),
                    ),
                    Text(
                      shares.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFADADAD),
                      ),
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
