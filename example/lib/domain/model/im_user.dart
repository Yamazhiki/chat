class IMUser {
  final String username;
  final String avatar;

  IMUser({this.username, this.avatar});

  factory IMUser.create(int idx) {
    switch (idx) {
      case 0:
        return IMUser(
            username: "Yamazhiki",
            avatar: "https://pic.feizl.com/upload/allimg/180201/403kjculwv52sr.jpg");
      default:
        return IMUser(
            username: "南风不竞",
            avatar: "https://pic.feizl.com/upload/allimg/170615/1201131226-3.jpg");
    }
  }
}

extension IMUserExt on IMUser {
  String get age => "1";

  static IMUser get temp0 => IMUser(
      username: "Yamazhiki",
      avatar: "https://pic.feizl.com/upload/allimg/180201/403kjculwv52sr.jpg");

  static IMUser get temp1 => IMUser(
      username: "南风不竞", avatar: "https://pic.feizl.com/upload/allimg/170615/1201131226-3.jpg");
}
