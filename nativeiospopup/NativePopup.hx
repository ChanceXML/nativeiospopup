package nativeiospopup;

#if ios
// tells the C++ compiler to expect this function signature during the build
@:cppFileCode('extern "C" void showNativeIOSPopup(const char* title, const char* message, const char* buttonLabel);')
#end

class NativePopup {
    /**
     * shows a native iOS popup.
     * @param title The title of the alert.
     * @param message The description message.
     * @param buttonLabel The text for the dismiss button (Default: "OK").
     */
    public static function show(title:String, message:String, buttonLabel:String = "OK"):Void {
        #if ios
        // convert Haxe strings to const char* using .utf8_str() so C++ can read them
        untyped __cpp__('showNativeIOSPopup({0}.utf8_str(), {1}.utf8_str(), {2}.utf8_str())', title, message, buttonLabel);
        #else
        trace('Native iOS Popup Called - Title: $title | Message: $message');
        #end
    }
}
