import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/domain/model/models.dart';
import 'package:untitled1/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:untitled1/presentation/resources/assets_manager.dart';
import 'package:untitled1/presentation/resources/color_manger.dart';
import 'package:untitled1/presentation/resources/route_manager.dart';
import 'package:untitled1/presentation/resources/strings_manager.dart';
import 'package:untitled1/presentation/resources/values_manager.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});
  //////

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final PageController pageController = PageController();
  final OnboardingViewModel onboardingViewModel = OnboardingViewModel();

  void bind() {
    onboardingViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    bind();
  }

  @override
  void dispose() {
    pageController.dispose();
    onboardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Sliderviewobject>(
      stream: onboardingViewModel.outputSliderviewObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getContent(snapshot.data!);
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget getContent(Sliderviewobject sliderviewobject) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: sliderviewobject.numberOfSlides,
        onPageChanged: (index) {
          onboardingViewModel.onchange(index);
        },
        itemBuilder: (context, index) {
          return Onbordingpage(sliderviewobject.sliderModel);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            getBottomSheetIndicator(sliderviewobject),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheetIndicator(Sliderviewobject sliderModel) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  onboardingViewModel.goprevious(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.leftarrow),
              ),
            ),
          ),

          // circles
          Row(
            children: [
              for (int i = 0; i < sliderModel.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: getPropertyCircle(sliderModel.currentIndex, i),
                ),
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  onboardingViewModel.gonext(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.rightarrow),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getPropertyCircle(int currentIndex, int index) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.circleimage);
    } else {
      return SvgPicture.asset(AssetsManager.solid);
    }
  }
}

class Onbordingpage extends StatelessWidget {
  final SliderModel sliderModel;
  const Onbordingpage(this.sliderModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderModel.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderModel.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(sliderModel.image),
      ],
    );
  }
}
