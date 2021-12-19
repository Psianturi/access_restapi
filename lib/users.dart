

class Users {


  String name;
  String username;
  String email;


  Users.fromJsonMap(Map<String, dynamic> map):

        name = map["name"],
        username = map["username"],
        email = map["email"];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = name;
    data['username'] = username;
    data['email'] = email;

    return data;
  }
}
