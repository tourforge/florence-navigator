import 'package:flutter/material.dart';
import 'package:opentourguide/opentourguide.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, required this.finish});

  final void Function() finish;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = HelpSlidesController();

  @override
  Widget build(BuildContext context) {
    return HelpSlidesScreen(
      controller: _controller,
      onDone: widget.finish,
      slides: [
        HelpSlide(
          image: Image.asset(
            "assets/florenceconv.jpg",
            fit: BoxFit.cover,
          ),
          children: [
            Text(
              "Welcome to\nFlorence Navigator!",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              "Get ready to learn more about Florence, South Carolina and its history "
              "as this app takes you on guided driving and walking tours around the area.",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 48.0,
              ),
              child: ElevatedButton(
                onPressed: _controller.nextSlide,
                child: Text(
                  "Let's go",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
          ],
        ),
        HelpSlide(
          onSlideLeave: () {
            requestGpsPermissions(context);
          },
          image: Image.asset(
            "assets/satellite.jpg",
            fit: BoxFit.cover,
          ),
          children: [
            Text(
              "How it works",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              "Once you've started a tour, Florence Navigator will use your phone's "
              "GPS to play a narration when you approach each tour stop. Make sure "
              "GPS is enabled for this to work.",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 48.0,
              ),
              child: ElevatedButton(
                onPressed: _controller.nextSlide,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.secondary),
                ),
                child: Text(
                  "Enable GPS",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
              ),
            ),
          ],
        ),
        HelpSlide(
          image: Image.asset(
            "assets/scmap.jpg",
            fit: BoxFit.cover,
          ),
          children: [
            Text(
              "You're all set",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              "Just tap on a tour in the list on the next screen to get a preview, "
              "and don't forget to download the tour before it's time to start!",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 48.0,
              ),
              child: ElevatedButton(
                onPressed: _controller.finish,
                child: Text(
                  "View tours",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
