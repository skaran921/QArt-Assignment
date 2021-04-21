import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qart/pages/home_page.dart';
import 'package:qart/pages/products_page.dart';
import 'package:qart/pages/user_account_page.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_sliver_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  final _bottomNavigationBarSelectedIndex = ValueNotifier<int>(0);
  final bool hasBottomNavigationBar;
  final Widget? body;
  final Widget? bottomWidget;
  CustomScaffold(
      {Key? key,
      this.hasBottomNavigationBar = true,
      this.body,
      this.bottomWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverFillRemaining(
              hasScrollBody: true,
              child: !hasBottomNavigationBar
                  ? this.body ?? Container()
                  : ValueListenableBuilder(
                      valueListenable: _bottomNavigationBarSelectedIndex,
                      builder: (context, int value, child) {
                        return value == 0
                            ? HomePage()
                            : value == 1
                                ? ProductsPage()
                                : UserAccountPage();
                      },
                    ))
        ],
      ),
      bottomNavigationBar: !hasBottomNavigationBar
          ? bottomWidget
          : ValueListenableBuilder(
              valueListenable: _bottomNavigationBarSelectedIndex,
              builder: (context, int value, child) {
                return BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  backgroundColor: Color(0xFFF5F5F5),
                  selectedItemColor: Config.textColor.withOpacity(0.8),
                  showSelectedLabels: false,
                  selectedIconTheme: IconThemeData(size: 35),
                  unselectedItemColor: Config.textColor.withOpacity(0.2),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.shoppingBag,
                        ),
                        label: "Products"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.userCircle,
                        ),
                        label: "User"),
                  ],
                  onTap: (index) {
                    _bottomNavigationBarSelectedIndex.value = index;
                  },
                  currentIndex: value,
                );
              }),
    ));
  }
}
