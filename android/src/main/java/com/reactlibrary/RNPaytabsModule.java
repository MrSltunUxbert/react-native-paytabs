
package com.reactlibrary;

import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableMapKeySetIterator;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.uimanager.PixelUtil;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;

import paytabs.project.PayTabActivity;

import static android.content.Context.MODE_PRIVATE;


public class RNPaytabsModule extends ReactContextBaseJavaModule implements ActivityEventListener {

    private final ReactApplicationContext reactContext;
    private static int PAYMENT_REQUEST_CODE = 4040;
    private static String PAYTABS_MODULE = "RNPaytabs";

    private Callback mCallback;

    public RNPaytabsModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        this.reactContext.addActivityEventListener(this);
    }

    @Override
    public String getName() {
        return PAYTABS_MODULE;
    }

    @ReactMethod
    public void log(String message) {
        Log.d(PAYTABS_MODULE, message);
    }

    @ReactMethod
    public void start(ReadableMap paymentDetails, final Callback callback) {
        this.mCallback = callback;

        Intent in = new Intent(reactContext, PayTabActivity.class);
        ReadableMapKeySetIterator iterator = paymentDetails.keySetIterator();
        while (iterator.hasNextKey()) {
            String key = iterator.nextKey();
            switch (paymentDetails.getType(key)) {
                case String:
                    in.putExtra(key, paymentDetails.getString(key));
                    break;
            }
        }

        reactContext.startActivityForResult(in, PAYMENT_REQUEST_CODE, new Bundle());
    }

    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        SharedPreferences shared_prefs = reactContext.getSharedPreferences("myapp_shared", MODE_PRIVATE);
        String pt_response_code = shared_prefs.getString("pt_response_code", null);
        String pt_transaction_id = shared_prefs.getString("pt_transaction_id", null);
        String pt_token = shared_prefs.getString("pt_token", null);
        String pt_token_customer_password = shared_prefs.getString("pt_token_customer_password", null);
        String pt_token_customer_email = shared_prefs.getString("pt_token_customer_email", null);

        WritableMap map = Arguments.createMap();
        map.putString("pt_response_code", pt_response_code);
        map.putString("pt_transaction_id", pt_transaction_id);
        map.putString("pt_token", pt_token);
        map.putString("pt_token_customer_password", pt_token_customer_password);
        map.putString("pt_token_customer_email", pt_token_customer_email);
        mCallback.invoke(map);
    }

    @Override
    public void onNewIntent(Intent intent) {

    }
}