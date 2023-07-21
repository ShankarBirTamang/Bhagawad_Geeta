import 'package:flutter/material.dart';
import 'package:geeta_sutra/response/chapter_list.dart';
import 'package:http/http.dart' as http;
import 'splash_screen.dart';
int? chNumber ;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ChapterList>?> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://bhagavadgita.io/api/v1/chapters?access_token=$token'));

    List<ChapterList> chList = chapterListFromJson(response.body);
    if (response.statusCode == 200) {
      return chList;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("BHAGAVAD GEETA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        elevation: 9,
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 34, 90, 119),
        backgroundColor: const Color.fromARGB(255, 56, 90, 137),
      ),
        body: FutureBuilder<List<ChapterList>?>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (context, index) {
                ChapterList chData = snapshot.data![index];
                return Card(
                  elevation: 10,
                  shadowColor: Colors.limeAccent.shade200,
                  color: const Color.fromARGB(255, 172, 222, 178),
                  child: ListTile(
                    title: Text(chData.nameMeaning.split("\"")[1],style:const TextStyle(decoration: TextDecoration.underline),),
                    subtitle: Text(
                      chData.chapterSummary.replaceFirst("\"", ""),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: Text((index + 1).toString(),style: const TextStyle(fontSize: 24),),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_right_sharp),
                      onPressed: () {
                        setState(() {
                          chNumber = index+1;
                        });
                        Navigator.of(context).pushNamed("/verse");
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                    height: 4,
                  ),
              itemCount: snapshot.data!.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}



 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<ChapterList>?>(
//         future: 
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
            
//             return ListView.separated(
//             itemCount: .length,
//             itemBuilder:(context, index) {
//               return ListTile(
//                 title: Text('Item ${entries[index]}'),
//               );
//             }, 
//             separatorBuilder: (context, index) => const Divider(),
//         );
//           }
//         },
         
    


//       );
//   }
// }