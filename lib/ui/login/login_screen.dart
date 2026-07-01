import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../login/login_notifier.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final notifier = ref.read(loginProvider.notifier);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bulbasaur_logo.png',
                errorBuilder: (_, _, _) => const Icon(Icons.lock_open_rounded, size: 80, color: AppTheme.primaryBlue),
                height: 80,
              ),
              const SizedBox(height: 20),
              const Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: AppTheme.darkText)),
              const Text('Sign in to continue', style: TextStyle(fontSize: 18, color: AppTheme.darkText)),
              const SizedBox(height: 26),
              TextField(
                decoration: const InputDecoration(labelText: 'Username'),
                onChanged: notifier.updateUsername,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: notifier.updatePassword,
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton( 
                  onPressed: loginState.isLoading
                  ? null
                  : () async {
                    final success = await notifier.login();
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill out all fields')),
                      );
                    }
                  },
                  child: loginState.isLoading
                  ?  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                  : const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
              ),
              const SizedBox(height: 26),
              const Text('Forgot Password?', style: TextStyle(fontSize: 14, color: AppTheme.mutedGrey)),
              const SizedBox(height: 10),
              const Text("Don't have an account? Sign Up", style: TextStyle(fontSize: 14, color: AppTheme.mutedGrey)),
            ]
          ),
        ),
      ),
    );
  }
}

/*
  @override
  _LoginPageState createState() => _LoginPageState();

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // State Management Variable: Tracks active authentication lifecycle tasks
  bool _isLoading = false; 

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Async & Await Authentication Emulation Function
  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Asset integration check (Falls back safely if file is missing)
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                errorBuilder: (_, __, ___) => const Icon(Icons.lock_open_rounded, size: 80, color: AppTheme.primaryBlue),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: AppTheme.darkText),
              ),
              const Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 18, color: AppTheme.darkText),
              ),
              const SizedBox(height: 26),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  // Dynamic State Evaluation: Disable interactions while fetching async tasks
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 26),
              const Text('Forgot Password?', style: TextStyle(fontSize: 14, color: AppTheme.mutedGrey)),
              const SizedBox(height: 10),
              const Text("Don't have an account? Sign Up", style: TextStyle(fontSize: 14, color: AppTheme.mutedGrey)),
            ],
          ),
        ),
      ),
    );
  }
}

*/
