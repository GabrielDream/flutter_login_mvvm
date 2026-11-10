import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/login_viewmodel.dart';
import '../viewmodels/reset_password_viewmodel.dart';
import 'reset_password_page.dart';

// Login View: displays the interface.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Handles navigation to the password reset screen.
  void _openResetPassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void> (
        builder: (_) => ChangeNotifierProvider(
          create: (_) => ResetPasswordViewModel(),
          child: const ResetPasswordPage(),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listens to changes in the ViewModel.
    final viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN PAGE'),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox( //Flutter widget that limits a child's size. 
            constraints: const BoxConstraints(maxWidth: 360),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24), //Add space between the text and the next widget.

                // Email input.
                TextField(
                  onChanged: viewModel.updateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                // Password input.
                TextField(
                  onChanged: viewModel.updatePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),


                //Calls the ViewModel's login command 
                ElevatedButton (
                  onPressed: viewModel.login,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login),
                      SizedBox(width: 8),
                      Text('Login'),
                    ]
                  )
                ),

                // Calls the ViewModel's login command.
//                  ElevatedButton(
//                  onPressed: viewModel.login,
//                  child: const Icon (Icons.login),                  
//                ),

                const SizedBox(height: 8),

                // Opens the password reset screen.
                TextButton(
                  onPressed: () => _openResetPassword(context),
                  child: const Text('Forgot your password?'),
                ),

                // Displays feedback from the ViewModel.
                if (viewModel.message.isNotEmpty) ...[
                  const SizedBox(height: 16),

                  Icon(
                    viewModel.isSuccess
                        ? Icons.check_circle
                        : Icons.error_outline,
                    color: viewModel.isSuccess
                        ? Colors.green
                        : Colors.red,
                    size: 32,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    viewModel.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: viewModel.isSuccess
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16,),      
                ],

                TextButton(
                    onPressed: viewModel.register,
                    child: const Text('Register'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
