import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webapp/component/component.dart';
import 'package:flutter_webapp/config/config.dart';
import 'package:flutter_webapp/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WhoAreWeDetailPage extends StatelessWidget {
  const WhoAreWeDetailPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => ResponsiveViewMobile(
        child: WhoWeAreDetailDesk(
          child: child,
        ),
      ),
      desktop: (BuildContext context) => ResponsiveViewDesktop(
        child: WhoWeAreDetailDesk(
          child: child,
        ),
      ),
      tablet: (BuildContext context) => ResponsiveViewMobile(
        child: WhoWeAreDetailDesk(
          child: child,
        ),
      ),
    );
  }
}

class WhoWeAreDetailDesk extends StatefulWidget {
  const WhoWeAreDetailDesk({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<WhoWeAreDetailDesk> createState() => _WhoWeAreDetailDeskState();
}

class _WhoWeAreDetailDeskState extends State<WhoWeAreDetailDesk> {
  int maxValue = 4;
  int minValue = 0;
  late int currentId;

  String getCurrentId(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    final RegExp idRegExp = RegExp(r'detail/(\d+)');
    final Match? match = idRegExp.firstMatch(location);
    if (match != null && match.groupCount > 0) {
      return match.group(1)!;
    }
    return '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentId = int.parse(getCurrentId(context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingUtils.extraLarge, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (currentId > minValue) {
                      setState(() {
                        currentId--;
                      });
                    } else {
                      setState(() {
                        currentId = maxValue;
                      });
                    }
                    ItemDetailsRoute(id: currentId.toString()).replace(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 10.sp, color: Colors.lightBlueAccent),
                ),
                IconButton(
                  onPressed: () {
                    if (currentId < maxValue) {
                      setState(() {
                        currentId++;
                      });
                    } else{
                      setState(() {
                        currentId = minValue;
                      });
                    }
                    ItemDetailsRoute(id: currentId.toString()).replace(context);
                  },
                  icon: Icon(Icons.arrow_forward_ios, size: 10.sp, color: Colors.lightBlueAccent),
                ),
              ],
            ),
            Expanded(child: widget.child),
          ],
        ),
      ),
    );
  }
}
