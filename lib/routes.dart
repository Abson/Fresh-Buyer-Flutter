import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/home/home.dart';
import 'package:freshbuyer/screens/mostpopular/most_popular_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => const HomeScreen(title: '123'),
  MostPopularScreen.route(): (context) => const MostPopularScreen()
};
