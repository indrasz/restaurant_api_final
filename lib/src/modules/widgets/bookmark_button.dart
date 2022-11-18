import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({Key? key}) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
      child: SafeArea(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isBookmark
                    ? 'assets/images/bookmark_active.png'
                    : 'assets/images/bookmark.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}