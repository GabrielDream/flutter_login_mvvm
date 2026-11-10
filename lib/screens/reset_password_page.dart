
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/reset_password_viewmodel.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ResetPasswordViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET PASSWORD'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Reset your password',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                TextField(
                  onChanged: viewModel.updateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  onChanged: viewModel.updateNewPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  onChanged: viewModel.updateConfirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: viewModel.resetPassword,
                  child: const Text('Reset Password'),
                ),

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
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
