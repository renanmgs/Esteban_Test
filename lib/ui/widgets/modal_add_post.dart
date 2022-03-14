import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DeletePostModal extends StatefulWidget {
  // You can also pass the translation in here if you want to
  const DeletePostModal({Key? key}) : super(key: key);

  @override
  _DeletePostModal createState() => _DeletePostModal();
}

class _DeletePostModal extends State<DeletePostModal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.grey,
                          size: 40,
                        ),
                        Text(
                          "Delete Post?",
                          style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.button, letterSpacing: 0),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary,
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    ),
                    child: const SizedBox(
                      width: 100,
                      child: Center(child: Text("YES")),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFCF20FB),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const SizedBox(
                      width: 100,
                      child: Center(child: Text("NO")),
                    ),
                  ),
                ],
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
