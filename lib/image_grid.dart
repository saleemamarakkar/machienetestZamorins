import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebin/bloc/grid_bloc.dart';
import 'package:pastebin/filter_screen.dart';
import 'package:pastebin/full_screen.dart';
import 'package:pastebin/imageCard.dart';

class ImageGrid extends StatelessWidget {
  ImageGrid({
    super.key,
  });

  //String? serachKey = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GridBloc, GridState>(
      builder: (context, state) {
        print("\n \n \nstate \n \n==== $state");

        return OrientationBuilder(
          builder: (context, orientation) {
            return state.imageLoad.isEmpty
                ? FilterScreen()
                : GridView.count(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                    children: List.generate(state.imageLoad.length, (index) {
                      final image =
                          state.imageLoad[index].user!.profileImage!.medium;

                      final name = state.imageLoad[index].user!.name;

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
