import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/Blocs/characters_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/Models/characters.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<Character>? allCharacters;
  List<Character>? searchForCharacters; //list for search items
  bool _isSearch = false; // default is false as I didnt search now
  final _searchTextController = TextEditingController();
  Widget _buildSearchField() {
    return TextField(
        controller: _searchTextController,
        cursorColor: MyColors.myYellow,
        decoration: InputDecoration(
          hintText: 'star search',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        style: TextStyle(color: Colors.grey, fontSize: 18),
        onChanged: (searchedChar) {
          addSearcheditemsToSearchedList(searchedChar);
        });
  }
  void addSearcheditemsToSearchedList(String searchCharacter) {
    searchForCharacters = allCharacters!
        .where((character) =>
            character.name.toLowerCase().startsWith(searchCharacter))
        .toList();
    {
      setState(() {});
    }
  }
  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }
  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearch = false;
    });
  }
  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearch = true;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocwidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets(); // another fn made by me
      } else {
        return CircularProgressIndicator(
          color: Colors.blue,
        );
      }
    });
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextController.text.isEmpty ? allCharacters!.length: searchForCharacters!.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: _searchTextController.text.isEmpty ?allCharacters![index]:searchForCharacters![index],
          );
        });
  }

  Widget _buildAppBarTitle() {
    return Text(
      'characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }
  List<Widget> _buildAppBarActions() {
    if (_isSearch) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch() {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.clear, color: MyColors.myGrey)),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(Icons.search, color: Colors.grey))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _isSearch ? _buildSearchField(): _buildAppBarTitle(),
      actions:_buildAppBarActions(),
      ),
      body: buildBlocwidget(), //a function made by me
    );
  }
}




