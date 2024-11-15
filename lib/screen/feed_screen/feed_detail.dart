import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'feed_screen.dart';

class UsersPost extends StatefulWidget {
  const UsersPost({Key? key}) : super(key: key);

  @override
  State<UsersPost> createState() => _UsersPostState();
}

class _UsersPostState extends State<UsersPost> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.insert(
            0, _commentController.text); // Adds new comment
        _commentController.clear(); // Clear the input field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            const OAppBar(
              justTitle: false,
              text: 'Feed',
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 23),
              children: [
                UserFeedCard(
                  onCommentTap: () => _showCommentBottomSheet(context),
                ),
                const SizedBox(height: 22),
                UserFeedCard(
                  onCommentTap: () => _showCommentBottomSheet(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 1 / 1.2,
          child: DraggableScrollableSheet(
            initialChildSize: 1.0,
            maxChildSize: 1.0,
            minChildSize: 1.0,
            expand: true,
            builder: (context, scrollController) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 34),
                    const Center(
                        child: Text(
                      '댓글',
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                    const SizedBox(height: 15),
                    const Divider(thickness: 2),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 1,
                        // itemCount: _comments.length,
                        padding: const EdgeInsets.only(top: 15),
                        itemBuilder: (context, index) {
                          return const RepliedBox();
                          // return ListTile(
                          //   title: Text(_comments[index]),
                          // );
                        },
                      ),
                    ),
                    const Divider(thickness: 2),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 46,
                          width: 46,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/new/userpickImage.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFormField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              labelText: '댓글입력..',
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
                        const SizedBox(width: 8),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF5271FF),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(19),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )
                        // IconButton(
                        //   icon: const Icon(Icons.send),
                        //   onPressed: _addComment,
                        // ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class RepliedBox extends StatelessWidget {
  const RepliedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/new/userpickImage.png'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              children: [
                Text(
                  '아이마마',
                  style: TextStyle(
                    color: Color(0xFF1F2232),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '. 1 mins ago  .',
                  style: TextStyle(
                    color: Color(0xFF8697AC),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(child: SvgPicture.asset('assets/icons/new/trash.svg'))
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          '너무 이뻐요',
          style: TextStyle(
            color: Color(0xff666D80),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class UserFeedCard extends StatelessWidget {
  const UserFeedCard({
    Key? key,
    required this.onCommentTap,
  }) : super(key: key);
  final void Function()? onCommentTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F9FA),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/new/userdp.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Trendyshop',
                  style: TextStyle(
                    color: Color(0xFF1F2232),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  '.  1 mins ago',
                  style: TextStyle(
                    color: Color(0xFF8697AC),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_horiz_outlined),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/new/rings_big.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            text: 'Trendyshop',
            style: TextStyle(
              color: Color(0xFF1F2232),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text:
                    ' 신상 업데이트 공지!! 기다리고 기다리시던 신상이 드디어 오늘 업데이트 됩니다. 오후 8시에 만나요~',
                style: TextStyle(
                  color: Color(0xFF1F2232),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SvgPicture.asset('assets/icons/new/like.svg'),
            const SizedBox(width: 6),
            const Text(
              '349',
              style: TextStyle(
                color: Color(0xFF1F2232),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 17.7),
            InkWell(
                onTap: onCommentTap,
                child: SvgPicture.asset('assets/icons/new/messages.svg')),
            const SizedBox(width: 6),
            const Text(
              '760',
              style: TextStyle(
                color: Color(0xFF1F2232),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/new/export.svg'),
            const SizedBox(width: 20),
            SvgPicture.asset('assets/icons/new/save.svg'),
            const SizedBox(width: 40),
          ],
        )
      ],
    );
  }
}
