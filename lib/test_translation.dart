import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TestTranslation extends StatefulWidget {
  const TestTranslation({Key? key}) : super(key: key);

  @override
  State<TestTranslation> createState() => _TestTranslationState();
}

class _TestTranslationState extends State<TestTranslation> {
  final translator = GoogleTranslator();
  String translatedText = 'Çevrilen metin.';
  String translatingLang= "Çevrilecek dil.";
  String translatingText = "Çevrilicek metin.";
  String translatedLang = "Çevirilen dil.";
  String metin= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.translate),
            SizedBox(width: 10),
            Text('Google Translation'),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('English'),
              const SizedBox(height: 10),
              TextField(
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: 'Enter Text',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (text) async {
                  final translation = await translator.translate(text, from: 'en', to: 'tr');
                  translatedText = translation.text;
                  translatedLang = translation.targetLanguage.name;
                  translatingLang = translation.sourceLanguage.name;
                  translatingText = translation.source;
                  metin = "$translatingText ($translatingLang) == $translatedText ($translatedLang)";
                  setState(() {
                    metin;
                  });
                },
              ),
              const Divider(
                height: 30,
              ),
              Text(
                metin,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }
}