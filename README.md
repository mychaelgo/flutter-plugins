# CACHET Flutter plugins

This repo contains the source code for Flutter first-party plugins developed by developers at the [Copenhagen Center for Health Technology (CACHET)](http://www.cachet.dk/) at The Technical University of Denmark.
Check the `packages` directory for all plugins.

Flutter plugins enable access to platform-specific APIs using a platform channel. 
For more information about plugins, and how to use them, see
[https://flutter.io/platform-plugins/](https://flutter.io/platform-plugins/).

## Plugins
These are the available plugins in this repository.

| Plugin | Description | Android | iOS |    Pub    | 
|--------|-------------|:-------:|:---:|:---------:|
| [screen_state](./packages/screen_state) | Track screen state changes | ✔️ | ❌ | [![pub package](https://img.shields.io/pub/v/screen_state.svg)](https://pub.dartlang.org/packages/screen_state) |
| [light](./packages/light) | Track light sensor readings | ✔️ | ❌ |  [![pub package](https://img.shields.io/pub/v/light.svg)](https://pub.dartlang.org/packages/light) |
| [pedometer](./packages/pedometer) | Track step count |  ✔️ | ✔️ | [![pub package](https://img.shields.io/pub/v/pedometer.svg)](https://pub.dartlang.org/packages/pedometer) |
| [noise_meter](./packages/noise_meter) | Read noise level in Decibel | ✔️ | coming  | [![pub package](https://img.shields.io/pub/v/noise_meter.svg)](https://pub.dartlang.org/packages/noise_meter) |
| [app_usage](./packages/app_usage) | Track usage of all applications on phone. | ✔️ | ❌  | [![pub package](https://img.shields.io/pub/v/app_usage.svg)](https://pub.dartlang.org/packages/app_usage) |
| [weather](./packages/weather) | Get current weather, as well as forecasting using the OpenWeatherMap API. | ✔️ | ✔️  | [![pub package](https://img.shields.io/pub/v/weather.svg)](https://pub.dartlang.org/packages/weather) |
| [notifications](./packages/notifications) | Track device notifications. | ✔️ | ❌  | [![pub package](https://img.shields.io/pub/v/notifications.svg)](https://pub.dartlang.org/packages/notifications) |
| [movisens_flutter](./packages/movisens_flutter) | Movisens sensor communication. | ✔️ | ❌  | [![pub package](https://img.shields.io/pub/v/movisens_flutter.svg)](https://pub.dartlang.org/packages/movisens_flutter) |
| [esense](./packages/esense) | eSense ear sensor plugin. | ✔️ | ❌  | [![pub package](https://img.shields.io/pub/v/esense.svg)](https://pub.dartlang.org/packages/esense) |

## Issues

Please check existing issues and file any new issues, bugs, or feature requests in the [flutter-plugin issue list](https://github.com/cph-cachet/flutter-plugins/issues).

## Contributing

If you wish to contribute a new plugin to the Flutter ecosystem, please
see the documentation for [developing packages](https://flutter.io/developing-packages/) and
[platform channels](https://flutter.io/platform-channels/). You can store
your plugin source code in any GitHub repository (the present repo is only
intended for plugins developed by the core CARP team). Once your plugin
is ready you can [publish](https://flutter.io/developing-packages/#publish)
to the [pub repository](https://pub.dartlang.org/).

If you wish to contribute a change to any of the existing plugins in this repo,
please review our [contribution guide](https://github.com/cph-cachet/flutter-plugins/CONTRIBUTING.md),
and send a [pull request](https://github.com/cph-cachet/flutter-plugins/pulls).

