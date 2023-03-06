import 'dart:io';

import 'package:florence_navigator/home.dart';
import 'package:flutter/material.dart';
import 'package:opentourguide/opentourguide.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<bool> isOnboarded() async {
  return await File(
          p.join((await getApplicationSupportDirectory()).path, "onboarded"))
      .exists();
}

Future<void> markOnboarded() async {
  await File(p.join((await getApplicationSupportDirectory()).path, "onboarded"))
      .create(recursive: true);
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: _onPageChanged,
          children: [
            _Welcome(next: _nextPage),
            _GpsPermission(next: _nextPage),
            _Ready(next: _done),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int newPage) {
    if (_currentPage == 1 && newPage == 2) {
      // leaving the second page
      requestGpsPermissions(context);
    }

    _currentPage = newPage;
  }

  void _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  Future<void> _done() async {
    await markOnboarded();
    if (!mounted) return;

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome({
    super.key,
    required this.next,
  });

  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 12.0,
        bottom: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                type: MaterialType.card,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  child: Image.asset(
                    "assets/scmap.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
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
              onPressed: next,
              child: Text(
                "Let's go",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GpsPermission extends StatelessWidget {
  const _GpsPermission({
    super.key,
    required this.next,
  });

  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 12.0,
        bottom: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                type: MaterialType.card,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  child: Image.asset(
                    "assets/satellite.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
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
              onPressed: next,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.secondary),
              ),
              child: Text(
                "Enable GPS",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Ready extends StatelessWidget {
  const _Ready({
    super.key,
    required this.next,
  });

  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 12.0,
        bottom: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                type: MaterialType.card,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  child: Image.asset(
                    "assets/florenceconv.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
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
              onPressed: next,
              child: Text(
                "View tours",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
