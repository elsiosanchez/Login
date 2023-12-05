// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../models/LoginService.dart';
import '../widgets/input_decorations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _usernameController = TextEditingController();
  // final passwordController = TextEditingController();
  final _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // color: const Color(0xFFFFAB91),
        child: Stack(
          children: [
            panelmain(size),
            SafeArea(
              child: icon(),
            ),
            footer(context),
          ],
        ),
      ),
    );
  }

  Column footer(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150),
        fromlogin(context),
        const SizedBox(
          height: 30,
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          color: Colors.deepPurple,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 15,
            ),
            child: const Text(
              'Crea tu cuenta',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'newUser');
          },
        ),
        // const Text(
        //   'Crear Cuenta',
        //   style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }

  SingleChildScrollView fromlogin(BuildContext context) {
    var txtUser = TextEditingController();
    var txtPassword = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            // height: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Inicia Sesión',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Form(
                    child: (Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          controller: txtUser,
                          decoration: InputDecorationsFields.inputDecoration(
                              hintText: 'Ejemplo@gmail.com / Ejemplo123',
                              labelText: 'E-mail o Usuario',
                              icon: const Icon(Icons.person_2_rounded)),
                        ),
                        // const TextField(
                        //   // controller: _usernameController,
                        //   decoration:
                        //       InputDecoration(labelText: 'E-mail o Usuario'),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        // const TextField(
                        //   controller: passwordController,
                        //   decoration: InputDecoration(labelText: 'Password'),
                        //   obscureText: true,
                        // ),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          controller: txtPassword,
                          validator: (value) {
                            return 'La Contraseña debe ser mayor o igual a los 6 caracteres';
                          },
                          decoration: InputDecorationsFields.inputDecoration(
                              hintText: '***********',
                              labelText: 'Contraseña',
                              icon: const Icon(Icons.lock_outlined)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          color: Colors.deepPurple,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 15,
                            ),
                            child: const Text(
                              'Ingresar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          onPressed: () async {
                            final success = await _loginService.login(
                                txtUser.text, txtPassword.text);
                            print(txtUser.text);
                            print(txtPassword.text);
                            print(success);
                            if (success) {
                              // ignore: use_build_context_synchr
                              // onously
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              print('error');
                              // Handle failed login attempt
                            }
                          },
                        )
                      ],
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container icon() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: double.infinity,
      child: const Icon(
        Icons.person_pin,
        color: Colors.white,
        size: 100,
      ),
    );
  }

  Container panelmain(Size size) {
    return Container(
      // color: const Color(0xFFFFAB91),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(46, 146, 240, 1),
        Color.fromRGBO(20, 120, 214, 1),
        // Color.fromRGBO(250, 148, 111, 1),
        // Color.fromRGBO(241, 112, 64, 1)
      ])),
      width: double.infinity,
      height: size.height * 0.4,
    );
  }
}

// class LoginService {
// }
// class Login extends StatelessWidget {
//   // const Login({super.key});
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         // color: const Color(0xFFFFAB91),
//         child: Stack(
//           children: [
//             panelmain(size),
//             SafeArea(
//               child: icon(),
//             ),
//             footer(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Column footer(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 150),
//         fromlogin(context),
//         const SizedBox(
//           height: 30,
//         ),
//         MaterialButton(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           disabledColor: Colors.grey,
//           color: Colors.deepPurple,
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 80,
//               vertical: 15,
//             ),
//             child: const Text(
//               'Crea tu cuenta',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, 'newUser');
//           },
//         ),
//         // const Text(
//         //   'Crear Cuenta',
//         //   style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//         // ),
//       ],
//     );
//   }

//   SingleChildScrollView fromlogin(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Container(
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.symmetric(horizontal: 30),
//             width: double.infinity,
//             // height: 350,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 15,
//                     offset: Offset(0, 5),
//                   )
//                 ]),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Inicia Sesión',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // ignore: avoid_unnecessary_containers
//                 Container(
//                   child: Form(
//                     child: (Column(
//                       children: [
//                         // TextFormField(
//                         //   autocorrect: false,
//                         //   decoration: InputDecorationsFields.inputDecoration(
//                         //       hintText: 'Ejemplo@gmail.com / Ejemplo123',
//                         //       labelText: 'E-mail o Usuario',
//                         //       icon: const Icon(Icons.person_2_rounded)),
//                         // ),
//                         const TextField(
//                           controller: usernameController,
//                           decoration:
//                               InputDecoration(labelText: 'E-mail o Usuario'),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         const TextField(
//                           controller: passwordController,
//                           decoration: InputDecoration(labelText: 'Password'),
//                           obscureText: true,
//                         ),
//                         // TextFormField(
//                         //   autocorrect: false,
//                         //   obscureText: true,
//                         //   validator: (value) {
//                         //     return 'La Contraseña debe ser mayor o igual a los 6 caracteres';
//                         //   },
//                         //   decoration: InputDecorationsFields.inputDecoration(
//                         //       hintText: '***********',
//                         //       labelText: 'Contraseña',
//                         //       icon: const Icon(Icons.lock_outlined)),
//                         // ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           disabledColor: Colors.grey,
//                           color: Colors.deepPurple,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 80,
//                               vertical: 15,
//                             ),
//                             child: const Text(
//                               'Ingresar',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 18),
//                             ),
//                           ),
//                           onPressed: () {
//                             // print({
//                             //   'alo'
//                             // })
//                             print('Hello World');
//                             print(usernameController);
//                             print(passwordController);
//                             Navigator.pushReplacementNamed(context, 'home');
//                           },
//                         )
//                       ],
//                     )),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Container icon() {
//     return Container(
//       margin: const EdgeInsets.only(top: 60),
//       width: double.infinity,
//       child: const Icon(
//         Icons.person_pin,
//         color: Colors.white,
//         size: 100,
//       ),
//     );
//   }

//   Container panelmain(Size size) {
//     return Container(
//       // color: const Color(0xFFFFAB91),
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: [
//         Color.fromRGBO(46, 146, 240, 1),
//         Color.fromRGBO(20, 120, 214, 1),
//         // Color.fromRGBO(250, 148, 111, 1),
//         // Color.fromRGBO(241, 112, 64, 1)
//       ])),
//       width: double.infinity,
//       height: size.height * 0.4,
//     );
//   }
// }
