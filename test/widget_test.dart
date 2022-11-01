import 'package:examen_flutter/src/data/common/const.dart';
import 'package:examen_flutter/src/data/enviroment/environment.dart';
import 'package:examen_flutter/src/data/hive/post_hive.dart';
import 'package:examen_flutter/src/data/hive/user_hive.dart';
import 'package:examen_flutter/src/data/http/find_http.dart';
import 'package:examen_flutter/src/data/http/user_http.dart';
import 'package:examen_flutter/src/data/provider/post_provider.dart';
import 'package:examen_flutter/src/data/provider/user_provider.dart';

import 'package:examen_flutter/src/domain/models/post_model.dart';
import 'package:examen_flutter/src/domain/models/user_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  test('pubando las constantes', () {
    expect(Consts.postBoxName, 'post');
    expect(Consts.userBoxName, 'user');
  });
  test('pubando  PostModel', () {
    final post = PostModel(
      id: 1,
      title: 'title',
      body: 'body',
      userId: 1,
    );
    expect(post.id, 1);
    expect(post.title, 'title');
    expect(post.body, 'body');
    expect(post.userId, 1);
  });
  test('pubando  UserModel', () {
    final post = UserModel(
      id: 1,
      name: 'Felipe',
      email: 'iamfelipeo@gmail.com',
      phone: '3102692138',
    );
    expect(post.id, 1);
    expect(post.name, 'Felipe');
    expect(post.email, 'iamfelipeo@gmail.com');
    expect(post.phone, '3102692138');
  });
  test('pubando las constantes de env', () {
    expect(
        Env.findPostUrl, 'https://jsonplaceholder.typicode.com/posts?userId=');
    expect(Env.findUsers, 'https://jsonplaceholder.typicode.com/users');
  });

  test('test hive PostFromHive class', () async {
    await Hive.initFlutter();

    Hive.registerAdapter(PostModelAdapter());
    PostFromHive postFromHive = PostFromHive();

    expect(await postFromHive.getPostListByUserId(1), isA<List<PostModel>>());
    expect(await postFromHive.checkIfPostAreSaved(1), isA<bool>());
    expect(
        postFromHive.savePost(
            PostModel(userId: 1, id: 1, title: 'Felipe', body: 'hola')),
        isA<Future<void>>());
  });

  test('test hive UserFromHive class ', () async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserModelAdapter());
    UserFromHive userFromHive = UserFromHive();

    expect(await userFromHive.getUserList(), isA<List<UserModel>>());
    expect(
        userFromHive.saveUser(UserModel(
          id: 1,
          name: 'Felipe',
          email: 'iamfelipeo@gmail.com',
          phone: '3102692138',
        )),
        isA<Future<void>>());
  });

  test('test para la api de la obtención de usuarios', () async {
    UserFromHttp userFromHttp = UserFromHttp();

    expect(await userFromHttp.getUserList(), isA<List<UserModel>>());
  });
  test('test para la api de obtencion de comentarios', () async {
    PostFromHttp postFromHttp = PostFromHttp();

    expect(await postFromHttp.getPostListByUserId(1), isA<List<PostModel>>());
  });

  test('test para provider PostFromProvider ', () async {
    PostFromProvider postFromProvider = PostFromProvider();

    expect(postFromProvider.currentPostList, []);
    expect(postFromProvider.currentPostList, isA<List<PostModel>>());
    expect(postFromProvider.postAreSaved, false);
  });

  test('test para provider UserFromProvider ', () async {
    UserFromProvider userFromProvider = UserFromProvider();

    expect(userFromProvider.userAreSaved, false);
    expect(userFromProvider.userModelList, isA<List<UserModel>>());
  });
}
