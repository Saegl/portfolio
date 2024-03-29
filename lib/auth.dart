import 'package:flutter/material.dart';
import 'package:portfolio/models.dart';
import 'package:portfolio/provider.dart';

import 'home.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Login' : 'Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              _authButton(),
              TextButton(
                onPressed: () => setState(() => isLogin = !isLogin),
                child: Text(isLogin ? 'Register' : 'Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authButton() {
    return ElevatedButton(
      onPressed: isLogin ? _onLogin : _onRegister,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          isLogin ? 'Login' : 'Register',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final repository = Provider.of(context);

    if (_formKey.currentState!.validate()) {
      final loginError = await repository.loginStudent(Student(
        username,
        password,
      ));
      if (loginError != null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Failed login'),
            content: Text(loginError),
          ),
        );
        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResumeEditor(),
        ),
      );
    }
  }

  Future<void> _onRegister() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final repository = Provider.of(context);

    if (_formKey.currentState!.validate()) {
      final registrationError = await repository.registerStudent(Student(
        username,
        password,
      ));
      if (registrationError == null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Successful registration'),
            content: Text('Username : $username'),
          ),
        );
        _clearTextFields();
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Failed registration'),
            content: Text(registrationError),
          ),
        );
      }
    }
  }

  void _clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
