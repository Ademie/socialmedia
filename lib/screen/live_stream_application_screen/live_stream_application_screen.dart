// import 'package:flutter/material.dart';
// import 'package:orange_ui/common/top_bar_area.dart';
// import 'package:orange_ui/generated/l10n.dart';
// import 'package:orange_ui/screen/live_stream_application_screen/widgets/center_area_livestream.dart';
// import 'package:orange_ui/utils/color_res.dart';
// import 'package:stacked/stacked.dart';

// import 'live_stream_application_screen_view_model.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/color_res.dart';
import '../feed_screen/feed_screen.dart';
import '../feed_screen/widget/Odropdown.dart';
import '../feed_screen/widget/capsule_button.dart';

class LiveStreamApplicationScreen extends StatefulWidget {
  const LiveStreamApplicationScreen({Key? key}) : super(key: key);

  @override
  State<LiveStreamApplicationScreen> createState() =>
      _LiveStreamApplicationScreenState();
}

class _LiveStreamApplicationScreenState
    extends State<LiveStreamApplicationScreen> {
  final List<String> _options = [
    "공지",
    "방송일정",
    "신상입고",
    "신상입고",
    "방송예고",
    "패션의류",
    "패션잡화",
    "쥬얼리",
    "뷰티",
    "가구/인테리어",
    "디지털/가전",
    "출산/유아동",
    "스포츠/레저/자동차",
    "생활/주방",
    "식품",
    "반려동물",
    "취미",
    "빈티지/중고"
  ];
  String? _selectedOption;
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;

  void _onTapOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const OAppBar(
              justTitle: false,
              text: 'LIVE Streaming',
            ),
            const SizedBox(height: 25),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '라이브 제목',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666D80),
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF3F3F3),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide.none,
                            )),
                      ),
                      const SizedBox(height: 21),
                      const Text(
                        '라이브 소개 및 공지사항',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666D80),
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF3F3F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        '썸네일 이미지 및 영상', // Mmeans thumbnail image and video
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666D80),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        // OnTap to upload image thumbail
                        height: 46,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Icon(Icons.add, color: Color(0xFF666D80)),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        '카테고리',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666D80),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        children: _options.map((item) {
                          final isSelected = _selectedOption == item;
                          return TagsCapsuleButton(
                            text: item,
                            onTap: () => _onTapOption(item),
                            // isSelected: _selectedOption == item,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdown<String>(
                              title: "방송시간",
                              items: const ["2시간", "32시간", "4시간"],
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomDropdown<String>(
                              title: "시청인원",
                              items: const ["100", "200", "300"],
                              value: selectedValue2,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue2 = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: CustomDropdown<String>(
                          title: "홈 상단노출 광고",
                          items: const ["1시간", "2시간", "3시간"],
                          value: selectedValue3,
                          onChanged: (value) {
                            setState(() {
                              selectedValue3 = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        '지불포인트',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666D80),
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          suffix: Text(
                            'P',
                            style: TextStyle(
                              color: Color(0xFF5271FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF3F3F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 76),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF3920),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '라이브 시작',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 47),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class LiveStreamApplicationScreen extends StatelessWidget {
//   const LiveStreamApplicationScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<LiveStreamApplicationScreenViewModel>.reactive(
//       onViewModelReady: (model) {
//         model.init();
//       },
//       viewModelBuilder: () => LiveStreamApplicationScreenViewModel(),
//       builder: (context, model, child) {
//         return Scaffold(
//           backgroundColor: ColorRes.white,
//           body: Column(
//             children: [
//               TopBarArea(
//                 title: S.current.liveStreamCap,
//                 title2: S.current.application,
//               ),
//               Container(
//                 height: 1,
//                 margin: const EdgeInsets.symmetric(horizontal: 7),
//                 width: MediaQuery.of(context).size.width,
//                 color: ColorRes.grey5,
//               ),
//               CenterAreaLiveStream(
//                 aboutController: model.aboutController,
//                 languageController: model.languageController,
//                 onSubmitTap: model.onSubmitBtnTap,
//                 videoController: model.videoController,
//                 onAddBtnTap: model.onPlusBtnTap,
//                 onRemoveBtnTap: model.onRemoveBtnTap,
//                 onVideoControllerChange: model.onVideoControllerChange,
//                 onVideoChangeBtnTap: model.onVideoChangeBtnTap,
//                 onVideoPlayBtnTap: model.onVideoPlayBtnTap,
//                 onAttachBtnTap: model.onAttachBtnTap,
//                 videoImage: model.videoImageFile,
//                 isVideoAttach: model.isVideoAttach,
//                 controllers: model.socialProfileController,
//                 fieldCount: model.fieldCount,
//                 isAbout: model.isAbout,
//                 isIntroVideo: model.isIntroVideo,
//                 isLanguages: model.isLanguages,
//                 isSocialLink: model.isSocialLink,
//                 aboutFocus: model.aboutFocus,
//                 languageFocus: model.languageFocus,
//                 socialLinkFocus: model.socialLinksFocus,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
