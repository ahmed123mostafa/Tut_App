import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled1/app/constant.dart';
import 'package:untitled1/data/responce/responces.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppSevicesClient {
  factory AppSevicesClient(Dio dio, {String baseUrl}) = _AppSevicesClient;
   @POST("/customers/login")
  Future<AuthResponce> login(
      @Field("email") String email, @Field("password") String password);

}
