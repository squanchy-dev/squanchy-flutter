#!/usr/bin/env bash

export ANDROID_APP_MODULE_PATH="android/app"
export ANDROID_JSON_PATH="$ANDROID_APP_MODULE_PATH/google-services.json"

export IOS_APP_MODULE_PATH="ios/Runner"
export IOS_PLIST_PATH="$IOS_APP_MODULE_PATH/GoogleService-Info.plist"

if [ ! -e ${ANDROID_JSON_PATH} ]; then
    echo "Writing mock google-services.json file to $ANDROID_JSON_PATH..."

    echo '{
      "project_info": {
        "project_number": "012345678912",
        "firebase_url": "https://squanchy-dev.firebaseio.com",
        "project_id": "squanchy-dev",
        "storage_bucket": "squanchy-dev.appspot.com"
      },
      "client": [
        {
          "client_info": {
            "mobilesdk_app_id": "1:012345678912:android:1337deadbeef",
            "android_client_info": {
              "package_name": "net.squanchy.example"
            }
          },
          "oauth_client": [
            {
              "client_id": "XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com",
              "client_type": 1,
              "android_info": {
                "package_name": "net.squanchy.example",
                "certificate_hash": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
              }
            },
            {
              "client_id": "XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com",
              "client_type": 1,
              "android_info": {
                "package_name": "net.squanchy.example",
                "certificate_hash": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
              }
            },
            {
              "client_id": "XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com",
              "client_type": 3
            },
            {
              "client_id": "XXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com",
              "client_type": 3
            }
          ],
          "api_key": [
            {
              "current_key": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            }
          ],
          "services": {
            "appinvite_service": {
              "status": 1,
              "other_platform_oauth_client": []
            },
            "ads_service": {
              "status": 2
            }
          }
        }
      ],
      "configuration_version": "1"
    }' > ${ANDROID_JSON_PATH}

    echo "Done."
else
    echo "The $ANDROID_JSON_PATH file already exists, skipping..."
fi

if [ ! -e ${IOS_PLIST_PATH} ]; then
    echo "Writing mock GoogleService-Info.plist file to $IOS_PLIST_PATH..."

    echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>AD_UNIT_ID_FOR_BANNER_TEST</key>
	<string>ca-app-pub-0123456789123456/0123456789</string>
	<key>AD_UNIT_ID_FOR_INTERSTITIAL_TEST</key>
	<string>ca-app-pub-0123456789123456/0123456789</string>
	<key>CLIENT_ID</key>
	<string>012345678912-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com</string>
	<key>REVERSED_CLIENT_ID</key>
	<string>com.googleusercontent.apps.012345678912-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</string>
	<key>API_KEY</key>
	<string>XXXXXXXXXXXXXXXXXXXXXXX_X_XXXXXXXXXXXXX</string>
	<key>GCM_SENDER_ID</key>
	<string>012345678912</string>
	<key>PLIST_VERSION</key>
	<string>1</string>
	<key>BUNDLE_ID</key>
	<string>net.squanchy.develop</string>
	<key>PROJECT_ID</key>
	<string>squanchy-dev</string>
	<key>STORAGE_BUCKET</key>
	<string>squanchy-dev.appspot.com</string>
	<key>IS_ADS_ENABLED</key>
	<true></true>
	<key>IS_ANALYTICS_ENABLED</key>
	<false></false>
	<key>IS_APPINVITE_ENABLED</key>
	<false></false>
	<key>IS_GCM_ENABLED</key>
	<true></true>
	<key>IS_SIGNIN_ENABLED</key>
	<true></true>
	<key>GOOGLE_APP_ID</key>
	<string>1:012345678912:ios:XXXXXXXXXXXXXXXX</string>
	<key>DATABASE_URL</key>
	<string>https://squanchy-dev.firebaseio.com</string>
</dict>
</plist>
' > ${IOS_PLIST_PATH}

    echo "Done."
else
    echo "The $IOS_PLIST_PATH file already exists, skipping..."
fi
