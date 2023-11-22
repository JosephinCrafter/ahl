# Simple powershell script for automating build and deploy in the [avant_premiere] channel.

flutter build web --release
firebase hosting:channel:deploy avant_premiere