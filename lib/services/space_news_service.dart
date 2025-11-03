
import 'package:http/http.dart' as http;
import '../data_models/space_news.dart';

class SpaceNewsService {
  Future<List<SpaceNews>> getSpaceNews() async {
    final response = await http.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles'));

    if (response.statusCode == 200) {
      return spaceNewsFromJson(response.body);
    } else {
      throw Exception('Failed to load space news');
    }
  }
}
