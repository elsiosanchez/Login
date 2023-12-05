// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            panelmain(size),
            SafeArea(
              child: panel(),
            ),
            Exit(context),
          ],
        ),
      ),
    );
  }

  Column Exit(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 450,
          width: 1500,
        ),
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
              'Salir',
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
      height: size.height * 10,
    );
  }

  ListView panel() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index == 1) {
                  return Image.network(
                    'https://play-lh.googleusercontent.com/qqqiN28cwhj-N3PUAw5x0AqzgVRt7Gy_rH7ftO7rhSqwyv44B3oFtm4m74NeR104gA=w600-h300-pc0xffffff-pd?w=450&h=256', // replace 'https://link-to-channel-logo.com' with the URL of the channel logo at index
                  );
                }
                return Image.network(
                  'https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=450&h=256', // replace 'https://link-to-channel-logo.com' with the URL of the channel logo at index
                );
              },
            ),
          ],
        );
      },
    );
  }
}
