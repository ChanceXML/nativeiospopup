# nativeiospopup
A lightweight Haxe library designed for **Lime** and **OpenFL** projects to trigger native iOS alerts and alarms. This library is built to be version-aware; it automatically uses UIAlertController for modern iOS versions (8.0+) and falls back to the legacy UIAlertView for older environments (iOS 2.0 through 7.x).
## Features
 * **Version Adaptive:** Uses the appropriate iOS API based on the firmware running on the device.
 * **Scene-Aware:** Handles window management for iOS 13+ (UIScene) and legacy keyWindow management.
 * **Zero Dependencies:** Direct Objective-C++ bindings for minimal overhead.
 * **Thread Safe:** Automatically dispatches UI updates to the main iOS thread to prevent crashes.
## Installation
You can install this library directly from GitHub using haxelib:
```bash
haxelib git nativeiospopup https://github.com/ChanceXML/nativeiospopup.git

```
## Setup
Add the library to your Project.xml or application.xml file. It is recommended to wrap it in an ios check to ensure it doesn't attempt to compile on other platforms.
```xml
<haxelib name="nativeiospopup" if="ios" />

```
## Usage
Import the class and call the static show method. You can provide a title, a message, and a custom label for the dismiss button.
```haxe
import nativeiospopup.NativePopup;

class Main {
    public function new() {
        // Simple usage
        NativePopup.show("System Alert", "This is a native iOS popup.");

        // Custom button label
        NativePopup.show("Error", "Could not load asset.", "Retry");
    }
}

```
## Compatibility
 * **Modern iOS:** Full support for iPhone/iPad on iOS 8 through iOS 17+.
 * **Legacy iOS:** Compatible with legacy ports and emulation (e.g., iOS 2.x and above) via UIAlertView fallback.
## License
This project is licensed under the MIT License - see the LICENSE file for details.
