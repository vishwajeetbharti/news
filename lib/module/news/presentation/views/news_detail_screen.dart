import 'package:flutter/material.dart';
import 'package:news/module/news/models/article.dart';
import 'package:news/utils/colors.dart';
import 'package:news/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article? article =
        ModalRoute.of(context)!.settings.arguments as Article?;
    if (article == null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.appBarColor,
          title: const Text(
            Strings.errorText,
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: const Center(
          child: Text(
            Strings.errorMessage,
            style: TextStyle(color: AppColors.appBarColor),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: const Text(
          Strings.newsDetailText,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildArticleImage(article),
            const SizedBox(height: 10),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Source: ${article.sourceName}',
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Published: ${article.publishedAt}',
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.content ,
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            if (article.url != null)
              TextButton(
                onPressed: () {
                  // Open the original article URL in a web browser
                  launch(article.url!);
                },
                child: const Text(
                  Strings.readText,
                  style: TextStyle(fontSize: 15, color: AppColors.appBarColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleImage(Article article) {
    return article.urlToImage != null
        ? Image.network(
            article.urlToImage!,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200.0,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: AppColors.red,
                    size: 50.0,
                  ),
                ),
              );
            },
          )
        : Container(
            height: 200.0,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(
                Icons.error_outline,
                color: AppColors.red,
                size: 50.0,
              ),
            ),
          );
  }
}
