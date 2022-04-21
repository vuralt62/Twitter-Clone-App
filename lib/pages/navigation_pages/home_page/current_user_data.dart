class User {
  late String name;
  late String userName;
  late String photo;

  User(this.name, this.userName, this.photo);

  static User currentUser = User("Angela", "AngelaMartin",
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80");
}
