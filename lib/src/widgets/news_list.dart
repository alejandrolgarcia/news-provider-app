import 'package:flutter/material.dart';
import 'package:news_provider_app/src/models/news_models.dart';
import 'package:news_provider_app/src/theme/theme.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsList extends StatelessWidget {
  
  final List<Article> news;

  const NewsList( this.news );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New( news: this.news[index], index: index);
     },
    );
  }
}

class _New extends StatelessWidget {
  
  final Article news;
  final int index;

  const _New({
    @required this.news, 
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar( news, index ),
        _CardTitle( news ),
        _CardImage( news ),
        _CardBody( news ),
        _CardButton( news ),
        SizedBox( height: 10),
        Divider()
      ],
    );
  }
}

class _CardButton extends StatelessWidget {

  final Article news;

  const _CardButton( this.news );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(20)),
            child: Icon( Icons.star_border)
          ),
          SizedBox(width: 15),
          RawMaterialButton(
            onPressed: () => Navigator.pushNamed(context, 'webview', arguments: news.url),
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(20)),
            child: Icon( FontAwesomeIcons.eye )
          )
        ],
      ),
      
    );
  }
}

class _CardBody extends StatelessWidget {
  
  final Article news;

  const _CardBody(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text( (news.description != null ) ? news.description : '' ),
    );
  }
}

class _CardImage extends StatelessWidget {
  
  final Article news;

  const _CardImage(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 10 ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        ),
        child: Container(
          child: ( news.urlToImage != null )
            ?  FadeInImage(
                placeholder: AssetImage('assets/images/giphy.gif'),
                image: NetworkImage( news.urlToImage ),
              )
            : Image( image: AssetImage('assets/images/no-image.png'))
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  
  final Article news;

  const _CardTitle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text( news.title, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _CardTopBar extends StatelessWidget {

  final Article news;
  final int index;

  const _CardTopBar(this.news, this.index);
  
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only( bottom: 10),

      child: Row(
        children: [
          Text('${ index +1 }. ', style: TextStyle( color: myTheme.accentColor )),
          Text('${ news.source.name }')
        ],
      ),

    );
  }
}