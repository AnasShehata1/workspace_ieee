import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workspace_ieee/presentation/views/login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/150'),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 20),
            buildInfoCard('Name', 'Anas Mohamed'),
            const SizedBox(height: 10),
            buildInfoCard('Age', '21'),
            const SizedBox(height: 10),
            buildInfoCard('Phone', '+20 123 456 7890'),
            const SizedBox(height: 10),
            buildInfoCard('City', 'Banha'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                try {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                } catch (_) {
                  print('Error signing out');
                }
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
