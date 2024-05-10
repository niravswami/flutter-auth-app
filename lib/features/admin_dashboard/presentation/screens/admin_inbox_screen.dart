import 'package:flutter/material.dart';

class AdminInboxScreen extends StatelessWidget {
  const AdminInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 20, // Adjust based on your data
        itemBuilder: (context, index) {
          // Example data
          String sender = 'Sender $index';
          String subject = 'Subject $index';
          String snippet =
              'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur similique dolor nulla. Non, quas, fuga excepturi nisi illo ab reprehenderit accusantium aperiam rem, possimus corrupti assumenda laudantium dignissimos modi sunt.';

          return ListTile(
            onTap: () {
              // Open email details or navigate to email details screen
            },
            leading: CircleAvatar(
              child: Text(sender[0]),
            ),
            title: Text(sender),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(subject),
                Text(
                  snippet,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            trailing: Text('10:00 AM'), // Example time
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Compose new email
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
