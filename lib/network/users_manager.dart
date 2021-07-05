import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/model.dart';
import 'package:practice/network/base_network.dart';
import 'package:practice/network/base_response.dart';
import 'package:practice/urls.dart';



class UsersManager{
    Future<ResponseData> fetchUsers() async {

    Response response;
    try {
      response = await dioClient.ref
          .get<dynamic>(URLS.url());

      if(response.statusCode == 200) {
        final model = UsersFollowersData.fromMap(response.data);
        return ResponseData("", ResponseStatus.SUCCESS, data: model);
      } else {
        var message = "Unknown error";
        if(response.data?.containsKey("message") == true){
          message = response.data['message'];
        }
        return ResponseData(message, ResponseStatus.FAILED);
      }
    } on Exception catch (err) {
      return ResponseData<dynamic>( err.toString(), ResponseStatus.FAILED);
    }

  }
}
UsersManager userManager = UsersManager();