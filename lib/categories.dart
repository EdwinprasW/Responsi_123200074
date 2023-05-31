import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/category_details.dart';

class CategoryPage extends StatefulWidget {
  final String food;
  const CategoryPage({super.key, required this.food});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}


class _CategoryPageState extends State<CategoryPage> {
  List<dynamic> categories = [];
  @override
  void initState() {
    super.initState();
    fetchFoods();
  }


  Future<void> fetchFoods() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        categories = data['categories'];
      });
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => categoryDetails(category: category,)),
              );
            },
            child: GridTile(
              child: Image.network(category['strCategoryThumb'], fit: BoxFit.cover),
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  category['strCategory'],
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

class DescTab extends StatelessWidget {
  final dynamic category;

  DescTab({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['strCategory']),
      ),
      body: Center(
        child: Text('Description: ${category['strCategoryDescription']}'),
      ),
    );
  }
}
