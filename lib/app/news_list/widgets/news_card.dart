import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/news_model.dart';
import '../../app_constants.dart';
import '../../utils/url_launcher.dart'; 

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.model,
  });

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tryLaunchUrl(model.link);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (model.date != null)
                    Text(
                      DateFormat(AppConstants.dateTimeFormat).format(model.date!),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  const Text(
                    'cbr.ru',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}