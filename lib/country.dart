class Country{
  String id;
  String name;

  Country.fromJson(Map<String, dynamic>parsedJson){
    id = parsedJson['id'];
    name = parsedJson['name'];
  }
  static List<Country> fromJsonArray(List jsonArray){
    return jsonArray?.map((item){
      return Country.fromJson(item);
    })?.toList();
  }

}