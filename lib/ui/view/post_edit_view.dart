import 'package:ehynsta/ui/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class PostEditView extends StatelessWidget {
  String imagePath;
  PostEditView({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("PostEditView ui build");
    return Scaffold(
        body: Center(
        child: Column(
          children: [
            Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
             color: Colors.red,
            ),
              child: const Text('Main'),),
            Image(image: AssetImage(imagePath)),
          ],
        ))
    );
  }
}
