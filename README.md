
# rn-paytabs [![Beta](https://img.shields.io/badge/rn--paytabs-Beta-yellow.svg)](https://badge.fury.io/js/rn-paytabs) [![npm version](https://badge.fury.io/js/rn-paytabs.svg)](https://badge.fury.io/js/rn-paytabs)
## Unofficial react native wrapper for paytabs Native SDK

## Getting started

`$ npm install rn-paytabs --save`

### Manual installation

#### Android

Please check [ANDROID.md](docs/ANDROID.md) to help you build with android.

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNPaytabsPackage;` to the imports at the top of the file
  - Add `new RNPaytabsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':rn-paytabs'
  	project(':rn-paytabs').projectDir = new File(rootProject.projectDir, 	'../node_modules/rn-paytabs/android')
	include ':paytabs-android-SDK-v2.5'
    project(':paytabs-android-SDK-v2.5').projectDir = new File(rootProject.projectDir,  '../node_modules/rn-paytabs/android/paytabs-android-SDK-v2.5')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':rn-paytabs')
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
import RNPaytabs from 'rn-paytabs';

RNPaytabs.start({
  "pt_merchant_email": "",
  "pt_secret_key": "",// Add your Secret Key Here
  "pt_transaction_title": "Mr. John Doe",
  "pt_amount": "1.0",
  "pt_currency_code": "BHD",
  "pt_shared_prefs_name": "myapp_shared",
  "pt_customer_email": "test@example.com",
  "pt_customer_phone_number": "+97333109781",
  "pt_order_id": "1234567",
  "pt_product_name": "Tomato",
  "pt_timeout_in_seconds": "300", //Optional
  "pt_address_billing": "Flat 1 Building 123 Road 2345",
  "pt_city_billing": "Juffair",
  "pt_state_billing": "Manama",
  "pt_country_billing": "BHR",
  "pt_postal_code_billing": "00973", //Put Country Phone code if Postal code not available '00973'//
  "pt_address_shipping": "Flat 1 Building 123 Road 2345",
  "pt_city_shipping": "Juffair",
  "pt_state_shipping": "Manama",
  "pt_country_shipping": "BHR",
  "pt_postal_code_shipping": "00973" //Put Country Phone code if Postal
}, (response) => {
  // Callback for success & fail.

  // { pt_token_customer_email: '',pt_token: '',pt_token_customer_password: '', pt_transaction_id: '123456',pt_response_code: '100' }

  RNPaytabs.log("on Response Payment");
  // Response Code: 100 successful otherwise fail
  if (response.pt_response_code == '100')
    RNPaytabs.log("Transaction Id: " + response.pt_transaction_id);
  else
    RNPaytabs.log("Otherwise Response: " + response.pt_response_code);

  // Tokenization
  //RNPaytabs.log(response.pt_token_customer_email);
  //RNPaytabs.log(response.pt_token_customer_password);
  //RNPaytabs.log(response.pt_token);

});
```

## Next

#### [Beta] iOS

Please check [IOS.md](docs/IOS.md) to help you build with android.

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `rn-paytabs` and add `RNPaytabs.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPaytabs.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### [TODO] Windows
[ReactWindows](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNPaytabs.sln` in `node_modules/rn-paytabs/windows/RNPaytabs.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Paytabs.RNPaytabs;` to the usings at the top of the file
  - Add `new RNPaytabsPackage()` to the `List<IReactPackage>` returned by the `Packages` method
