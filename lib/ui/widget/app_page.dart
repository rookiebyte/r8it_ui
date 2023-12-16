import 'package:flutter/material.dart';
import 'package:r8it/ui/app_router.dart';

class AppPage extends StatelessWidget {
  final Widget? body;

  const AppPage({
    super.key,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      bottomNavigationBar: Theme(
        data: theme,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: AppRouter.pageIndex(context),
          onTap: (i) => _navigationBarOnTap(i, context),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigation_outlined),
              label: 'navigation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_outlined),
              label: 'add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'person',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'notifications',
            ),
          ],
        ),
      ),
      body: body,
    );
  }
  void _navigationBarOnTap(int index, BuildContext context) {
    switch(index) {
      case 1:
        AppRouter.goNavigationPage(context);
      case 2:
        AppRouter.goAddPage(context);
      case 3:
        AppRouter.goProfilePage(context);
      case 4:
        AppRouter.goNotificationsPage(context);
      default:
        AppRouter.goHomePage(context);
    }
  }
}
