class Image{
  int height;
  int width;
  double aspect_ratio;
  String file_path;
  int vote_count;


  Image.fromJson(Map <String,dynamic> parsedJson){
    height = parsedJson['height'];
    width = parsedJson['width'];
    aspect_ratio = parsedJson['aspect_ratio'];
    file_path = parsedJson['file_path'];
    vote_count = parsedJson['vote_count'];
  }
  static List<Image> fromJsonArray(List jsonArray){
    return jsonArray?.map((item){
      return Image.fromJson(item);
    })?.toList();
  }
}