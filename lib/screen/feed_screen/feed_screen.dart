import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_ui/common/common_ui.dart';
import 'package:orange_ui/common/dashboard_top_bar.dart';
import 'package:orange_ui/screen/feed_screen/feed_screen_view_model.dart';
import 'package:orange_ui/screen/feed_screen/feed_upload.dart';
import 'package:orange_ui/screen/feed_screen/widget/feed_story_bar.dart';
import 'package:orange_ui/screen/post_screen/widget/post_card.dart';
import 'package:orange_ui/utils/color_res.dart';
// import 'package:orange_ui/utils/style_res.datflrt';
import 'package:stacked/stacked.dart';

import 'feed_detail.dart';
import 'widget/capsule_button.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const OAppBar(
              justTitle: true,
              text: 'Feed',
            ),
            const SizedBox(height: 16),
            CapsuleButtonList(
              items: const ['전체', '공지', '방송일정', '신상입고', '패션의류'],
              onItemTap: (val) {},
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '추천 게시물',
                      style: TextStyle(
                        color: Color(0xFF666D80),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            backgroundColor:
                                const Color(0xFFF8F9FA).withOpacity(0.8),
                            image: 'assets/images/new/rings.png',
                            title: 'Trendyshop',
                            dp: 'assets/images/new/userdp.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UsersPost(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 10 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.blueAccent
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 4),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: ColorRes.black,
                        unselectedLabelColor: const Color(0xFF5A6172),
                        indicatorColor: ColorRes.black,
                        indicator: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: const TextStyle(
                          color: ColorRes.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: Color(0xFF5A6172),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: const [
                          Tab(text: "Follow"),
                          Tab(text: "Lasted"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Center(child: Text("Content for Tab 2")),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const CustomCard(
                                  backgroundColor: ColorRes.white,
                                  image: 'assets/images/new/rings.png',
                                  title: '악세마마',
                                  dp: 'assets/images/new/userdp.png',
                                ),
                                const CustomCard(
                                  backgroundColor: ColorRes.white,
                                  image: 'assets/images/new/rings.png',
                                  title: '악세마마',
                                  dp: 'assets/images/new/userdp.png',
                                ),
                                const SizedBox(height: 8),
                                InkWell(
                                  child: Container(
                                    height: 67,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      // color: ColorRes.black,
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/new/ads.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                const SizedBox(height: 5),
                                const CustomCard(
                                  backgroundColor: ColorRes.white,
                                  image: 'assets/images/new/rings.png',
                                  title: '악세마마',
                                  dp: 'assets/images/new/userdp.png',
                                ),
                              ],
                            ),
                          ),

                          const Center(child: Text("Content for Tab 2")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OAppBar extends StatelessWidget {
  const OAppBar({
    Key? key,
    required this.justTitle,
    required this.text,
  }) : super(key: key);
  final bool justTitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        const SizedBox(width: 22),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/icons/new/arrow_back.svg')),
        const SizedBox(width: 28),
        Text(
          text,
          style: const TextStyle(
            color: ColorRes.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        justTitle
            ? InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const UploadFeed();
                    },
                  ));
                },
                child: SvgPicture.asset('assets/icons/new/go_live.svg'))
            : const SizedBox.shrink(),
        const SizedBox(width: 15),
        justTitle
            ? SvgPicture.asset('assets/icons/new/search.svg')
            : const SizedBox.shrink(),
        const SizedBox(width: 18),
      ],
    );
 
 
 
 
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.backgroundColor,
    required this.image,
    required this.title,
    required this.dp,
    this.onTap,
  }) : super(key: key);

  final Color backgroundColor;
  final String image;
  final String title;
  final String dp;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 93,
        // width: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(dp),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Color(0xFF202226),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 3),
                            SvgPicture.asset('assets/icons/new/verified.svg'),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'September 2, 2024, 11:20 PM',
                          style: TextStyle(
                            color: Color(0xFF838383),
                            fontSize: 6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  'Long awaited new product arrived',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Long awaited new product arrived',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Long awaited new product arrived',
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.67),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/new/chats.svg'),
                    const SizedBox(width: 3.25),
                    const Text(
                      '10',
                      style: TextStyle(
                        color: Color(0xFF17181C),
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12.25),
                    SvgPicture.asset('assets/icons/new/heart.svg'),
                    const SizedBox(width: 3.25),
                    const Text(
                      '115',
                      style: TextStyle(
                        color: Color(0xFF17181C),
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 97,
              width: 97,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CapsuleButtonList extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemTap;

  const CapsuleButtonList({
    Key? key,
    required this.items,
    required this.onItemTap,
  }) : super(key: key);

  @override
  State<CapsuleButtonList> createState() => _CapsuleButtonListState();
}

class _CapsuleButtonListState extends State<CapsuleButtonList> {
  int? _selectedIndex;
  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTap(widget.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Set height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return CapsuleButton(
              text: widget.items[index],
              isSelected: _selectedIndex == index,
              onTap: () => _handleTap(index));
        },
      ),
    );
  }
}


// class FeedScreen extends StatelessWidget {
//   const FeedScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<FeedScreenViewModel>.reactive(
//       onViewModelReady: (viewModel) => viewModel.init(),
//       viewModelBuilder: () => FeedScreenViewModel(),
//       builder: (context, model, child) => Scaffold(
//         backgroundColor: ColorRes.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DashboardTopBar(
//                 onNotificationTap: model.onNotificationTap,
//                 onSearchTap: model.onSearchTap,
//                 onLivesBtnClick: model.onLivesBtnClick,
//                 isDating: model.settingAppData?.isDating),
//             Expanded(
//               child: model.isLoading
//                   ? CommonUI.lottieWidget()
//                   : Stack(
//                       children: [
//                         SingleChildScrollView(
//                           controller: model.scrollController,
//                           child: Column(
//                             children: [
//                               FeedStoryBar(model: model),
//                               model.postList.isEmpty
//                                   ? CommonUI.noData()
//                                   : ListView.builder(
//                                       primary: false,
//                                       shrinkWrap: true,
//                                       padding: EdgeInsets.zero,
//                                       itemCount: model.postList.length,
//                                       itemBuilder: (context, index) {
//                                         return PostCard(
//                                           post: model.postList[index],
//                                           model: model,
//                                           postIndex: index,
//                                         );
//                                       },
//                                     ),
//                             ],
//                           ),
//                         ),
//                         model.postList.isEmpty ? CommonUI.noData() : Container()
//                       ],
//                     ),
//             )
//           ],
//         ),
//         floatingActionButton: InkWell(
//           onTap: model.onCreatePost,
//           child: Container(
//             width: 50,
//             height: 50,
//             decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 gradient: StyleRes.linearGradient),
//             child: const Icon(Icons.add_rounded, color: ColorRes.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
