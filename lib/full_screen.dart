import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FullScreen extends StatelessWidget {
  FullScreen({super.key, required this.image});
  final image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image
                          // "https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\u0026q=80\u0026fm=jpg\u0026crop=faces\u0026fit=crop\u0026h=32\u0026w=32\u0026s=63f1d805cffccb834cf839c719d91702"
                          // "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          ))),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                    color: Colors.red,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close))),
          ],
        ),
      ),
    );
  }
}
