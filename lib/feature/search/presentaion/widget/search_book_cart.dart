import 'package:flutter/material.dart';

import '../../../../core/entitles/main_entities.dart';
import '../../../play_screen/presentation/page/play_page.dart';

class SearchPageCard extends StatelessWidget {
  const SearchPageCard({
    super.key,
    required this.book,
  });
  final MainDataEntities book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if(size.width<=600)
    {
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScreenPlay(eBook: book,))),
            child: Container(
              margin: const EdgeInsets.all(8),
              width: size.width * 0.31,
              height: size.width * 0.43,
              decoration: BoxDecoration(
                color: Colors.black26,
                  borderRadius: BorderRadius.circular(5),
                  image:DecorationImage(
                      image: NetworkImage(book.bookImageUrl??""),
                      fit: BoxFit.cover)
                      ),
            ),
          ),
        ],
            ),
      );
    }else{
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenPlay(eBook: book,))),
            child: Container(
              margin: const EdgeInsets.all(8),
              width: 200,
              height: 290,
              decoration: BoxDecoration(
                color: Colors.black26,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(book.bookImageUrl??""),
                      fit: BoxFit.cover)
                      ),
            ),
          ),
        ],
            ),
      );
    }
  }
}

class SearchPageCardLoading extends StatelessWidget {
  const SearchPageCardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if(size.width<=600)
    {
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: size.width * 0.31,
            height: size.width * 0.43,
            decoration: BoxDecoration(
              color: Colors.black26,
                borderRadius: BorderRadius.circular(5),
                
                    ),
          ),
        ],
            ),
      );
    }else{
      return MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 200,
            height: 290,
            decoration: BoxDecoration(
              color: Colors.black26,
                borderRadius: BorderRadius.circular(5),
                    ),
          ),
        ],
            ),
      );
    }
  }
}