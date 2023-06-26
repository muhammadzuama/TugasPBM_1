import 'package:flutter/material.dart';
import 'package:sehatin/Artikel/componen/custome.list.dart';
import 'package:sehatin/Artikel/model/articel.model.dart';
import 'package:sehatin/Artikel/service/api.service.dart';
import 'package:sehatin/utils/global.colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 137,
              decoration: BoxDecoration(
                color: GlobalColors.mainColor,
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
                    color: GlobalColors.backgroundColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Seputar Harga Pupuk Per Kilogram",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<ArticleModel>>(
                future: client.getArtikel(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ArticleModel>> snapshot) {
                  if (snapshot.hasData) {
                    List<ArticleModel> articles = snapshot.data!;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          customListTitle(articles[index], context),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
