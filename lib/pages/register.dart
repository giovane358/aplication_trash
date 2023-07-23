import 'package:application_lixo/data/widget/login_register.dart';
import 'package:application_lixo/pages/login.dart';
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

  void register() async {
    try {
      auth
          .createUserWithEmailAndPassword(
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
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  bool _resul = true;

  void _visibility() {
    setState(() {
      _resul = false;
    });
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
                ),
              ),
              /*TextFiledContainer(
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    label: Text('Data de Nasc'),
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.green,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),*/
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
                ),
              ),
              ButtomContainer(
                child: GestureDetector(
                  onTap: () {
                    register();
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
}
