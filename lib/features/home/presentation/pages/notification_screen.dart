import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifikasi"),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(0.1),
              child: const Icon(Icons.notifications, color: kPrimaryColor),
            ),
            title: Text("Notifikasi Penting ${index + 1}"),
            subtitle: const Text("Dosen baru saja mengupload materi baru."),
            trailing: Text(
              "${index + 2}m yang lalu",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
