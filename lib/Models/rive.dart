import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/riveAssets/icons.riv",
      artboard: "HOME", stateMachineName: "_Interactivity", title: "Home"),
  RiveAsset("assets/riveAssets/icons.riv",
      artboard: "USER", stateMachineName: "USER_Interactivity", title: "Me"),
];

RiveAsset selectedBottomNav = bottomNavs.first;