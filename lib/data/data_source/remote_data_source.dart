import 'package:untitled1/data/network/app_api.dart';
import 'package:untitled1/data/network/requests.dart';
import 'package:untitled1/data/responce/responces.dart';

abstract interface class RemoteDataSource {
  Future<AuthResponce> login(LoginRequest loginRequest);


}
  class RemoteDataSourceImpl implements RemoteDataSource{
 final    AppSevicesClient _appSevicesClient;
    RemoteDataSourceImpl( this._appSevicesClient);
  @override
  Future<AuthResponce> login(LoginRequest loginRequest) async{
    return await _appSevicesClient.login(loginRequest.email, loginRequest.password);
  
  }
    


}