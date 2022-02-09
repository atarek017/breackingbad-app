class Character {
  late int char_id;
  late String name;
  late String nickname;
  late String image;
  late String birthday;
  late List<dynamic> jobs;
  late String statusIfDeadorAlive;
  late List<dynamic> aprepenceOffSeasons;
  late String actorName;
  late String categoryForTowsearies;
  late List<dynamic> better_call_saul_appearance;

  Character.formJson(Map<String, dynamic> json) {
    char_id = json["char_id"];
    name = json["name"];
    nickname = json["nickname"];
    image = json["img"];
    birthday = json["birthday"];
    jobs = json["occupation"];
    statusIfDeadorAlive = json["status"];
    aprepenceOffSeasons = json["appearance"];
    actorName = json["portrayed"];
    categoryForTowsearies = json["category"];
    better_call_saul_appearance = json["better_call_saul_appearance"];
  }
}
