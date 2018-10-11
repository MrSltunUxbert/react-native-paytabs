# Build issues

  - Clear watchman watches: `watchman watch-del-all`.
  - Delete the `node_modules` folder: `rm -rf node_modules && npm install`.
  - Reset Metro Bundler cache: `rm -rf /tmp/metro-bundler-cache-*` or `npm start -- --reset-cache`.
  - Remove haste cache: `rm -rf /tmp/haste-map-react-native-packager-*`.
  - watchman `watch-del-all` then `react-native start --reset-cache`



  ### IF you have this issue:
   `<React/RCTLog.h> <React/RCTBridge.h> are not found`

  https://github.com/facebook/react-native/issues/12042#issuecomment-275025960

  Try the following:
  - Clean (cmd+shift+K)
  - Build core React - select React as the scheme in Xcode and build it (cmd+B)
  - Build the library that is failing (e.g. RCTText).
  - Build your app.
