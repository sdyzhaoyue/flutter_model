import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Global{

  //设置了一个初始状态
  static Global? _instance;
  late Dio dio;
  static Global? getInstance(){
    if(_instance ==null) _instance = new Global();
    return _instance;
  }
  Global(){
    dio =  Dio();
    dio.options =BaseOptions(
      baseUrl: 'http://49.233.181.150:8903/',
      connectTimeout: 5000,
      sendTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        "token":"31616"
      },
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json
    );
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          print(options.uri);
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onResponse:(response,handler) {
          print(response.data);
          print(response.headers);
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: `handler.reject(dioError)`
        },
        onError: (DioError e, handler) {
          print(e.toString());
          // Do something with response error
          return  handler.next(e);//continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: `handler.resolve(response)`.
        }
    ));
  }

}