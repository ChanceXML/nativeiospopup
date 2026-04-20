package nativeiospopup;

#if ios
@:buildXml('
<files id="haxe">
    <file name="${haxelib:nativeiospopup}/project/ios/NativePopupObjectiveC.mm" />
</files>
')
@:cppFileCode('extern "C" void showNativeIOSPopup(const char* title, const char* message, const char* buttonLabel);')
#end

class NativePopup {
    /**
     * Shows a native iOS popup.
     * @param title The title of the alert.
     * @param message The description message.
     * @param buttonLabel The text for the dismiss button (Default: "OK").
     */
    public static function show(title:String, message:String, buttonLabel:String = "OK"):Void {
        #if ios
        untyped __cpp__('showNativeIOSPopup({0}.utf8_str(), {1}.utf8_str(), {2}.utf8_str())', title, message, buttonLabel);
        #else
        trace('Native iOS Popup Called - Title: $title | Message: $message');
        #end
    }
}
