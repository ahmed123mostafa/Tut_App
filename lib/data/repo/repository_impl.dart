import 'package:dartz/dartz.dart';
import 'package:untitled1/data/data_source/remote_data_source.dart';
import 'package:untitled1/data/mapper/mapper.dart';
import 'package:untitled1/data/mapper/network_info.dart';
import 'package:untitled1/data/network/failuire.dart';
import 'package:untitled1/data/network/requests.dart';
import 'package:untitled1/domain/model/models.dart';
import 'package:untitled1/domain/repo/repositories.dart';

class RepositoryImpl implements Repositories {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Auth>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //connect to internet
      final responce = await _remoteDataSource.login(loginRequest);
      if (responce.status == 0) {
        //success //either right
        return Right(responce.toDomain());
      } else {
        //fail//either left
        return Left(Failure(409, responce.message ?? "unknown error"));
      }
    } else {
      //no internet
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
