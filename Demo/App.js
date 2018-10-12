/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Button} from 'react-native';
import RNPaytabs from 'rn-paytabs';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {

  onPressPay(){
    RNPaytabs.start({
      "pt_merchant_email": "",
      "pt_secret_key": "",//Add your Secret Key Here
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
      "pt_postal_code_shipping": "00973", //Put Country Phone code if Postal
      "pt_color": "#3a33ff",
      "pt_theme_light": false
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
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>To get started, edit App.js</Text>
        <Text style={styles.instructions}>{instructions}</Text>
        <Button
          onPress={this.onPressPay}
          title="Pay now"
          color="#c00"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
