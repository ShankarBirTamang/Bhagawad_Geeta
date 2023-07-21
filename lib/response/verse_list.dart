// To parse this JSON data, do
//
//     final verseList = verseListFromJson(jsonString);

import 'dart:convert';

List<VerseList> verseListFromJson(String str) => List<VerseList>.from(json.decode(str).map((x) => VerseList.fromJson(x)));

String verseListToJson(List<VerseList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VerseList {
    int chapterNumber;
    String meaning;
    String text;
    String transliteration;
    String verseNumber;
    String wordMeanings;

    VerseList({
        required this.chapterNumber,
        required this.meaning,
        required this.text,
        required this.transliteration,
        required this.verseNumber,
        required this.wordMeanings,
    });

    factory VerseList.fromJson(Map<String, dynamic> json) => VerseList(
        chapterNumber: json["chapter_number"],
        meaning: json["meaning"],
        text: json["text"],
        transliteration: json["transliteration"],
        verseNumber: json["verse_number"],
        wordMeanings: json["word_meanings"],
    );

    Map<String, dynamic> toJson() => {
        "chapter_number": chapterNumber,
        "meaning": meaning,
        "text": text,
        "transliteration": transliteration,
        "verse_number": verseNumber,
        "word_meanings": wordMeanings,
    };
}
