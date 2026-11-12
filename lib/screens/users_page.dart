import 'package:flutter/material.dart';
import 'package:flutter_login_mvvm/viewmodels/user_viewmodel.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    // Access and listen to our ViewModel. s
    final viewModel = context.watch<UsersViewModel>(); 
    
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Users'),
      ),

      body: ListView.builder(
        itemCount: viewModel.users.length,
        itemBuilder: (context, index) {
          final user = viewModel.users[index];

          return ListTile(
            leading: Text('${user.id}'), //Optional
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        }, 
      ),
    );
  }
} 