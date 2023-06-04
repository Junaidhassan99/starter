import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
// 1
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);
  /*@override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data?.todayRecipes;
            //return Text(snapshot.hasData.toString());
            return TodayRecipeListView(recipes: recipes);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }*/
  @override
  Widget build(BuildContext context) {
// 1
    return FutureBuilder(
// 2
        future: mockService.getExploreData(),
// 3
        builder: (context, snapshot) {
// 4
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(scrollDirection: Axis.vertical, children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes),
              const SizedBox(height: 16),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts),
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
