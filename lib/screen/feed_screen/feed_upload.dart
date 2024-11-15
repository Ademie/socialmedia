import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_res.dart';
import 'widget/capsule_button.dart';

class UploadFeed extends StatefulWidget {
  const UploadFeed({Key? key}) : super(key: key);

  @override
  State<UploadFeed> createState() => _UploadFeedState();
}

class _UploadFeedState extends State<UploadFeed> {
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

  void _onTapOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                  '게시물 작성',
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF5271FF),
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: const Center(
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
              ],
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      UploadTypeButton(
                        icon: 'assets/icons/new/Feed_Icon.svg',
                        text: '사진',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      UploadTypeButton(
                        text: '동영상',
                        icon: 'assets/icons/new/Movie_Icon.svg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 21),
                  TextFormField(
                    maxLines: 9,
                    maxLength: 200,
                    decoration: InputDecoration(
                      hintText: '내용을 입력하세요 ( 하단 카테고리  반드시 설정해주세요)',
                      hintStyle: const TextStyle(
                        color: Color(0xFF979797),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    '카테고리',
                    style: TextStyle(
                        color: Color(0xFF666D80),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
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
                      }).toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CapsuleButtonList extends StatelessWidget {
  final List<String> items;
  final Function(String) onItemTap;

  const CapsuleButtonList({
    Key? key,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TagsCapsuleButton(
            text: items[index],
            onTap: () => onItemTap(items[index]),
          );
        },
      ),
    );
  }
}

class UploadTypeButton extends StatelessWidget {
  const UploadTypeButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 11),
              Text(
                text,
                style: const TextStyle(
                  color: ColorRes.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
