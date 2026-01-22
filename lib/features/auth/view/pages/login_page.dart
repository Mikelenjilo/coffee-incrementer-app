import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../portoflio/view/pages/home_page.dart';
import '../../blocs/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = .new();
  final TextEditingController _passwordController = .new();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => CircularProgressIndicator(),
                  orElse: () => ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                    child: Text("Confirm"),
                  ),
                );
              },
              listener: (BuildContext context, AuthState state) {
                state.maybeWhen(
                  success: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  error: (err) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(err), backgroundColor: Colors.red),
                    );
                  },
                  orElse: () => null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
