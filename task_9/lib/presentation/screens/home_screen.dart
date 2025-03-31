// lib/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:task_9/data/services/api_services.dart';
import 'package:task_9/data/services/pref_services.dart';
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? savedUser;
  final UserRepository userRepository = UserRepository(ApiService(), StorageService());

  @override
  void initState() {
    super.initState();
    _loadSavedUser();
  }

  Future<void> _loadSavedUser() async {
    final user = await userRepository.getSavedUser();
    setState(() {
      savedUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Column(
        children: [
          if (savedUser != null)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Last Saved: ${savedUser!.name} - ${savedUser!.email}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: userRepository.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('No internet connection. Please try again later.'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No users found'));
                } else {
                  final users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () async {
                            await userRepository.saveUser(user);
                            setState(() {
                              savedUser = user;
                            });
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}