# Florence Navigator
Florence Navigator is a GPS-guided tour app for Florence, South Carolina based on OpenTourBuilder.

# iOS-specific setup

Before you open the project in Xcode, follow the instructions in the [opentourbuilder/guide](https://github.com/opentourbuilder/guide) repository's README, replacing `example/ios` with `ios` whenever it is referenced in a path.

## Creating Android signed release bundle
Follow this documentation (https://docs.flutter.dev/deployment/android#create-an-upload-keystore). Take note on a couple of things:
1. You may need to install JDK for the generating keystore command to work.
2. It is going to ask a couple of identifying questions, doesn't matter how you answered it.
3. Remember and save the password and the location for the keystore.
4. Insert passwords and keystore location in the `key.properties` file and move it into `android/` directory.
5. You can now create signed bundle by running the following command `flutter build appbundle`.
6. Locate this signed bundle in `build/app/outputs/bundle/release/*.aab`.
7. You may now upload this signed bundle to Google Play Console.
