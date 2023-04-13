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
      BlocProvider.of<GridBloc>(context).add(const Initialized());
    });
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            child: ElevatedButton(onPressed: () {}, child: Text("load image")),
          ),
          Container(
            child: BlocBuilder<GridBloc, GridState>(builder: (context, state) {
              return Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(20, (index) {
                    final image = state.SearchResultKey[index];
                    if (image.profileImage == null) {
                      return SizedBox();
                    } else {
                      return ImageCard(
                        imageUrl: image.profileImage!.small ?? "No small image",
                      );
                    }
                  }),
                ),
              );
            }),
          ),
        ]),
      ),
    );
  }
}
