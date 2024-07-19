import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/HomeScreen/Widget/ListCard.dart';

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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListCard(context);
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: 10),
      ),
    );
  }
}
