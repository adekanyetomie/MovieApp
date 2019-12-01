class Genre{
  int id;
  String name;

  Genre.fromJson(Map < String, dynamic> parsedJson){
    id = parsedJson['id'];
    name = parsedJson['name'];
  }
  static List<Genre> fromJsonArray(List jsonArray){
    return jsonArray?.map((item){
      return Genre.fromJson(item);
    })?.toList();
  }
}