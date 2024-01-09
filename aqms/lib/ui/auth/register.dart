import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider/registrasi_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registerUser(BuildContext context) {
    final registrasiProvider = Provider.of<RegistrasiProvider>(context, listen: false);

    registrasiProvider.registrasiModel.nama = userController.text;
    registrasiProvider.registrasiModel.username = namaController.text;
    registrasiProvider.registrasiModel.password = passwordController.text;

    registrasiProvider.registerUser().then((_) {
      // Handle navigation or any other UI updates after registration
      // For example, navigate to the login page
      context.goNamed('login');
    });
  }

  @override
  Widget build(BuildContext context) {
    Color greenman = const Color(0xff079450);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(200)),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/bg3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 16),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: greenman,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.accessibility_new_rounded),
                                  hintText: "Nama"),
                              controller: namaController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: greenman,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.account_circle),
                                  hintText: "Username"),
                              controller: userController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: greenman,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              maxLines: 1,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.lock),
                                  hintText: "Password"),
                              controller: passwordController,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: 650,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => registerUser(context),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenman),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Registrasi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "Sudah Punya Akun ? ",
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: greenman,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => context.goNamed('login'),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 280),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 100, child: Image.asset("assets/logo.png")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
