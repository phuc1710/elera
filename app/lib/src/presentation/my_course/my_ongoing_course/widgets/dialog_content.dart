import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../account_setup/fill_your_profile/widgets/information_input.dart';
import '../../../widgets/main_action_ink.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              l10n.courseReviewDialogContent,
              textAlign: TextAlign.center,
              style: textTheme.bodyText2,
            ),
          ),
          RatingBar(
            initialRating: 5,
            itemSize: 30,
            itemPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            onRatingUpdate: (value) {},
            ratingWidget: RatingWidget(
              full: Icon(Icons.star_rounded, color: primaryColor),
              half: Icon(Icons.star_half_rounded, color: primaryColor),
              empty: Icon(Icons.star_outline_rounded, color: primaryColor),
            ),
          ),
          InformationInput(hintText: l10n.review),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: MainActionInk(
                    buttonString: l10n.writeReview,
                    disableShadow: true,
                  ),
                ),
                const SizedBox.square(dimension: 20),
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () => context.router.pop(),
                  child: MainActionInk(
                    buttonString: l10n.cancel,
                    isNotMainAction: true,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
