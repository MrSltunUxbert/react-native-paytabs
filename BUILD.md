#### Android
Sample/android/app/build.gradle

    configurations {
        all*.exclude group: 'com.squareup.okhttp3', module: 'okhttp'
        all*.exclude group: 'com.squareup.okio', module: 'okio'
    }

Sample/android/settings.gradle

    rootProject.name = 'sample'
    include ':rn-paytabs'
    project(':rn-paytabs').projectDir = new File(rootProject.projectDir, '../node_modules/rn-paytabs/android')
    include ':paytabs-android-SDK-v2.5'
    project(':paytabs-android-SDK-v2.5').projectDir = new File(rootProject.projectDir, '../node_modules/rn-paytabs/android/paytabs-android-SDK-v2.5')
    include ':app'

Sample/android/app/src/main/AndroidManifest.xml

    tools:replace="android:allowBackup"

Sample

`$ react-native link`

#### IOS
#### Windows