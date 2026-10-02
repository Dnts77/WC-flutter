import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/glass_bar.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const Header({super.key}) extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            AppAssets.patterns.paniniArcHeaderCadastroSvg, 
            fit: .cover,
            alignment: .topCenter,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  AppColors.ink.withValues(alpha: 0.3),
                  AppColors.ink.withValues(alpha: 0.85),
                ]
              )
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: .fromLTRB(AppDimens.paddingHorizontal, 10, AppDimens.paddingHorizontal, 32),
            child: Column(
              children: [
                GlassBar(
                  onBack: (){},
                  title: Text("PASSO 01 / 02", style: AppTextStyle.overline.copyWith(color: AppColors.yellow)),
                  actions: [],
                ),
                FittedBox(
                  fit: .scaleDown,
                  child: Text(
                    'CRIE SUA',
                    style: AppTextStyle.display.copyWith(color: AppColors.white)
                  ),
                ),
                FittedBox(
                  fit: .scaleDown,
                  child: Text(
                    'CONTA OFICIAL',
                    style: AppTextStyle.display.copyWith(color: AppColors.yellow)
                  ),
                ),
                const SizedBox(
                   height: 12,
                ),
                Text(
                  'Monte seu álbum e escolha sua seleção.',
                  style: AppTextStyle.body.copyWith(color: AppColors.white),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}