import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../../../utils/config/constants.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../widgets/section_title_with_subtitle.dart';
import '../widgets/contact_widgets/contact_rotation_card.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Entry.opacity(
          duration: Constants.smallDelay,
          child: Column(
            children: [
              Entry.all(
                child: Column(
                  spacing: 50.0,
                  children: [
                    _buildSectionTitle(),
                    _buildSubTitle(theme, context),
                    ContactRotationCard(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubTitle(ThemeData theme, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "Then, I'd love to hear from you!",
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: context.isMobile ? 16.0 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return SectionTitleWithSubtitle(
      backgroundText: "Ready to get\n Conversation\n started?",
      foregroundText: "",
      subtitle: "GOOD IDEA!",
    );
  }
}
