import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class foodDetail extends StatelessWidget {
  final dynamic food;

  foodDetail({required this.food});

  void _launchURL() async {
    if (await canLaunchUrl(food['strYoutube'])) {
      await launchUrl(food['strYoutube']);
    } else {
      throw 'Could not launch ${food['strYoutube']}';
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Detail'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.network(food['strMealThumb'], height: 200, width: 200,),
          SizedBox(height: 20),
          Text('Name: ${food['strMeal']}'),
          SizedBox(height: 10),
          Text('Category: ${food['strCategory']}'),
          SizedBox(height: 10),
          Text('Area: ${food['strArea']}'),
          SizedBox(height: 10),
          Text('Instructions: ${food['strInstructions']}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _launchURL,
            child: Text('Watch Video'),
          ),
        ],
      ),
    );
  }
}
