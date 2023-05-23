import 'package:flutter/material.dart';
import 'package:sehatin/utils/global.colors.dart';
import 'package:sehatin/view/register.view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome $username',
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: GlobalColors.backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 137,
                      decoration: BoxDecoration(
                        color: GlobalColors
                            .mainColor, // Ubah warna rectangle sesuai kebutuhan Anda
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                ' "Hidup ini seperti secangkir kopi di mana pahit dan manis bertemu dalam kehangatan" ',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: GlobalColors.mainColor),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40)),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Seputar Kopi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ])),
        ));
  }
}
