import 'package:flutter_breaking/data/Models/characters.dart';
import 'package:flutter_breaking/data/Models/quotes.dart';
import 'package:flutter_breaking/data/services/characters_web_services.dart';

class CharacterRepository{
 final CharacterWebService characterWebService;

  CharacterRepository(this.characterWebService);
 Future<List<Character>> getAllCharacters() async {
   final characters = await characterWebService.getAllCharacters();
   return characters.map((character) => Character.fromJson(character)).toList();
 }
 Future<List<Quotes>> getCharQuote(String charName) async {
   final quotes = await characterWebService.getCharQuote(charName);
   return quotes.map((charName) => Quotes.fromJson(charName)).toList();
}}
