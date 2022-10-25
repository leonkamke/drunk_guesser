import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({
    required this.radius,
    required this.mdFileName,
  }) : assert(mdFileName.contains('.md'),
            'The file must contain the .md extension');

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 150))
                  .then((value) {
                    print("aaaaaaaa");
                return rootBundle.loadString(mdFileName);
              }),
              builder: (context, snapshot) {
                print("bbb");
                if (snapshot.hasData) {
                  print("sldkfjlfds");
                  return Markdown(
                    data: snapshot.data as String,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0),
            color: Theme.of(context).buttonColor,
            onPressed: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: const Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
