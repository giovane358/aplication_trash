import 'package:application_lixo/data/widget/login_register.dart';
import 'package:application_lixo/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fromKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  bool _resul = true;

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
                'Registra-se',
                textScaleFactor: 1.9,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextFiledContainer(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: name,
                  decoration: const InputDecoration(
                    label: Text(
                      "Nome Completo",
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.green,
                    ),
                    border: InputBorder.none,
                  ),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                    label: Text(
                      'Email',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.email_outlined,
                      color: Colors.green,
                    ),
                    border: InputBorder.none,
                  ),
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
                  obscureText: _resul,
                  keyboardType: TextInputType.visiblePassword,
                  controller: password,
                  decoration: InputDecoration(
                    label: const Text(
                      'Senha',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.password,
                      color: Colors.green,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _visibility();
                      },
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.green,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
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
                  obscureText: _resul,
                  keyboardType: TextInputType.visiblePassword,
                  controller: cPassword,
                  decoration: InputDecoration(
                    label: const Text(
                      'Confirma a Senha',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.password,
                      color: Colors.green,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _visibility();
                      },
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.green,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Esse campo é obrigatorio';
                    }
                    if (value != password.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
              ),
              ButtomContainer(
                child: GestureDetector(
                  onTap: () {
                    if (_fromKey.currentState!.validate()) {
                      register();
                    }
                  },
                  child: const Text(
                    'Registra-se',
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
                          builder: (context) => const LoginPage(),
                        ));
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
            ]),
      ),
    );
  }

  void register() async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User? user = userCredential.user;
      db.collection('user').doc(user?.uid).set({
        'ID': user!.uid,
        'Name': name.text,
      }).then((user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A senha fornecida é muito fraca.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A conta já existe para esse e-mail.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _visibility() {
    setState(() {
      _resul = false;
    });
  }
}
