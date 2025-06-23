import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';

import '../../../utils/config/constants.dart';
import '../../../widgets/custom_rich_text.dart';
import '../widgets/contact_widgets/contact_rotation_card.dart';
import '../widgets/section_title_with_subtitle.dart';

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
                    CustomRichText(
                      theme: theme,
                      context: context,
                      text: "Then, I'd love to hear from you!",
                    ),
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

  Widget _buildSectionTitle() {
    return SectionTitleWithSubtitle(
      backgroundText: "Ready to get\n Conversation\n started?",
      foregroundText: "",
      subtitle: "GOOD IDEA!",
    );
  }
}
