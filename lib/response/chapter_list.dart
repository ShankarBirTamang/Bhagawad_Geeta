// To parse this JSON data, do
//
//     final chapterList = chapterListFromJson(jsonString);

import 'dart:convert';

List<ChapterList> chapterListFromJson(String str) => List<ChapterList>.from(json.decode(str).map((x) => ChapterList.fromJson(x)));

String chapterListToJson(List<ChapterList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterList {
    int chapterNumber;
    String chapterSummary;
    String name;
    String nameMeaning;
    String nameTranslation;
    String nameTransliterated;
    int versesCount;

    ChapterList({
        required this.chapterNumber,
        required this.chapterSummary,
        required this.name,
        required this.nameMeaning,
        required this.nameTranslation,
        required this.nameTransliterated,
        required this.versesCount,
    });

    factory ChapterList.fromJson(Map<String, dynamic> json) => ChapterList(
        chapterNumber: json["chapter_number"],
        chapterSummary: json["chapter_summary"],
        name: json["name"],
        nameMeaning: json["name_meaning"],
        nameTranslation: json["name_translation"],
        nameTransliterated: json["name_transliterated"],
        versesCount: json["verses_count"],
    );

    Map<String, dynamic> toJson() => {
        "chapter_number": chapterNumber,
        "chapter_summary": chapterSummary,
        "name": name,
        "name_meaning": nameMeaning,
        "name_translation": nameTranslation,
        "name_transliterated": nameTransliterated,
        "verses_count": versesCount,
    };
}
