# Simple powershell script for automating build and deploy in the [avant_premiere] channel.

# flutter build web --release
# firebase hosting:channel:deploy avant_premiere

D:\dev\flutter\bin\cache\dart-sdk\bin\dart.exe --disable-dart-dev D:\dev\flutter\bin\cache\dart-sdk\bin\snapshots\frontend_server.dart.snapshot --sdk-root D:\dev\flutter\bin\cache\flutter_web_sdk/ --incremental --target=dartdevc --experimental-emit-debug-metadata -DFLUTTER_WEB_AUTO_DETECT=true -DFLUTTER_WEB_CANVASKIT_URL=https://www.gstatic.com/flutter-canvaskit/3f3e560236539b7e2702f5ac790b2a4691b32d49/ --output-dill C:\Users\JOSEPH~1\AppData\Local\Temp\flutter_tools.a5149c9d\flutter_tool.b6134d75\app.dill --packages D:\Projects\ahl\.dart_tool\package_config.json -Ddart.vm.profile=false -Ddart.vm.product=false --enable-asserts --track-widget-creation --filesystem-root C:\Users\JOSEPH~1\AppData\Local\Temp\flutter_tools.a5149c9d\flutter_tools.e8b57183 --filesystem-scheme org-dartlang-app --initialize-from-dill build\a072907fec955372e484c180f3334617.cache.dill.track.dill --platform file:///D:/dev/flutter/bin/cache/flutter_web_sdk/kernel/ddc_outline_sound.dill --verbosity=error --sound-null-safety