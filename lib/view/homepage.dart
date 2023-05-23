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
            'Selamat datang $username',
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
                                ' "Bertani dengan bijak agar tetap mewariskan tanah subur pada generasi berikutnya" ',
                            hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: GlobalColors.backgroundColor),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40)),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Seputar Harga Pupuk PerKilogram",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SeassionCard(
                          seassionNum: 200000,
                          isDone: true,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 400000,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 900000,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 500000,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 60000,
                          press: () {},
                        ),
                        SeassionCard(
                          seassionNum: 400000,
                          press: () {},
                        ),
                      ],
                    ),
                  ])),
        ));
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: GlobalColors.buttonColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: GlobalColors.buttonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: GlobalColors.buttonColor),
                      ),
                      child: Icon(
                        Icons.rice_bowl,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      " $seassionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
