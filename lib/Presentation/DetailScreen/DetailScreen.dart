import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Presentation/DetailScreen/Widget/commentTile.dart';
import 'package:tecapp/Presentation/DetailScreen/bloc/detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 241, 241, 241),
              padding: EdgeInsets.all(8),
              child: BlocConsumer<DetailBloc, DetailState>(
                listener: (context, state) {
                  print(state.isLoading);
                },
                builder: (context, state) {
                  if (state.isLoading == true) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      commentModel model = state.commentModelObj![index];

                      return commentTile(context, model);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 7),
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
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                BlocConsumer<DetailBloc, DetailState>(
                    listener: (context, state) {
                  if (state.requestSend!) {
                    print('Request sending...');
                    commentController.clear();
                  }
                }, builder: (context, state) {
                  if (state.requestSend!) {
                    return CircularProgressIndicator();
                  }
                  Map<String, dynamic> data = {
                    "postId": state.post_id.toString(),
                    "id": 203.toString(),
                    "name": "Prajwol Lama",
                    "email": "tech@jar.com",
                    "body": commentController.text.toString()
                  };
                  return IconButton(
                    onPressed: () {
                      if (commentController.text != '') {
                        context.read<DetailBloc>().add(
                              DetailPostEvent(
                                postId: state.post_id,
                                payload: data,
                              ),
                            );
                        if (state.commentSentMessage == 'Error occured' ||
                            state.commentSentMessage != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Row(
                                  children: [
                                    Icon(Icons.check_circle,
                                        color: Colors.green),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text('Successfully commented'),
                                    ),
                                  ],
                                ),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.grey[800],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 10,
                              behavior: SnackBarBehavior.floating,
                              content: SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Row(
                                  children: [
                                    Icon(Icons.clear_rounded,
                                        color: Colors.red),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text('Error occured'),
                                    ),
                                  ],
                                ),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.grey[800],
                            ),
                          );
                        }
                      } else {}
                    },
                    icon: Icon(Icons.send),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
