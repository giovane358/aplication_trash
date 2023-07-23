import 'package:application_lixo/pages/forgot_password.dart';
import 'package:application_lixo/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/widget/login_register.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  var email = TextEditingController();
  var password = TextEditingController();
  bool _resul = true;

  void _visibility() {
    setState(() {
      _resul = false;
    });
  }

  login() async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          )
          .then((user) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Nenhum usuário encontrado para esse e-mail.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha incorreta.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Form(
        key: _fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Entrar',
              textScaleFactor: 1.9,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            TextFiledContainer(
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    label: Text('Email'),
                    labelStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    icon: Icon(Icons.email_outlined),
                    iconColor: Colors.green),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Esse campo é obrigatorio';
                  }
                  return null;
                },
              ),
            ),
            TextFiledContainer(
              child: TextFormField(
                  controller: password,
                  obscureText: _resul,
                  decoration: InputDecoration(
                    label: const Text('Senha'),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    icon: const Icon(
                      Icons.lock_open,
                      color: Colors.green,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _visibility();
                      },
                      icon: const Icon(Icons.visibility_outlined,
                          color: Colors.green),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Esse campo é obrigatorio';
                    }
                    return null;
                  }),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
              },
              child: const Text(
                'Esquceu a senha?',
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            ButtomContainer(
              child: GestureDetector(
                onTap: () {
                  if (_fromKey.currentState!.validate()) {
                    login();
                  }
                },
                child: const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OU'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ButtomContainer(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                },
                child: const Text(
                  'Registra-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
