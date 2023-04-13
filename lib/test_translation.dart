import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TestTranslation extends StatefulWidget {
  const TestTranslation({Key? key}) : super(key: key);

  @override
  State<TestTranslation> createState() => _TestTranslationState();
}

class _TestTranslationState extends State<TestTranslation> {
  final translator = GoogleTranslator();
  String translatedText = '';
  String translatingLang= "";
  String translatingText = "";
  String translatedLang = "";
  String metin1= "";
  String metin2= "";

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
                  metin1 = "$translatingText ($translatingLang)";
                  metin2 = "$translatedText ($translatedLang)";
                  setState(() {
                    metin1;
                    metin2;
                  });
                },
              ),
              const Divider(
                height: 30,
              ),
              Text(
                metin1,
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(
                height: 30,
              ),
              Text(
                metin2,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),
      ),
    );
  }
}