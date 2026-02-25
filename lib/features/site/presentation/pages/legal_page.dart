import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:kyrgyz_tili_web_site/core/constants/app_constants.dart';
import 'package:kyrgyz_tili_web_site/features/site/domain/entities/site_locale.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/controllers/site_controller.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/widgets/language_switch.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({
    super.key,
    required this.controller,
    required this.locale,
    required this.isPrivacy,
  });

  final SiteController controller;
  final SiteLocale locale;
  final bool isPrivacy;

  @override
  Widget build(BuildContext context) {
    final content = controller.contentForLocale(locale);
    final title = isPrivacy ? content.privacyTitle : content.termsTitle;
    final documentText = isPrivacy ? content.privacyText : content.termsText;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1E8), Color(0xFFFFF6FB), Color(0xFFE8F6FF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 980),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 12,
                    spacing: 12,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: [
                          IconButton.filledTonal(
                            onPressed: () => context.go(
                              '/?lang=${SiteController.localeQueryValue(locale)}',
                            ),
                            icon: const Icon(Icons.arrow_back),
                          ),
                          Text(
                            AppConstants.appName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      LanguageSwitch(
                        label: content.languageLabel,
                        value: locale,
                        onChanged: (newLocale) {
                          controller.setLocale(newLocale);
                          final nextPath = isPrivacy ? '/privacy' : '/terms';
                          context.go(
                            '$nextPath?lang=${SiteController.localeQueryValue(newLocale)}',
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF8F68), Color(0xFFFA4F26)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: MarkdownBody(
                      data: documentText,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet(
                        h1: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF0F0F14),
                            ),
                        h2: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF15151B),
                            ),
                        h3: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF15151B),
                            ),
                        p: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF20202A),
                              height: 1.55,
                            ),
                        listBullet: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF15151B),
                            ),
                        blockSpacing: 16,
                        horizontalRuleDecoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFDDDEE4)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
