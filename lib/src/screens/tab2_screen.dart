import 'package:flutter/material.dart';
import 'package:news_provider_app/src/models/category_model.dart';
import 'package:news_provider_app/src/theme/theme.dart';
import 'package:news_provider_app/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'package:news_provider_app/src/services/news_service.dart';

class Tab2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Column(
        children: [
          _CategoryList(),

          if( !newsService.isLoading )
            Expanded(
              child: NewsList( newsService.getArticlesCategoriesSelected )
            ),

          if( newsService.isLoading )
            Expanded(
              child: Center(child: CircularProgressIndicator())
            )
            
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {

          final categoryName = categories[index].name;

          return Container(
            width: 110,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton( categories[index] ),
                  SizedBox( height: 5 ),
                  Text( '${ categoryName[0].toUpperCase() }${ categoryName.substring(1)}' )
                ],
              ),
            ),
          );
       },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;

  const _CategoryButton( this.category );

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        // print(category.name);
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric( horizontal: 10 ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: ( newsService.selectedCategory == this.category.name )
               ? myTheme.accentColor
               : Colors.black54
        ),
      ),
    );
  }
}