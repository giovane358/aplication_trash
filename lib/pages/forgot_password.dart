import 'package:application_lixo/data/controller/controller_forgot_password.dart';
import 'package:application_lixo/data/widget/login_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final controller = Get.put(ControllerForgotPassword());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Esqueceu à Senha?',
            textScaleFactor: 1.9,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
          const Text('Digite o seu email cadastrado abaixo!'),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFiledContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          ),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.green,
                          )),
                    ),
                  ),
                  ButtomContainer(
                    child: GestureDetector(
                      child: const Text(
                        'Enviar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tenho conta?'),
                        GestureDetector(
                          child: const Text(
                            'Registra-se',
                            style: TextStyle(color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
