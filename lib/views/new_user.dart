import 'package:flutter/material.dart';

import '../widgets/input_decorations.dart';

class NewUser extends StatelessWidget {
  const NewUser({super.key});

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
        const SizedBox(height: 250),
        fromlogin(context),
        const SizedBox(
          height: 50,
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
              'Atras',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ],
    );
  }

  SingleChildScrollView fromlogin(BuildContext context) {
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
                  'Registrar Usuario',
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
                          decoration: InputDecorationsFields.inputDecoration(
                              hintText: 'Ejemplo@gmail.com',
                              labelText: 'E-mail',
                              icon: const Icon(Icons.person_2_rounded)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          validator: (value) {
                            return 'La Contraseña debe ser mayor o igual a los 6 caracteres';
                          },
                          decoration: InputDecorationsFields.inputDecoration(
                              hintText: '***********',
                              labelText: 'Contraseña',
                              icon: const Icon(Icons.lock_outlined)),
                        ),
                        const SizedBox(
                          height: 15,
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
                              'enviar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'home');
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
      ])),
      width: double.infinity,
      height: size.height * 0.4,
    );
  }
}
