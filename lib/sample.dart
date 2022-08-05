import 'package:ehynsta/ui/view/post_edit_view.dart';
import 'package:ehynsta/ui/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Sample extends StatelessWidget {
  PostViewModel viewModel;
  Sample({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("sample ui build");

    viewModel.postSubject.listen((post) {
      var route = MaterialPageRoute(
          builder: (context) => PostEditView(imagePath: post.filePath!)
      );
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });
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
            ElevatedButton(onPressed: () {
              viewModel.getPost();
            }, child: Text("get post")),
          ],
        ))
    );
  }
}
