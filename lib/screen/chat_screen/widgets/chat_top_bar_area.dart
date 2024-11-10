import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orange_ui/common/common_ui.dart';
import 'package:orange_ui/model/chat_and_live_stream/chat.dart';
import 'package:orange_ui/utils/app_res.dart';
import 'package:orange_ui/utils/asset_res.dart';
import 'package:orange_ui/utils/color_res.dart';
import 'package:orange_ui/utils/font_res.dart';

class ChatTopBarArea extends StatelessWidget {
  final Conversation? conversation;
  final Function(String value) onMoreBtnTap;
  final String blockUnblock;
  final VoidCallback onUserTap;
  final FocusNode msgFocusNode;

  const ChatTopBarArea(
      {Key? key,
      required this.conversation,
      required this.onMoreBtnTap,
      required this.blockUnblock,
      required this.onUserTap,
      required this.msgFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 18, 23, 18),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/new/arrow_back.svg')),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: '${conversation?.user?.image}',
                    cacheKey: '${conversation?.user?.image}',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Image.asset('assets/images/new/userdp.png');
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: onUserTap,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          conversation?.user?.username != null
                              ? '${conversation?.user?.username} '.capitalize ??
                                  'No name'
                              : ' ',
                          style: const TextStyle(
                            color: Color(0xFF17181C),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: FontRes.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFECF8F0),
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF309C86),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Online',
                                style: TextStyle(
                                  color: Color(0xFF309C86),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    onMoreBtnTap(value);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  itemBuilder: (BuildContext context) {
                    msgFocusNode.unfocus();
                    return {blockUnblock, AppRes.report}.map(
                      (String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      },
                    ).toList();
                  },
                  child: Image.asset(
                    AssetRes.moreHorizontal,
                    height: 27,
                    width: 27,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            width: Get.width,
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5.5),
            color: ColorRes.grey2,
          ),
        ],
      ),
    );
  }
}
