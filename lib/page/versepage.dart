import 'package:flutter/material.dart';
import 'package:geeta_sutra/response/verse_list.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import 'splash_screen.dart';

class VersePage extends StatefulWidget {
  const VersePage({super.key});
  @override
  State<VersePage> createState() => _VersePageState();
}

class _VersePageState extends State<VersePage> {
  Future<List<VerseList>?> getVerse() async {
    try {
      http.Response response = await http.get(Uri(
          scheme: 'https',
          host: 'bhagavadgita.io',
          path: 'api/v1/chapters/$chNumber/verses',
          queryParameters: {'access_token': token}));
      // var url =
      //     'https://bhagavadgita.io/api/v1/chapters/1/verses?access_token=$token';
      //   http.Response response = await http.get(Uri.parse(url));
      debugPrint(response.body.toString());
      final vList = verseListFromJson(response.body);
      return response.statusCode == 200 ? vList : null;
    } on Exception catch (e) {
      debugPrintStack(stackTrace: StackTrace.fromString(e.toString()));
      return Future.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHAPTER $chNumber"),
        elevation: 9,
        centerTitle: true,
        shadowColor: Colors.blueGrey,
        backgroundColor: const Color.fromARGB(255, 56, 90, 137),
      ),
      body: SafeArea(
          child: FutureBuilder<List<VerseList>?>(
        future: getVerse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  VerseList verses = snapshot.data![index];
                  return Card(
                    elevation: 8,
                    color: Colors.amberAccent.shade100,
                    child: ExpansionTile(
                      title: Text("Verse No. ${verses.verseNumber}"),
                      subtitle: Text(verses.meaning),
                    textColor: const Color.fromARGB(255, 56, 90, 137),
                      children: [
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Column( mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                Text(verses.text,style: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 18, 99, 9)), ),
                                const SizedBox(height: 5,),
                                Text(verses.wordMeanings.replaceAll(";", "\n").replaceAll("—", " = "))
                              
                              ]),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      height: 3,
                      thickness: 0.1,
                    ),
                itemCount: snapshot.data!.length);
          }
          if (snapshot.hasError) {
            return Center(child: Text("Unexpected Error : ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
