## Follow steps to run ANDROID

- Run terminal `npm install rn-paytabs --save`
- Run terminal `react-native link rn-paytabs`
- Append the following lines to `android/settings.gradle`:
  	```
  	include ':rn-paytabs'
  	project(':rn-paytabs').projectDir = new File(rootProject.projectDir, 	'../node_modules/rn-paytabs/android')
	include ':paytabs-android-SDK-v2.5'
    project(':paytabs-android-SDK-v2.5').projectDir = new File(rootProject.projectDir,  '../node_modules/rn-paytabs/android/paytabs-android-SDK-v2.5')
  	```
- If you have issue with okhttp or okio modules:
    ```
	configurations {
        all*.exclude group: 'com.squareup.okhttp3', module: 'okhttp'
        all*.exclude group: 'com.squareup.okio', module: 'okio'
    }
	```
- Enjoy!
