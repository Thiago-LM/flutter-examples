import 'package:flutter/material.dart';
import 'package:flutter_dribbble_nike_sb/common/constants/constants.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_cta_button.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_showcase_product.dart';
import 'package:flutter_dribbble_nike_sb/widgets/app_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _nikeLogoScaleAnimation;
  late Animation<Offset> _nikeLogoOffsetAnimation;
  late Animation<double> _leftBackgroundWidthAnimation;
  late Animation<double> _rightBackgroundWidthAnimation;
  late Animation<Offset> _productNameOffsetAnimation;
  late Animation<Offset> _productPriceOffsetAnimation;
  late Animation<Offset> _productSliderOffsetAnimation;
  late Animation<Offset> _productDescriptionOffsetAnimation;
  late Animation<Offset> _ctaOffsetAnimation;
  late Animation<Offset> _productShowcaseOffsetAnimation;
  late Animation<Offset> _display1OffsetAnimation;
  late Animation<Offset> _display2OffsetAnimation;
  late Animation<Offset> _display3OffsetAnimation;
  late Animation<Offset> _display4OffsetAnimation;

  double _shoeSize = 39;

  bool _isAnimationTriggered = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _nikeLogoScaleAnimation = Tween<double>(
      begin: 2.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );
    _nikeLogoOffsetAnimation = Tween<Offset>(
      begin: const Offset(150, 110),
      end: const Offset(20, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.125,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _leftBackgroundWidthAnimation = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _rightBackgroundWidthAnimation = Tween<double>(
      begin: 900,
      end: 500,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.ease,
        ),
      ),
    );

    _productNameOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1000),
      end: const Offset(0, 125),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.750,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productPriceOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1000),
      end: const Offset(0, 200),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.125,
          0.800,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productSliderOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1000),
      end: const Offset(0, 300),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.250,
          0.900,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productDescriptionOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1000),
      end: const Offset(0, 375),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.350,
          0.950,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _ctaOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1000),
      end: const Offset(0, 500),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.450,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _productShowcaseOffsetAnimation = Tween<Offset>(
      begin: const Offset(3000, 20),
      end: const Offset(0, 20),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.750,
          curve: Curves.ease,
        ),
      ),
    );

    _display1OffsetAnimation = Tween<Offset>(
      begin: const Offset(3000, 450),
      end: const Offset(60, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.125,
          0.500,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display2OffsetAnimation = Tween<Offset>(
      begin: const Offset(3000, 450),
      end: const Offset(160, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.350,
          0.850,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display3OffsetAnimation = Tween<Offset>(
      begin: const Offset(3000, 450),
      end: const Offset(260, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.450,
          0.950,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    _display4OffsetAnimation = Tween<Offset>(
      begin: const Offset(3000, 450),
      end: const Offset(360, 450),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.550,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040404),
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: const Color(0xFF0D0D0D),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: const Color(0xFF101010),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: const Color(0xFF202020),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: const Color(0xFFFF2D4C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Stack(
                        children: <Widget>[
                          SizedBox(
                            height: 650,
                            width: 900,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  color: const Color(0xFF121212),
                                  width: _leftBackgroundWidthAnimation.value,
                                ),
                                Container(
                                  color: const Color(0xFF0D0D0D),
                                  width: _rightBackgroundWidthAnimation.value,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 650,
                            width: 900,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 650,
                                  width: 400,
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Stack(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset:
                                            _productNameOffsetAnimation.value,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const <Widget>[
                                            SelectableText(
                                              "LEBRON SOLDIER XIII",
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SelectableText(
                                              "BUILT FOR SPEED",
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productPriceOffsetAnimation.value,
                                        child: const SelectableText(
                                          "\$150",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 48,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productSliderOffsetAnimation.value,
                                        child: AppSlider(
                                          min: 39,
                                          max: 45,
                                          divisions: 6,
                                          sliderValue: _shoeSize,
                                          sliderSteps: const [
                                            39,
                                            40,
                                            41,
                                            42,
                                            43,
                                            44,
                                            45
                                          ],
                                          onChangedValue: (double value) {
                                            setState(() {
                                              _shoeSize = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Transform.translate(
                                        offset:
                                            _productDescriptionOffsetAnimation
                                                .value,
                                        child: const SelectableText(
                                          "There's no player more battle-tested than LeBron James. Build for speed, with responsive cushioning and lightweight lockdown, the Lebron Soldier XIII is the next iteration of custom reinforcement for on-court dominance.",
                                          style: TextStyle(
                                            color: Color(0xFF909090),
                                            fontSize: 10,
                                            height: 2,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _ctaOffsetAnimation.value,
                                        child: AppCtaButton(
                                          title: 'Buy Now',
                                          onCtaTap: (bool isTapped) {
                                            // TODO: UX/logic setup for demo only :)
                                            // Show some delay
                                            Future.delayed(
                                              const Duration(seconds: 1),
                                              () {
                                                setState(() {
                                                  _isAnimationTriggered =
                                                      !_isAnimationTriggered;
                                                });

                                                _animationController.reverse();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 500,
                                  height: 650,
                                  child: Stack(
                                    children: <Widget>[
                                      Transform.translate(
                                        offset: _productShowcaseOffsetAnimation
                                            .value,
                                        child: SizedBox(
                                          height: 450,
                                          child: Stack(
                                            children: <Widget>[
                                              Center(
                                                child: AppShowCaseProduct(
                                                  productSize: _shoeSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display1OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 5,
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            child: Image.network(
                                              AssetConstants.nikeShowcase1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display2OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 5,
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            child: Image.network(
                                              AssetConstants.nikeShowcase2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display3OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 5,
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            child: Image.network(
                                              AssetConstants.nikeShowcase3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: _display4OffsetAnimation.value,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 5,
                                              color: Colors.black87,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(37.5),
                                            ),
                                            child: Image.network(
                                              AssetConstants.nikeShowcase4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.scale(
                            scale: _nikeLogoScaleAnimation.value,
                            child: Transform.translate(
                              offset: _nikeLogoOffsetAnimation.value,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isAnimationTriggered =
                                        !_isAnimationTriggered;
                                  });

                                  if (_isAnimationTriggered) {
                                    _animationController.forward();
                                  } else {
                                    _animationController.reverse();
                                  }
                                },
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(AssetConstants.nikeLogo),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
