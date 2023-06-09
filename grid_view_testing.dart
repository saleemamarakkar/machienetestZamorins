import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebin/bloc/grid_bloc.dart';
import 'package:pastebin/debounce/debounce.dart';
import 'package:pastebin/imageCard.dart';

class GridviewTest extends StatelessWidget {
  GridviewTest({super.key});
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GridBloc>(context).add(GridEvent.initialized());
    });
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            child: ElevatedButton(onPressed: () {}, child: Text("load image")),
          ),
          Expanded(
            child: Container(child: ImageGrid()),
          ),
        ]),
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GridBloc, GridState>(
      builder: (context, state) {
        return GridView.count(
          crossAxisCount: 2,
          children: List.generate(state.SearchResultKey.length, (index) {
            print("\n   \n \ninside grid generator$state");
            final user = state.SearchResultKey[index];
            print("user instance ----$user");

            // final profileimage = user.name;

            //print("profile image=======$profileimage");
            //  print(state.SearchResultKey[index].profileImage!.small!);
            return ImageCard(imageUrl: ""
                //  state.SearchResultKey[index].profileImage!.small! ??
                //     "No small image",
                );
          }),
        );
      },
    );
  }
}
