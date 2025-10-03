import 'package:dartz/dartz.dart';
import 'package:untitled1/data/network/failuire.dart';
import 'package:untitled1/data/network/requests.dart';
import 'package:untitled1/domain/model/models.dart';

abstract interface class Repositories {
Future <Either<Failure,Auth>> login(LoginRequest loginRequest);


}