import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecapp/Presentation/HomeScreen/bloc/home_bloc.dart';

Widget ListCard(context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.4),
      ),
      child: Column(
        children: [
          // const Card(
          //   child: SizedBox(
          //     height: 120,
          //     width: double.infinity,
          //     child: Text('Image'),
          //   ),
          // ),
          Text(
            'ea molestias quasi exercitationem repellat qui ipsa sit aut',
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
              'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut',
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall),
          Row(
            children: [
              Expanded(child: Container()),
              IconButton(
                onPressed: null,
                // onPressed: () => {
                //   context
                //       .read<HomeBloc>()
                //       .add(CartButtonClickedEvent(color: Colors.red))
                // },
                icon: Icon(Icons.favorite_border, color: Colors.black
                    // Handle null color
                    ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
