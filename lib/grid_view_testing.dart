import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pastebin/bloc/grid_bloc.dart';
import 'package:pastebin/debounce/debounce.dart';
import 'package:pastebin/filter_screen.dart';
import 'package:pastebin/full_screen.dart';
import 'package:pastebin/imageCard.dart';
import 'package:pastebin/image_grid.dart';

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
                _debouncer.run(() {
                  BlocProvider.of<GridBloc>(context)
                      .add(GridEvent.searchMovie(searchKey: value));
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => FilterScreen(filterText: value),
                  // ));
                });
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
