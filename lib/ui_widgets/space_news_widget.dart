import 'package:flutter/material.dart';
import '../data_models/space_news.dart';
import '../services/space_news_service.dart';

class SpaceNewsWidget extends StatelessWidget {
  final SpaceNewsService _spaceNewsService = SpaceNewsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceNews>>(
      future: _spaceNewsService.getSpaceNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final spaceNews = snapshot.data![index];
              return ListTile(
                title: Text(spaceNews.title),
                subtitle: Text(spaceNews.summary),
              );
            },
          );
        } else {
          return Center(child: Text('No data'));
        }
      },
    );
  }
}
