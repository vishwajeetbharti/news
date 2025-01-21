import 'package:flutter/material.dart';
import 'package:news/module/news/models/article.dart';
import 'package:news/module/news/presentation/view-model/favorites_provider.dart';
import 'package:news/module/news/presentation/views/web_view_screen.dart';
import 'package:news/utils/colors.dart';
import 'package:provider/provider.dart';

class NewsListItem extends StatelessWidget {
  final Article article;

  const NewsListItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, AppRoutes.newsDetail, arguments: article);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(webLink: article.url),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        color: AppColors.tileColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display the image with error handling
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback UI when the image fails to load
                  return Container(
                    height: 200.0,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 50.0,
                      ),
                    ),
                  );
                },
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                article.sourceName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                article.publishedAt,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    favoritesProvider.favorites
                            .any((fav) => fav.url == article.url)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoritesProvider.favorites
                            .any((fav) => fav.url == article.url)
                        ? Colors.red
                        : null,
                  ),
                  onPressed: () {
                    favoritesProvider.toggleFavorite(article);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
