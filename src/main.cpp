
/**
 * Created by K. Suwatchai (Mobizt)
 *
 * Email: k_suwatchai@hotmail.com
 *
 * Github: https://github.com/mobizt/Firebase-ESP-Client
 *
 * Copyright (c) 2023 mobizt
 *
 */

// This example shows how to patch or update a document in a document collection. This operation required Email/password, custom or OAUth2.0 authentication.

#include <Arduino.h>
#if defined(ESP32) || defined(ARDUINO_RASPBERRY_PI_PICO_W)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif


#include <Firebase_ESP_Client.h>

// Provide the token generation process info.
#include <addons/TokenHelper.h>

/* 1. Define the WiFi credentials */
#define WIFI_SSID "marcnetz"
#define WIFI_PASSWORD "lasselinneakerstinmarc"

/* 2. Define the API Key */
#define API_KEY "AIzaSyCvU7gOOGdpyvlfB3pZWSoApqxxMRvIi78"

/* 3. Define the project ID */
#define FIREBASE_PROJECT_ID "park-pilot-e16f3"


// aa is the collection id, bb is the document id.
String documentPath = "box_status/3mBJPGy2jssw2jSKPl6E";

String path = "fields/box_status/booleanValue";

/*  Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "fhoeneise@gmail.com"
#define USER_PASSWORD "123Vorbei"

#include <Wire.h>
#define TRIG_PIN 23 // ESP32 pin GIOP23 connected to Ultrasonic Sensor's TRIG pin
#define ECHO_PIN 22 // ESP32 pin GIOP22 connected to Ultrasonic Sensor's ECHO pin

float duration_us, distance_cm;

float sendDataPrevMillis;
String range = ""; 
bool ultSen;

// Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;
FirebaseJson content;

unsigned long dataMillis = 0;
int count = 0;

bool taskcomplete = false;

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
WiFiMulti multi;
#endif


void senddata(){
  if (Firebase.ready())
    {
      
      content.set(path, ultSen);

      if(Firebase.Firestore.patchDocument(&fbdo, FIREBASE_PROJECT_ID, "", documentPath.c_str(), content.raw(), "box_status")){
        Serial.printf("ok\n%s\n\n", fbdo.payload().c_str());
        return;
      }else{
        Serial.println(fbdo.errorReason());
      }
    }
}

void setup()
{

    Serial.begin(115200);

#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
    multi.addAP(WIFI_SSID, WIFI_PASSWORD);
    multi.run();
#else
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
#endif

    Serial.print("Connecting to Wi-Fi");
    unsigned long ms = millis();
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.print(".");
        delay(300);
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
        if (millis() - ms > 10000)
            break;
#endif
    }
    Serial.println();
    Serial.print("Connected with IP: ");
    Serial.println(WiFi.localIP());
    Serial.println();

    Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

    /* Assign the api key (required) */
    config.api_key = API_KEY;

    /* Assign the user sign in credentials */
    auth.user.email = USER_EMAIL;
    auth.user.password = USER_PASSWORD;

    // The WiFi credentials are required for Pico W
    // due to it does not have reconnect feature.
#if defined(ARDUINO_RASPBERRY_PI_PICO_W)
    config.wifi.clearAP();
    config.wifi.addAP(WIFI_SSID, WIFI_PASSWORD);
#endif

    /* Assign the callback function for the long running token generation task */
    config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h

#if defined(ESP8266)
    // In ESP8266 required for BearSSL rx/tx buffer for large data handle, increase Rx size as needed.
    fbdo.setBSSLBufferSize(2048 /* Rx buffer size in bytes from 512 - 16384 */, 2048 /* Tx buffer size in bytes from 512 - 16384 */);
#endif

    // Limit the size of response payload to be collected in FirebaseData
    fbdo.setResponseSize(2048);

    Firebase.begin(&config, &auth);

    Firebase.reconnectWiFi(true);




    // ultrasonic
      // configure the trigger pin to output mode
    pinMode(TRIG_PIN, OUTPUT);
    // configure the echo pin to input mode
    pinMode(ECHO_PIN, INPUT);
    // power 
  Serial.println(F("ESP-Ultrasonic\n\n")); 
}

void loop()
{
    ultSen = false;
    Serial.println(ultSen);
    // Firebase.ready() should be called repeatedly to handle authentication tasks.
    // generate 10-microsecond pulse to TRIG pin
    digitalWrite(TRIG_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN, LOW);

    // measure duration of pulse from ECHO pin
    duration_us = pulseIn(ECHO_PIN, HIGH);

    // calculate the distance
    distance_cm = 0.017 * duration_us;

    // print the value to Serial Monitor
    Serial.print("distance: ");
    Serial.print(distance_cm);
    Serial.println(" cm");
    range = distance_cm;
    if(distance_cm<50&& (millis() - sendDataPrevMillis > 15000 || sendDataPrevMillis == 0)){
      ultSen = true;
      sendDataPrevMillis = millis();
      senddata();
      Serial.println(ultSen);
    } else if (distance_cm>140&& (millis() - sendDataPrevMillis > 15000 || sendDataPrevMillis == 0)){
      ultSen = false;
      sendDataPrevMillis = millis();
      senddata();
      Serial.println(ultSen);
    }
    Serial.println(ultSen);
}