import 'package:wordpress_api/wordpress_api.dart';

class WordpressService {
  WordpressService();
  final api = WordPressAPI('blog.tosho.fr');

  Future<List<Post>> getPosts() async {
    final WPResponse res = await api.posts.fetch();
    return res.data as List<Post>;
  }

  Future<String> getImage({required int imageId}) async {
    final res = await api.media.fetch(id: imageId);
    return (res.data as Media).guid!;
  }
}
