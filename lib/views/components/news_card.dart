import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              errorBuilder:(context, error, stackTrace) {
                return Image.asset('assets/images/logo.jpg');
              },
            ),
          ),
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
