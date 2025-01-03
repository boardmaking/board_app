import 'package:board_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin{
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener(){
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '게시판',
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            controller.animateTo(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: '홈'
            ), BottomNavigationBarItem(
                icon: Icon(
                  Icons.border_color_outlined,
                ),
                label: '글'
            ), BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: '프로필'
            ),
          ],
        ),
      child: TabBarView(
        controller: controller,
        children: [
          Center(child: Text('게시판')),
          Center(child: Text('글쓰기')),
          Center(child: Text('프로필')),
        ],
      )
    );
  }
}
