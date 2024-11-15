import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange_ui/common/common_fun.dart';
import 'package:orange_ui/common/common_ui.dart';
import 'package:orange_ui/utils/asset_res.dart';
import 'package:orange_ui/utils/color_res.dart';
import 'package:orange_ui/utils/font_res.dart';

class UserCard extends StatelessWidget {
  final String? name;
  final String? age;
  final String? msg;
  final String? time;
  final String? image;
  final bool newMsg;
  final bool? tickMark;

  const UserCard({
    Key? key,
    required this.name,
    required this.age,
    required this.msg,
    required this.time,
    required this.image,
    required this.newMsg,
    required this.tickMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.only(top: 8, right: 12, bottom: 11),
          height: 74,
          width: Get.width,
          decoration: BoxDecoration(
              // color: ColorRes.lightGrey2,
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                bottom: BorderSide(
                  color: ColorRes.lightGrey2,
                  width: 1,
                ),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: '$image',
                  height: 53,
                  width: 53,
                  fit: BoxFit.cover,
                  cacheKey: '$image',
                  errorWidget: (context, url, error) {
                    return CommonUI.profileImagePlaceHolder(
                        name: name, heightWidth: 53);
                  },
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Text(
                                    (name ?? '').capitalize ?? '',
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: Color(0xFF17181C),
                                        fontFamily: FontRes.bold,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: tickMark == true
                                      ? Image.asset(
                                          AssetRes.tickMark,
                                          height: 17.5,
                                          width: 18.33,
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            CommonFun.readTimestamp(
                              double.parse(time ?? ''),
                            ),
                            style: const TextStyle(
                                fontSize: 12, color: ColorRes.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 20,
                            child: Text(
                              '$msg',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF17181C),
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Spacer(),
                          Visibility(
                              visible: newMsg,
                              child: !newMsg
                                  ? const SizedBox()
                                  : const Icon(
                                      Icons.check,
                                      size: 18,
                                      color: Color(0xFF2C7743),
                                    )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
