abstract class AppAssets {
  AppAssets._();

  static AppIcons get icons => AppIcons();

  static AppImages get images => AppImages();
}

abstract class AssetsFolder {
  final String basePath;

  AssetsFolder(this.basePath);
}

class AppIcons extends AssetsFolder {
  AppIcons() : super('assets/icons');

  String get home => '$basePath/ic-home.svg';
  String get document => '$basePath/ic-document.svg';
  String get bag => '$basePath/ic-bag.svg';
  String get profile => '$basePath/ic-profile.svg';

  String get homeActive => '$basePath/ic-home-filled.svg';
  String get documentActive => '$basePath/ic-document-filled.svg';
  String get bagActive => '$basePath/ic-bag-filled.svg';
  String get profileActive => '$basePath/ic-profile-filled.svg';

  String get notification => '$basePath/ic-notification.svg';
  String get scan => '$basePath/ic-scan.svg';
  String get search => '$basePath/ic-search.svg';
}

class AppImages extends AssetsFolder {
  AppImages() : super('assets/images');

  String get welcomeBg => '$basePath/welcome-background.png';
  String get walk1 => '$basePath/walkthrough-1.png';
  String get walk2 => '$basePath/walkthrough-2.png';
  String get walk3 => '$basePath/walkthrough-3.png';

  String get userImage => '$basePath/user.png';
  String get offer => '$basePath/offer.png';

  String get categorySabzavot => '$basePath/sabzavot.png';
  String get categoryUn => '$basePath/un.png';
  String get categoryDon => '$basePath/don.png';
  String get categoryMeat => '$basePath/meat.png';
  String get categoryPotato => '$basePath/potato.png';
  String get categoryMilk => '$basePath/milk.png';
  String get categoryApple => '$basePath/apple.png';
  String get categoryOthers => '$basePath/other.png';

  String get productTomato => '$basePath/tomato.png';
  String get productMeat => '$basePath/frozen-meat.png';

  String get acceptedOrder => '$basePath/accepted-order.png';
  String get completedOrder => '$basePath/completed-order.png';
  String get rejectedOrder => '$basePath/rejected-order.png';
}
