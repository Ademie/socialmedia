// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:orange_ui/common/common_ui.dart';
// import 'package:orange_ui/screen/live_grid_screen/live_grid_screen_view_model.dart';
// import 'package:orange_ui/screen/live_grid_screen/widgets/custom_grid_view.dart';
// import 'package:orange_ui/screen/live_grid_screen/widgets/live_grid_top_area.dart';
// import 'package:orange_ui/utils/color_res.dart';
// import 'package:stacked/stacked.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_res.dart';
import '../feed_screen/feed_screen.dart';
import '../live_stream_application_screen/live_stream_application_screen.dart';
import 'canceled_list.dart';

class LiveGridScreen extends StatefulWidget {
  const LiveGridScreen({Key? key}) : super(key: key);

  @override
  State<LiveGridScreen> createState() => _LiveGridScreenState();
}

class _LiveGridScreenState extends State<LiveGridScreen> {
  final List<String> images = [
    'assets/images/new/mask.png',
    'assets/images/new/mask2.png',
    'assets/images/new/mask3.png',
  ];
  final List<String> items = [
    'assets/images/new/item1.png',
    'assets/images/new/item2.png',
    'assets/images/new/item3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: SafeArea(
          child: Column(children: [
            const SizedBox(height: 24),
            Row(
              children: [
                const SizedBox(width: 22),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/new/arrow_back.svg')),
                const SizedBox(width: 28),
                const Text(
                  "Live",
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const LiveStreamApplicationScreen();
                      },
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Text(
                        '+  Live',
                        style: TextStyle(
                            color: ColorRes.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SvgPicture.asset('assets/icons/new/search.svg'),
                const SizedBox(width: 18),
              ],
            ),
            const SizedBox(height: 16),
            CapsuleButtonList(
              items: const ['전체', '팔로잉', '인기라이브', '베스트 100', '추천'],
              onItemTap: (val) {},
            ),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xff5271ff).withOpacity(0.19),
              padding: const EdgeInsets.only(left: 16, top: 7.5, bottom: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '베스트 셀러 실시간 라이브',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF676767),
                    ),
                  ),
                  const SizedBox(height: 8.5),
                  ActiveLive(images: images),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CanceledList();
                        },
                      ));
                    },
                    child: ItemList(items: items[index]));
              },
            ),
          ]),
        ));
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final String items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 66,
            height: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(items),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trendyshop warehouse clearnce 1+1',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF202226),
                  ),
                ),
                const SizedBox(height: 11),
                const Text(
                  'Tredyshop',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF838383),
                  ),
                ),
                const SizedBox(height: 11),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/new/seen.svg'),
                    const SizedBox(width: 4),
                    const Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF17181C),
                      ),
                    ),
                    const SizedBox(width: 11.63),
                    SvgPicture.asset('assets/icons/new/users-group.svg'),
                    const SizedBox(width: 3),
                    const Text(
                      '3.0 K',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF17181C),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '36:30',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5271FF),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(19),
                            bottomLeft: Radius.circular(19)),
                        color: Color(0xFF5271FF),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.circle_sharp,
                            color: Colors.white,
                            size: 4,
                          ),
                          SizedBox(width: 3),
                          Text(
                            '패션의류',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ActiveLive extends StatelessWidget {
  const ActiveLive({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // padding: const EdgeInsets.only(left: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            width: 130,
            height: 135,
            decoration: BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorRes.lightGrey,
              ),
              image: DecorationImage(
                image: AssetImage(
                  images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4765),
                    borderRadius: BorderRadius.circular(80),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 3,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 17,
                        width: 21,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/new/userdp.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 3.7),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Trendyshop',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '78명 시청중',
                            style: TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.w600,
                              color: ColorRes.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  'Trend Shop Warehouse\nClearance 1+1',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 7),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class LiveGridScreen extends StatelessWidget {
//   const LiveGridScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<LiveGridScreenViewModel>.reactive(
//       onViewModelReady: (model) {
//         model.init();
//       },
//       viewModelBuilder: () => LiveGridScreenViewModel(),
//       builder: (context, model, child) {
//         return Scaffold(
//           backgroundColor: ColorRes.white,
//           body: Column(
//             children: [
//               LiveGridTopArea(
//                 onBackBtnTap: model.onBackBtnTap,
//                 onGoLiveTap: model.goLiveBtnClick,
//                 userData: model.userData,
//               ),
//               if (!model.isLoading)
//                 CustomGridView(
//                   userData: model.liveStreamUsers,
//                   onImageTap: model.onLiveStreamProfileTap,
//                 )
//               else
//                 Expanded(
//                   child: CommonUI.lottieWidget(),
//                 ),
//               const SizedBox(
//                 height: 10,
//               ),
//               if (model.bannerAd != null)
//                 Container(
//                   alignment: Alignment.center,
//                   width: model.bannerAd?.size.width.toDouble(),
//                   height: model.bannerAd?.size.height.toDouble(),
//                   child: AdWidget(ad: model.bannerAd!),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
