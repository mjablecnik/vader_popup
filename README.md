# Vader Popup

[![Pub Version](https://img.shields.io/pub/v/vader_popup)](https://pub.dev/packages/vader_popup)
[![GitHub License](https://img.shields.io/github/license/mjablecnik/vader_popup)](https://github.com/mjablecnik/vader_popup/blob/main/LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/mjablecnik/vader_popup/build.yml)](https://github.com/mjablecnik/vader_popup/actions)

Vader Popup is a Flutter package for creating customizable popup dialogs and modal windows with ease.

## Features

- Simple modal popup
- Fully customizable popups
- Support for various popup types (info, warning, error, success)
- Support special popup dialogs for: 
    - ask questions
    - show long message 
    - input text message
    - choose from more options

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  vader_popup: ^0.1.0
```

Then run:

```sh
flutter pub get
```

## Usage

### Basic Usage

To show a basic popup dialog:

```dart
PopupDialog().info(
  context: context,
  title: 'Hello, World!',
  message: 'This is a basic popup dialog.',
);
```

To show a basic modal popup:

```dart
PopupModal().show(
  context,
  showCloseButton: true,
  body: Center(
    child: Text("Hello world!"),
  )
);
```

### Customization

Vader Popup allows for extensive customization to fit your needs. You can customize the appearance and behavior of the popups.

#### Example: Custom Popup

```dart
final result = await PopupDialog(
  header: const PopupHeader(
    icon: Icon(Icons.info, color: Colors.blue, size: 70),
    title: PopupText(
      text: "Info dialog",
    ),
  ),
  content: const PopupMessage(
    message: PopupText(text: "Text of info dialog"),
  ),
  buttons: [
    PopupButton(
      label: "Cancel",
      color: Colors.grey.withOpacity(0.4),
      onPressed: () {
        Navigator.of(context).pop("Left button");
      },
    ),
    PopupButton(
      label: "OK",
      color: Colors.blue,
      onPressed: () {
        Navigator.of(context).pop("Right button");
      },
    ),
  ],
).show(context);
print(result);
```

## Popup Types

Vader Popup supports several built-in types of popups:

- `info`
- `success`
- `warning`
- `error`
- `modal`
- `options`
- `question`
- `long message`


## Examples

For more examples see the [examples](https://github.com/mjablecnik/vader_popup/blob/master/example/lib/main.dart) file.


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## Author

👤 **Martin Jablečník**

* Website: [martin-jablecnik.cz](https://www.martin-jablecnik.cz)
* Github: [@mjablecnik](https://github.com/mjablecnik)
* Blog: [dev.to/mjablecnik](https://dev.to/mjablecnik)


## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.patreon.com/mjablecnik">
  <img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>


## 📝 License

Copyright © 2024 [Martin Jablečník](https://github.com/mjablecnik).<br />
This project is licensed under [MIT License](https://github.com/mjablecnik/vader_popup/blob/main/LICENSE).
