class Env {
  static const String _findUsers = "https://jsonplaceholder.typicode.com/users";
  static get findUsers => _findUsers;

  static const String _findPostUrl =
      "https://jsonplaceholder.typicode.com/posts?userId=";
  static get findPostUrl => _findPostUrl;
}
