import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AddPostModal extends StatefulWidget {
  // You can also pass the translation in here if you want to
  const AddPostModal({Key? key}) : super(key: key);

  @override
  _LiveModalWidget createState() => _LiveModalWidget();
}

class _LiveModalWidget extends State<AddPostModal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          //Expand to exit
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
            ),
          ),
          Center(
            child: Container(
              height: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Material(
                        child: TextField(
                          maxLines: 5,
                          controller: controller,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () async {
                          if ((controller.text.isNotEmpty)) {
                            Navigator.pop(context, controller.text);
                          }
                        },
                        child: Text(
                          "create post",
                          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.button, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Expand to exit
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
