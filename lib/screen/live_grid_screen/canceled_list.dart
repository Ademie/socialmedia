import 'package:flutter/material.dart';

import '../../utils/color_res.dart';
import '../feed_screen/feed_screen.dart';

class CanceledList extends StatelessWidget {
  const CanceledList({Key? key}) : super(key: key);

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
            text: '구매취소 리스트',
          ),
          const SizedBox(height: 28),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CanceledBox();
              },
            ),
          ),
        ],
      )),
    );
  }
}

class CanceledBox extends StatelessWidget {
  const CanceledBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorRes.lightGrey,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/new/rings.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ringring',
                    style: TextStyle(
                      color: ColorRes.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 33),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CancledTexts(
                    productInfo: '제품명',
                    productName: 'forming gel',
                    width: 18,
                  ),
                  CancledTexts(
                    productInfo: '옵션',
                    productName: '레드',
                    width: 28,
                  ),
                  CancledTexts(
                    productInfo: '수량',
                    productName: '1개',
                    width: 28,
                  ),
                  CancledTexts(
                    productInfo: '금액',
                    productName: '15000',
                    width: 28,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class CancledTexts extends StatelessWidget {
  const CancledTexts({
    Key? key,
    required this.productInfo,
    required this.productName,
    required this.width,
  }) : super(key: key);
  final String productInfo;
  final String productName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productInfo,
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: width),
        Text(
          productName,
          style: const TextStyle(
            color: Color(0xFF212121),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
