import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stroll_t1/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/the_bg.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),

                  //heading
                  headingSec(),
                  // sub heading
                  subHeading(),

                  // ! mid prfile section
                  SizedBox(
                    height: 240.h,
                  ),
                  midProfile(),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "“Mine is definitely the peace in the morning.”",
                    style: TextStyle(
                        color: AppColors.headingText,
                        fontStyle: FontStyle.italic,
                        fontSize: 13),
                  ),

                  SizedBox(
                    height: 140.h,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: (166 / 57),
                      ),
                      itemCount: _options.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected = _isSelected == i ? null : i;
                              });
                            },
                            child: Container(
                              height: 57.h,
                              width: 166.w,
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: _isSelected == i
                                      ? AppColors.primaryViolet
                                      : Colors.transparent,
                                  width: 2.w, // Responsive border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 25.h,
                                      width: 25.h,
                                      decoration: BoxDecoration(
                                        color: _isSelected == i
                                            ? AppColors.primaryViolet
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: _isSelected == i
                                              ? AppColors.primaryViolet
                                              : Colors.white,
                                          width: 1.5.w,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          _options[i],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    // Title Text
                                    Flexible(
                                      child: Text(
                                        _titles[i],
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // bottom mic and arrow
                  SizedBox(
                    height: 6.h,
                  ),
                  bottomMicUi(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(8.w),
        height: 45.h,
        decoration: const BoxDecoration(
          color: Color(0xFF1D2026),
          borderRadius: BorderRadius.only(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/bottom_1.png', width: 24.w, height: 24.h),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/bottom_2.png',
                        width: 24.w, height: 24.h),
                  ],
                ),
                Positioned(
                  top: -4, //
                  right: -8,
                  child: Container(
                    height: 12.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        color: AppColors.primaryViolet, //
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/bottom_3.png',
                        width: 24.w, height: 24.h),
                  ],
                ),
                Positioned(
                  top: -0,
                  right: -8,
                  child: Container(
                    height: 12.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        color: AppColors.primaryViolet,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '10', // Badge number
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/avatar.png', width: 24.w, height: 24.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget headingSec() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Stroll Bonfire",
            style: TextStyle(
              fontSize: 35.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.headingText,
              shadows: [
                Shadow(
                  blurRadius: 5.r,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 2.h),
                )
              ],
            ),
          ),
          SizedBox(width: 5.w),
          Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 35.sp, //
            color: AppColors.headingText,
            shadows: [
              Shadow(
                blurRadius: 5.r,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 2.h),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget subHeading() {
    DateTime now = DateTime.now();
    String currTime =
        "${DateFormat('HH').format(now)}h ${DateFormat('mm').format(now)}m";

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Clock Icon
        Image.asset(
          "assets/clock_home.png",
          height: 14.h,
          width: 14.h,
        ),
        SizedBox(
          width: 2.w, //
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            currTime,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        // Profile Icon
        Image.asset(
          "assets/prof_home.png",
          height: 14.h,
          width: 14.h,
        ),
        SizedBox(
          width: 2.w,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "123",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget midProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 7.h, 0, 0),
              height: 20.h,
              width: 147.w,
              decoration: BoxDecoration(
                color: AppColors.semiBlack,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 46.w,
                  ),
                  Text(
                    "name here, 23",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              height: 55.h, //
              width: 55.h, //
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.semiBlack,
              ),
              child: Center(
                child: Icon(
                  Icons.person_pin,
                  color: AppColors.headingText,
                  size: 50.sp,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(90.w, 40.h, 20.w, 0),
              child: Text(
                "What is your favorite time of the day?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget bottomMicUi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 15.w,
        ),
        const Text(
          "Pick your option. \nSee who has a similar mind.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 70.w,
        ),
        Image.asset(
          "assets/mic_icon.png",
          height: 47.h,
          width: 47.w,
        ),
        SizedBox(
          width: 5.w,
        ),
        Image.asset(
          "assets/arrow.png",
          height: 47.h,
          width: 47.w,
        ),
      ],
    );
  }

  int? _isSelected;

  final List<String> _options = ['A', 'B', 'C', 'D'];
  final List<String> _titles = [
    'The peace in the early mornings',
    'The magical golden hours',
    'Wind-down time after dinners',
    'The serenity past midnight'
  ];
}
