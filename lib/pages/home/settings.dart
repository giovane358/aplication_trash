import 'package:application_lixo/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final auth = FirebaseAuth.instance;
  double version = 0001;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Giovane Santos",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Text(
                        "giovanesilvadossantos8@gmail.com",
                        textScaleFactor: 0.7,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Verificado",
                        textScaleFactor: 0.9,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const TextContainerLeft(
                  child: Text(
                    'Segurança da conta',
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                      ),
                      Text(
                        'Conta',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 20,
                      ),
                      Text(
                        'Referência',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 20,
                      ),
                      Text(
                        'Moeda e recompensa',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const TextContainerLeft(
                  child: Text(
                    'Geral',
                    textScaleFactor: 1.3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.my_library_books_rounded,
                        size: 20,
                      ),
                      Text(
                        'Termos e Condições',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.privacy_tip_rounded,
                        size: 20,
                      ),
                      Text(
                        'Política de Privacidade',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.help,
                        size: 20,
                      ),
                      Text(
                        'Ajuda',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.phone_android_rounded),
                      Text('Versão: $version'),
                      const SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width * 1,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.logout_outlined),
                      GestureDetector(
                        onTap: () {
                          signout();
                        },
                        child: const Text('Sair'),
                      ),
                      const SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void signout() async {
    try {
      await auth.signOut().then((user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == '') {}
    }
  }
}

class TextContainerLeft extends StatelessWidget {
  final Widget child;
  const TextContainerLeft({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: child,
    );
  }
}

class RowSettings extends StatelessWidget {
  const RowSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 1,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          children: [
            const Icon(
              Icons.settings,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'GIovane',
              textScaleFactor: 1,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: size.width * 0.5,
            ),
            const IconButton(
                onPressed: null, icon: Icon(Icons.arrow_forward_ios))
          ],
        ));
  }
}
