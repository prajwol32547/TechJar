import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Presentation/DetailScreen/Widget/commentTile.dart';
import 'package:tecapp/Presentation/DetailScreen/bloc/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(8),
              child: BlocConsumer<DetailBloc, DetailState>(
                listener: (context, state) {
                  if (state.isLoading == true) {
                    CircularProgressIndicator();
                  }
                },
                builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      commentModel model = state.commentModelObj![index];

                      return commentTile(context, model);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemCount: state.commentModelObj?.length ?? 0,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(onPressed: null, icon: Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
