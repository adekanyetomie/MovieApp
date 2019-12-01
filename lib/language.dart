class Language{
  String name;
  String iso_639_1;

  Language.fromJson(Map <String, dynamic>parsedJson){
     iso_639_1 =  parsedJson['iso_639_1'];
     name =  parsedJson['name'];
  }
  static List <Language> fromJsonArray(List jsonArray){
    return jsonArray?.map((item){
      return Language.fromJson(item);
    })?.toList();
  }
}