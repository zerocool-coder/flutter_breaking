class Character{
 late int charId;
 late String name;
 late String nickName;
 late String image;
 late List<dynamic> jobs;
 late String statusIfDeadorALive;
 late List<dynamic> appearanceOfSeasons;
 late String actorname;
 late String categoryForTwoSeries;
 late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String,dynamic>json){
    charId=json["char_id"];
    name=json["name"];
    nickName=json["nickname"];
    image=json["img"];
    jobs=json['occupation'];
    statusIfDeadorALive =json["status"];
    appearanceOfSeasons=json["appearance"];
    actorname =json["portrayed"];
    categoryForTwoSeries=json["category"];
    betterCallSaulAppearance=json["better_call_saul_appearance"];

  }
}