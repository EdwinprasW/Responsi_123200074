import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled/details_food.dart';


class categoryDetails extends StatefulWidget {
  final dynamic category;

  categoryDetails({required this.category});

  @override
  _categoryDetailsState createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {
  List<dynamic> foods = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category['strCategory']}'));
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        foods = data['meals'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      body:  GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          final category = foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => foodDetail(food: widget.category)),
              );
            },
            child: GridTile(
              child: Image.network(category['strMealThumb'], fit: BoxFit.cover),
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  category['strMeal'],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
