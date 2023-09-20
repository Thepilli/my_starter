// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/app/app_constants.dart';
import 'package:starter_kit/pages/animate_page/animation_trigger.dart';
import 'package:starter_kit/pages/animate_page/slidein.dart';

class AnimatePage extends ConsumerWidget {
  const AnimatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool animate = ref.watch(triggerProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => ref.read(triggerProvider.notifier).switcher()),
      body: Center(
        child: SlideAmination(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Image.asset(ImagePath.avatar)],
          ),
        ),
      ),
    );
  }
}
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () => ref.read(triggerProvider.notifier).switcher()),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             FadeInLeft(animate: animate, child: const Square()),
//             FadeInUp(animate: animate, child: const Square()),
//             FadeInDown(animate: animate, child: const Square()),
//             FadeInRight(animate: animate, child: const Square()),
//             ShakeY(
//               from: 100,
//               duration: const Duration(seconds: 5),
//               infinite: true,
//               child: const Square(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Square extends StatelessWidget {
  const Square({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      height: 30,
      width: 30,
    );
  }
}

 // Shakey
