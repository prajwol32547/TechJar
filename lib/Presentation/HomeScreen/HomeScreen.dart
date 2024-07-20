import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';
import 'package:tecapp/Presentation/HomeScreen/Widget/ListCard.dart';
import 'package:tecapp/Presentation/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text('List'),
      ),
      body: Container(
        color: Colors.white24,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                itemBuilder: (context, index) {
                  ListModel model = state.ListModelObj![index];
                  return ListCard(model: model);
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: state.ListModelObj?.length ?? 0,
              );
            }
          },
        ),
      ),
    );
  }
}
