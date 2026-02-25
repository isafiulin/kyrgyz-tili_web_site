import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kyrgyz_tili_web_site/core/constants/app_constants.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/controllers/site_controller.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/widgets/language_switch.dart';
import 'package:kyrgyz_tili_web_site/features/site/presentation/widgets/section_card.dart';

class SitePage extends StatefulWidget {
  const SitePage({super.key, required this.controller});

  final SiteController controller;

  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);
  }

  @override
  void didUpdateWidget(covariant SitePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerUpdate);
      widget.controller.addListener(_onControllerUpdate);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.controller.content;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF1E8), Color(0xFFFFF6FB), Color(0xFFE8F6FF)],
          ),
        ),
        child: Stack(
          children: [
            _bubble(
              top: -90,
              left: -30,
              size: 210,
              color: const Color(0xFFFF7043),
            ),
            _bubble(
              top: 90,
              right: -40,
              size: 180,
              color: const Color(0xFFFFD54F),
            ),
            _bubble(
              bottom: -130,
              left: -40,
              size: 280,
              color: const Color(0xFF81D4FA),
            ),
            _bubble(
              bottom: 80,
              right: -30,
              size: 150,
              color: const Color(0xFFCE93D8),
            ),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    children: [
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 12,
                        spacing: 12,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  'assets/site_images/icon.jpeg',
                                  width: 52,
                                  height: 52,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                AppConstants.appName,
                                style: textTheme.titleLarge,
                              ),
                            ],
                          ),
                          LanguageSwitch(
                            label: content.languageLabel,
                            value: widget.controller.locale,
                            onChanged: widget.controller.setLocale,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth >= 900;
                          if (isWide) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: _heroCard(
                                    context,
                                    content.heroTitle,
                                    content.heroSubtitle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 5,
                                  child: AspectRatio(
                                    aspectRatio: 16 / 11,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.asset(
                                        'assets/site_images/hero.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _heroCard(
                                context,
                                content.heroTitle,
                                content.heroSubtitle,
                              ),
                              const SizedBox(height: 14),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  'assets/site_images/hero.jpeg',
                                  fit: BoxFit.cover,
                                  height: 280,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FilledButton.icon(
                            onPressed: widget.controller.openAndroid,
                            icon: const Icon(Icons.android),
                            label: Text(content.storeAndroid),
                          ),
                          FilledButton.icon(
                            onPressed: widget.controller.openIos,
                            icon: const Icon(Icons.phone_iphone),
                            label: Text(content.storeIos),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth >= 900;
                          final cards = [
                            SectionCard(
                              title: content.aboutTitle,
                              body: content.aboutBody,
                            ),
                            SectionCard(
                              title: content.linksTitle,
                              body: content.linksBody,
                              actions: [
                                OutlinedButton(
                                  onPressed: widget.controller.openAndroid,
                                  child: const Text('Google Play'),
                                ),
                                OutlinedButton(
                                  onPressed: widget.controller.openIos,
                                  child: const Text('App Store'),
                                ),
                              ],
                            ),
                            SectionCard(
                              title: content.contactsTitle,
                              body: content.contactsBody,
                              actions: [
                                TextButton.icon(
                                  onPressed: widget.controller.openEmail,
                                  icon: const Icon(Icons.mail_outline),
                                  label: Text(content.contactEmail),
                                ),
                                TextButton.icon(
                                  onPressed: widget.controller.openTelegram,
                                  icon: const Icon(Icons.telegram),
                                  label: Text(content.contactTelegram),
                                ),
                                TextButton.icon(
                                  onPressed: widget.controller.openInstagram,
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  label: Text(content.contactInstagram),
                                ),
                              ],
                            ),
                          ];

                          if (!isWide) {
                            return Column(
                              children: cards
                                  .expand((widget) => [
                                        widget,
                                        const SizedBox(height: 12),
                                      ])
                                  .take(cards.length * 2 - 1)
                                  .toList(),
                            );
                          }

                          return IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(child: cards[0]),
                                const SizedBox(width: 12),
                                Expanded(child: cards[1]),
                                const SizedBox(width: 12),
                                Expanded(child: cards[2]),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      SectionCard(
                        title: content.privacyTitle,
                        body: '',
                        actions: [
                          FilledButton.tonal(
                            onPressed: () => context.go(
                              '/privacy?lang=${SiteController.localeQueryValue(widget.controller.locale)}',
                            ),
                            child: Text(content.openLegalPageLabel),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SectionCard(
                        title: content.termsTitle,
                        body: '',
                        actions: [
                          FilledButton.tonal(
                            onPressed: () => context.go(
                              '/terms?lang=${SiteController.localeQueryValue(widget.controller.locale)}',
                            ),
                            child: Text(content.openLegalPageLabel),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _gallerySection(),
                      const SizedBox(height: 16),
                      Text(
                        '© ${DateTime.now().year} ${AppConstants.appName}. ${content.footer}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroCard(BuildContext context, String title, String subtitle) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8F68), Color(0xFFFA4F26)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.93),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gallerySection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 900;
        final children = [
          _galleryImage('assets/site_images/kg_boy_1.png'),
          _galleryImage('assets/site_images/kg_girl_1.png'),
        ];
        if (wide) {
          return Row(
            children: [
              Expanded(child: children[0]),
              const SizedBox(width: 12),
              Expanded(child: children[1]),
            ],
          );
        }
        return Column(
          children: [
            children[0],
            const SizedBox(height: 12),
            children[1],
          ],
        );
      },
    );
  }

  Widget _galleryImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }

  Widget _bubble({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double size,
    required Color color,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
