import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:orange_ui/common/common_ui.dart';
import 'package:orange_ui/common/dashboard_top_bar.dart';
import 'package:orange_ui/generated/l10n.dart';
import 'package:orange_ui/model/chat_and_live_stream/chat.dart';
import 'package:orange_ui/screen/message_screen/message_screen_view_model.dart';
import 'package:orange_ui/screen/message_screen/widgets/user_card.dart';
import 'package:orange_ui/utils/color_res.dart';
import 'package:orange_ui/utils/font_res.dart';
import 'package:stacked/stacked.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

enum FilterOption { all, unread, read }

class _MessageScreenState extends State<MessageScreen> {
  FilterOption _selectedFilter = FilterOption.all;

  final List<String> names = [
    'Trendyshop',
    'ringring',
    '쥬얼리파크',
    '베비베비',
    '무료탑탑',
    '파티파티',
    '비키니파티',
    '비키니파티',
    '비키니파티',
  ];

  // Sample data
  final List<Map<String, dynamic>> _messages = [
    {'title': 'Message 1', 'isRead': true},
    {'title': 'Message 2', 'isRead': false},
    {'title': 'Message 3', 'isRead': true},
    {'title': 'Message 4', 'isRead': false},
  ];

  void _selectFilter(FilterOption option) {
    setState(() {
      _selectedFilter = option;
    });
  }

  List<Map<String, dynamic>> _getFilteredMessages() {
    switch (_selectedFilter) {
      case FilterOption.unread:
        return _messages.where((msg) => !msg['isRead']).toList();
      case FilterOption.read:
        return _messages.where((msg) => msg['isRead']).toList();
      default:
        return _messages;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageScreenViewModel>.reactive(
      onViewModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => MessageScreenViewModel(),
      builder: (context, model, child) {
        return Container(
          color: ColorRes.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    const SizedBox(width: 22),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                            'assets/icons/new/arrow_back.svg')),
                    const SizedBox(width: 28),
                    const Text(
                      'Inbox',
                      style: TextStyle(
                        color: ColorRes.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/new/search.svg'),
                    const SizedBox(width: 18),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  '팔로잉 셀러',
                  style: TextStyle(
                    color: ColorRes.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 11),

                SizedBox(
                  height: 73,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return FollowersCard(
                          isLive: index.isOdd ? false : true,
                          name: names[index],
                        );
                      }),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFilterButton("All", FilterOption.all),
                    const SizedBox(width: 8),
                    _buildFilterButton("Unread", FilterOption.unread),
                    const SizedBox(width: 8),
                    _buildFilterButton("Read", FilterOption.read),
                  ],
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    itemCount: _getFilteredMessages().length,
                    // itemCount: model.userList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // Conversation conversation = model.userList[index];
                      // ChatUser? chatUser = conversation.user;
                      return InkWell(
                        onTap: () {
                          // model.onUserTap(conversation);
                        },
                        onLongPress: () {
                          // model.onLongPress(conversation);
                        },
                        child: const UserCard(
                          name: '신디봉봉',
                          age: '33',
                          msg: '감사합니다. 늘 저희와 함께 해주셔서 감사할따름입니다.',
                          time: '33',
                          image: '',
                          newMsg: true,
                          tickMark: false,
                        ),
                      );
                    },
                  ),
                ),
                // if (model.isLoading)
                //   Expanded(child: CommonUI.lottieWidget())
                // else
                //   Expanded(
                //     child: model.userList.isEmpty
                //         ? Center(
                //             child: Text(
                //               S.of(context).noData,
                //               style: const TextStyle(
                //                   color: ColorRes.darkGrey9,
                //                   fontFamily: FontRes.semiBold,
                //                   fontSize: 17),
                //             ),
                //           )
                //         : ListView.builder(
                //             padding: const EdgeInsets.symmetric(horizontal: 9),
                //             itemCount: model.userList.length,
                //             physics: const BouncingScrollPhysics(),
                //             itemBuilder: (context, index) {
                //               Conversation conversation = model.userList[index];
                //               ChatUser? chatUser = conversation.user;
                //               return InkWell(
                //                 onTap: () {
                //                   model.onUserTap(conversation);
                //                 },
                //                 onLongPress: () {
                //                   model.onLongPress(conversation);
                //                 },
                //                 child: UserCard(
                //                   name: chatUser?.username ?? '',
                //                   age: chatUser?.age ?? '',
                //                   msg: conversation.lastMsg!.isEmpty ? '' : conversation.lastMsg,
                //                   time: conversation.time.toString(),
                //                   image: chatUser?.image ?? '',
                //                   newMsg: chatUser?.isNewMsg ?? false,
                //                   tickMark: chatUser?.isHost,
                //                 ),
                //               );
                //             },
                //           ),
                //   ),
                // const SizedBox(
                //   height: 10,
                // ),
                // if (model.bannerAd != null)
                //   Container(
                //     alignment: Alignment.center,
                //     width: model.bannerAd?.size.width.toDouble(),
                //     height: model.bannerAd?.size.height.toDouble(),
                //     child: AdWidget(ad: model.bannerAd!),
                //   ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterButton(String label, FilterOption option) {
    final isSelected = _selectedFilter == option;
    return GestureDetector(
      onTap: () => _selectFilter(option),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FollowersCard extends StatelessWidget {
  const FollowersCard({
    Key? key,
    required this.isLive,
    required this.name,
  }) : super(key: key);

  final bool isLive;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/new/rings.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.blue, width: 1.5),
              ),
              margin: const EdgeInsets.only(right: 16),
            ),
            isLive
                ? Positioned(
                    bottom: -10,
                    right: 20,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF3920),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorRes.white,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: const Center(
                        child: Text(
                          'Live',
                          style: TextStyle(
                            color: ColorRes.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          '   $name',
          style: const TextStyle(
              fontSize: 10, color: ColorRes.black, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
