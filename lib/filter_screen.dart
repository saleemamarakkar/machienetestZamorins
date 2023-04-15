import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebin/bloc/grid_bloc.dart';
import 'package:pastebin/constants/constants.dart';
import 'package:pastebin/imageCard.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  // final String filterText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: BlocBuilder<GridBloc, GridState>(
            builder: (context, state) {
              print("inside filter screen$state");

              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(state.searchList.length, (index) {
                  final imageUrl =
                      state.searchList[index].profileImage!.medium!;
                  final name = state.searchList[index].name!;
                  return ImageCard(imageUrl: imageUrl, ProfileName: name);
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
