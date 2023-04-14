import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebin/bloc/grid_bloc.dart';
import 'package:pastebin/debounce/debounce.dart';
import 'package:pastebin/full_screen.dart';
import 'package:pastebin/imageCard.dart';

String searchkey = "";

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
          CupertinoSearchTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                searchkey = value;
              }
            },
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
  ImageGrid({super.key, this.serachKey});

  String? serachKey = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GridBloc, GridState>(
      builder: (context, state) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children: List.generate(state.SearchResultKey.length, (index) {
                final image =
                    state.SearchResultKey[index].user!.profileImage!.medium;

                final name = state.SearchResultKey[index].user!.name;

                // final stateString = state.toString();
                print("\n   \n \ninside grid generator$image");

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => FullScreen(
                              image: image,
                            )));
                  },
                  child: ImageCard(
                    imageUrl: image!,
                    ProfileName: name!,
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}
