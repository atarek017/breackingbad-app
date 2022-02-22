class Character {
  late int char_id;
  late String name;
  late String nickName;
  late String image;
  late String birthday;
  late List<dynamic> jobs;
  late String statusIfDeadOrAlive;
  late List<dynamic> appearanceOfSeasons;
  late String actorName;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearance;

  Character.formJson(Map<String, dynamic> json) {
    char_id = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    image = json["img"];
    birthday = json["birthday"];
    jobs = json["occupation"];
    statusIfDeadOrAlive = json["status"];
    appearanceOfSeasons = json["appearance"];
    actorName = json["portrayed"];
    categoryForTwoSeries = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}
