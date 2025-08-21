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
