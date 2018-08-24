
# react-native-paytabs

## Getting started

`$ npm install react-native-paytabs --save`

### Mostly automatic installation

`$ react-native link react-native-paytabs`

### Manual installation


#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNPaytabsPackage;` to the imports at the top of the file
  - Add `new RNPaytabsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-paytabs'
  	project(':react-native-paytabs').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-paytabs/android')
	include ':paytabs-android-SDK-v2.5'
    project(':paytabs-android-SDK-v2.5').projectDir = new File(rootProject.projectDir,  '../node_modules/react-native-paytabs/android/paytabs-android-SDK-v2.5')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-paytabs')
  	```
4. If you have issue with okhttp or okio modules:
    ```
	configurations {
        all*.exclude group: 'com.squareup.okhttp3', module: 'okhttp'
        all*.exclude group: 'com.squareup.okio', module: 'okio'
    }
	```

## Usage
```javascript
import RNPaytabs from 'react-native-paytabs';

// TODO: What to do with the module?
RNPaytabs;
```

## Next

#### [TODO] iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-paytabs` and add `RNPaytabs.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPaytabs.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### [TODO] Windows
[ReactWindows](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNPaytabs.sln` in `node_modules/react-native-paytabs/windows/RNPaytabs.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Paytabs.RNPaytabs;` to the usings at the top of the file
  - Add `new RNPaytabsPackage()` to the `List<IReactPackage>` returned by the `Packages` method
  