import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orange_ui/generated/l10n.dart';
import 'package:orange_ui/utils/asset_res.dart';
import 'package:orange_ui/utils/color_res.dart';

class BottomInputBar extends StatelessWidget {
  final TextEditingController msgController;
  final VoidCallback onShareBtnTap;
  final VoidCallback onAddBtnTap;
  final VoidCallback onCameraTap;
  final FocusNode msgFocusNode;

  const BottomInputBar({
    Key? key,
    required this.msgController,
    required this.onShareBtnTap,
    required this.onAddBtnTap,
    required this.onCameraTap,
    required this.msgFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.only(bottom: 5),
      width: Get.width,
      color: ColorRes.white,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: msgController,
                  decoration: InputDecoration(
                    labelText: '메세지를 입력하세요',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/new/camera.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/new/file.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.5),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF5271FF),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
