class Company{
  int id;
  String name;
  String logo_path;
  String origin_country;

  Company.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    name =  parsedJson['name'];
    logo_path =  parsedJson['logo_path'];
    origin_country =  parsedJson['origin_country'];
  }
  static List<Company> fromJsonArray(List jsonArray){
    return jsonArray?.map((item){
      return Company.fromJson(item);
    })?.toList();
  }
}