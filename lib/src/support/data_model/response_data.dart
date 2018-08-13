
// data model of server response data
class HeroResponse {
  // response success or failure
  String info;
  // hero data, can be one object or a list
  dynamic data;

  HeroResponse(String info, dynamic data);
}