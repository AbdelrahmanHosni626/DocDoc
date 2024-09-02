import 'package:docdoc/core/utils/assets_manager.dart';
import 'package:docdoc/settings/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class DocDocRoundedPicture extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool hasEditButton;
  final void Function()? onEditButtonTap;

  const DocDocRoundedPicture({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
    required this.hasEditButton,
    this.onEditButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return hasEditButton
        ? SizedBox(
            width: 110.r,
            height: 110.r,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipOval(
                    child: imageUrl == '' || imageUrl == null
                        ? Image.asset(
                            AssetsManager.avatar,
                            fit: BoxFit.contain,
                          )
                        : Image.network(
                            imageUrl!,
                            key: key,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onEditButtonTap,
                    child: Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: const BoxDecoration(
                        color: ColorsManager.mainBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        SolarIconsOutline.pen,
                        size: 10.sp,
                        color: ColorsManager.mainBlue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        : ClipOval(
            child: imageUrl == '' || imageUrl == null
                ? Image.asset(
                    AssetsManager.avatar,
                    width: 100.r,
                    height: 100.r,
                    fit: BoxFit.contain,
                  )
                : Image.network(
                    imageUrl!,
                    key: key,
                    width: width ?? 42.r,
                    height: height ?? 42.r,
                    fit: fit ?? BoxFit.cover,
                  ),
          );
  }
}
