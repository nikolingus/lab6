import 'package:url_launcher/url_launcher.dart';

Future<void> tryLaunchUrl(String url) async {
  print('Попытка открыть ссылку: $url');
  
  if (url.isEmpty) {
    print('Ссылка пустая!');
    return;
  }
  
  // Убедимся, что URL имеет правильный формат
  String formattedUrl = url;
  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    formattedUrl = 'https://$url';
    print('Форматируем URL: $formattedUrl');
  }
  
  try {
    final Uri uri = Uri.parse(formattedUrl);
    print('Парсим URI: $uri');
    
    final canLaunch = await canLaunchUrl(uri);
    print('canLaunchUrl результат: $canLaunch');
    
    if (canLaunch) {
      print('Запускаем URL...');
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      print('URL запущен');
    } else {
      print('Невозможно запустить URL: $formattedUrl');
      // Можно показать сообщение пользователю
    }
  } catch (e) {
    print('Ошибка при открытии ссылки: $e');
  }
}