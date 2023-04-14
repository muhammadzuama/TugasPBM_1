import 'package:flutter/material.dart';
import 'package:sehatin/utils/global.colors.dart';
import 'package:sehatin/view/register.view.dart';

final TextEditingController BeratController = TextEditingController();
final TextEditingController TinggiConstroller = TextEditingController();

class BmiView extends StatelessWidget {
  const BmiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome $username',
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              // Text(
              //   'BMI anda adalah: ${bmi.toStringAsFixed(2)}',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Berat Badan ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      controller: BeratController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Berat Badan(Kg) ",
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 168, 168, 168)
                                  .withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Tinggi Badan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: TinggiConstroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tinggi Badan(Cm)",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 168, 168, 168)
                              .withOpacity(0.6),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      ), // Menampilkan inputan sebagai password
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor: GlobalColors.buttonColor),
                    onPressed: () {
                      // Rumus BMI = bb/(tb)*2
                      int bb = int.tryParse(BeratController.text) ?? 0;
                      double tb =
                          double.tryParse(TinggiConstroller.text) ?? 0.0;
                      double bmi = bb / ((tb / 100) * (tb / 100));
                      print("BMI anda adalah : $bmi");
                      if (bmi <= 18.5) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Anda Kategori Kurus"),
                                  content: Text("Jumlah BMI anda adalah $bmi"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      } else if (bmi < 25) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Anda Kategori Normal"),
                                  content: Text("Jumlah BMI anda adalah $bmi"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      } else if (bmi < 30) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      "Anda Kategori Kelebihan Berat Badan"),
                                  content: Text("Jumlah BMI anda adalah $bmi"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      } else if (bmi < 39.9) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Anda Kategori Obesitas"),
                                  content: Text("Jumlah BMI anda adalah $bmi"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      } else if (bmi > 40) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      "Anda Kategori Obesitas Yang sangat Extrem"),
                                  content: Text("Jumlah BMI anda adalah $bmi"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Invalid Data"),
                                  content: Text(
                                      "Tinggi badan atau Berat badan yang Anda masukkan salah."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    )
                                  ],
                                ));
                      }

                      print(
                          'Berat Badan: $bb'); // Menampilkan nilai inputan email pada console
                      print(
                          'Tinggi Badan: $tb'); // Menampilkan nilai inputan password pada console
                    },
                    child: Text(
                      "UKUR BMI",
                    )),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
