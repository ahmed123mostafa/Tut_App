class SliderModel {
  String image;
  String title;
  String subTitle;

  SliderModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

class Sliderviewobject {
  SliderModel sliderModel;
  int numberOfSlides;
  int currentIndex;
  Sliderviewobject({
    required this.sliderModel,
    required this.numberOfSlides,
    required this.currentIndex,
  });

}
//login
class Customer{
  String id;
  String name;
  String numberOfNotifications;

  Customer(this.id, this.name, this.numberOfNotifications); 

}
class Contact{
  int phone;
  String email;
  String link;

  Contact(this.phone, this.email, this.link);
}
class Auth{
  Customer? customer;
  Contact? contacts;
  

  Auth({this.customer, this.contacts});
}

