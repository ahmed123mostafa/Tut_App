import 'dart:async';
import 'package:untitled1/domain/model/models.dart';
import 'package:untitled1/presentation/base/base_view_model.dart';
import 'package:untitled1/presentation/resources/assets_manager.dart';
import 'package:untitled1/presentation/resources/strings_manager.dart';

class OnboardingViewModel
    implements
        BaseViewModel,
        OnboardingViewModelInput,
        OnboardingViewModelOutput {
  late final List<SliderModel> sliderList;
  int currentIndex = 0;

  final StreamController<Sliderviewobject> _streamController =
      StreamController<Sliderviewobject>();

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    sliderList = getsliderData();
    postDataToView();
  }

  List<SliderModel> getsliderData() {
    return [
      SliderModel(
        image: AssetsManager.onBoardingImage1,
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1,
      ),
      SliderModel(
        image: AssetsManager.onBoardingImage2,
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2,
      ),
      SliderModel(
        image: AssetsManager.onBoardingImage3,
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3,
      ),
      SliderModel(
        image: AssetsManager.onbordingimage4,
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubTitle4,
      ),
    ];
  }

  void postDataToView() {
    inputSliderviewObject.add(
      Sliderviewobject(
        sliderModel: sliderList[currentIndex],
        numberOfSlides: sliderList.length,
        currentIndex: currentIndex,
      ),
    );
  }

  @override
  int gonext() {
    int nextIndex = currentIndex + 1;
    if (nextIndex == sliderList.length) {
      nextIndex = 0; 
    }
    return nextIndex;
  }

  @override
  int goprevious() {
    int previousIndex = currentIndex - 1;
    if (previousIndex == -1) {
      previousIndex = sliderList.length - 1;
    }
    return previousIndex;
  }

  @override
  void onchange(int index) {
    currentIndex = index;
    postDataToView();
  }

  @override
  Sink<Sliderviewobject> get inputSliderviewObject => _streamController.sink;

  @override
  Stream<Sliderviewobject> get outputSliderviewObject =>
      _streamController.stream.map((sliderviewobject) => sliderviewobject);
}

abstract class OnboardingViewModelInput {
  int gonext();
  int goprevious();
  void onchange(int index);

  Sink<Sliderviewobject> get inputSliderviewObject;
}

abstract class OnboardingViewModelOutput {
  Stream<Sliderviewobject> get outputSliderviewObject;
}
