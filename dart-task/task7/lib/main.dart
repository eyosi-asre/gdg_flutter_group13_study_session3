import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/150',
                  placeholder: (context, url) => Container(
                    width: 32,
                    height: 32,
                    color: Colors.grey[300],
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error, size: 32),
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF1E90FF)),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text('New', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  _buildNotificationCard('https://via.placeholder.com/150', 'Derrick T.', 'liked your new story', '2h ago'),
                  _buildNotificationCard('https://via.placeholder.com/150', 'Sophie M.', 'commented on your post', '4h ago'),
                  SizedBox(height: 20),
                  Text('Earlier', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  _buildNotificationCard('https://via.placeholder.com/150', 'Alex P.', 'followed you', '1d ago'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(String imageUrl, String title, String subtitle, String time) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              width: 40,
              height: 40,
              color: Colors.grey[300],
            ),
            errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}