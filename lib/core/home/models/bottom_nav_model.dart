import 'package:task_schedule/constants/app_images.dart';

class BottomNav {
  final int index;
  final String? icon;
  final String? activeIcon;

  BottomNav({
    required this.index,
    this.icon,
    this.activeIcon,
  });
}

class BottomNavs {
  static List<BottomNav> all = [
    BottomNav(index: 1, icon: AppImages.category),
    BottomNav(
        index: 2, icon: AppImages.folder, activeIcon: AppImages.folderFilled),
    BottomNav(index: 3),
    BottomNav(
        index: 4,
        icon: AppImages.calendar,
        activeIcon: AppImages.calendarFilled),
    BottomNav(index: 5, icon: AppImages.profile),
  ];
}
