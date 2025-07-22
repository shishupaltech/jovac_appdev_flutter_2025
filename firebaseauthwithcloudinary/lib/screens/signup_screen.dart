import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home/home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;

  Future<void> _signup() async{
    setState(() {
      loading = true;
    });
    try {
      await AuthServices.singUp(
          _emailController.text,
          _passwordController.text
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen()
          )
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup Failed ${e.toString()}'))
      );
    } finally{
      setState(()=> loading = false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: loading? null : _signup,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Signup')
            ),
            const SizedBox(height: 20,),
            TextButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()
                      ));
                },
                child: const Text("Already have an account? Login")
            )
          ],
        )
      ),
    );
  }
}
