import 'package:untitled1/app/constant.dart';
import 'package:untitled1/data/responce/responces.dart';
import 'package:untitled1/domain/model/models.dart';
import 'package:untitled1/app/extention.dart';

extension CustomerResponceMapper on CustomerResponce? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty()??Constant.empty,
      this?.name.orEmpty()??Constant.empty,
      this?.numberOfNotifications.orEmpty()??Constant.empty,
    );
  }
}

extension ContactResponcesMapper on ContactResponces? {
  Contact toDomain() {
    return Contact(
      this?.phone.orZero()??Constant.zero,
      this?.email.orEmpty()??Constant.empty,
      this?.link.orEmpty()??Constant.empty,
    );
  }
}
extension AuthResponceMapper on AuthResponce? {
  Auth toDomain() {
    return Auth(
      customer: this?.customer?.toDomain(),
      contacts: this?.contact?.toDomain(),
    );
  }
}

