import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecapp/Presentation/DetailScreen/DetailScreen.dart';
import 'package:tecapp/Presentation/DetailScreen/bloc/detail_bloc.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';
import 'package:tecapp/Presentation/HomeScreen/bloc/home_bloc.dart';
import 'package:tecapp/Repository/fetchingData.dart';

class ListCard extends StatefulWidget {
  final ListModel model;
  const ListCard({Key? key, required this.model}) : super(key: key);

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  double bottomSheetHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              widget.model.title ??
                  'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            SizedBox(height: 8.0),
            Text(
              'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => getAllList(),
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<DetailBloc>()
                        .add(DetailInitialEvent(postId: widget.model.postId!));
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return GestureDetector(
                              onVerticalDragUpdate: (details) {
                                if (details.primaryDelta! < -6) {
                                  bottomSheetHeight =
                                      constraints.maxHeight * 0.8;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                height: bottomSheetHeight,
                                child: DetailScreen(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.comment_outlined),
                ),
                IconButton(onPressed: null, icon: Icon(Icons.share))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
