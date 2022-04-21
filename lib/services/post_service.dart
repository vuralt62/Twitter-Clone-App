import 'package:twitter_clone/pages/navigation_pages/home_page/post_modal.dart';

class PostService {
  List<Post> getPosts() {
    return data;
  }

  List<Post> data = [
    Post(
        id: 1,
        name: "Jack",
        userName: "Jacks",
        userPhoto:
            "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        dateTime: DateTime.now(),
        text: "Hello World",
        photo: [
          "https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        ],
        video: null,
        commentCount: "0",
        retweetCount: "1",
        likeCount: "0"),
    Post(
        id: 2,
        name: "Jack",
        userName: "Jacks",
        userPhoto:
            "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        dateTime: DateTime.now(),
        text: "Hello World",
        photo: [
          "https://images.pexels.com/photos/11588707/pexels-photo-11588707.jpeg?cs=srgb&dl=pexels-elif-aksoy-11588707.jpg&fm=jpg",
          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-774909.jpg&fm=jpg",
        ],
        video: null,
        commentCount: "0",
        retweetCount: "1",
        likeCount: "0"),
    Post(
        id: 3,
        name: "Jack",
        userName: "Jacks",
        userPhoto:
            "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        dateTime: DateTime.now(),
        text: "Hello World",
        photo: [
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg",
          "https://images.pexels.com/photos/4041013/pexels-photo-4041013.jpeg?cs=srgb&dl=pexels-apex-4041013.jpg&fm=jpg",
          "https://images.pexels.com/photos/1766212/pexels-photo-1766212.jpeg?cs=srgb&dl=pexels-omar-laghmiche-1766212.jpg&fm=jpg"
        ],
        video: null,
        commentCount: "0",
        retweetCount: "1",
        likeCount: "0"),
    Post(
        id: 4,
        name: "Jack",
        userName: "Jacks",
        userPhoto:
            "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        dateTime: DateTime.now(),
        text: "Hello World",
        photo: [
          "https://images.pexels.com/photos/11741441/pexels-photo-11741441.jpeg?cs=srgb&dl=pexels-danil-lysov-11741441.jpg&fm=jpg",
          "https://images.pexels.com/photos/235807/pexels-photo-235807.jpeg?cs=srgb&dl=pexels-pixabay-235807.jpg&fm=jpg",
          "https://images.pexels.com/photos/11258468/pexels-photo-11258468.jpeg?cs=srgb&dl=pexels-daniel-torobekov-11258468.jpg&fm=jpg",
          "https://images.pexels.com/photos/8905101/pexels-photo-8905101.jpeg?cs=srgb&dl=pexels-eriks-cistovs-8905101.jpg&fm=jpg"
        ],
        video: null,
        commentCount: "0",
        retweetCount: "1",
        likeCount: "0")
  ];
}
