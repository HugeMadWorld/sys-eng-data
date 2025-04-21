#include <SoftwareSerial.h>
#include "sms.h"
#include "call.h"
#include "DHT.h"
#include <SoftwareSerial.h>

SoftwareSerial ESPserial(0, 1);
SoftwareSerial mySerial(9, 10);
bool alarmState = false;
bool flaggas = false;
bool flagfire = false;
const int dhtPin = 2;
float tempValue;
const int mq2Pin = A0;
int mq2Value;
const int mq7Pin = A1;
int mq7Value;
const int firePin = A2;
int fireValue;
const int buzzer = 8;
const int greenLedPin = 3;
const int orangeLedPin = 4;
const int redLedPin = 5;
const int resetgsm = 13;
char nomer[] = "+380123456789";
const String alarmOffCommand = "0";
const String alarmOnCommand = "1";
const char smsOn[] = "Увімкнення системи!";
const char smsOff[] = "Вимкнення системи!";
const int smsBufferSize = 160;
const int gasThres = 600;
const int fireThres = 100;
const float tempThres = 28;

SMSGSM sms;
CallGSM call;
DHT dht(dhtPin, DHT22);

//Налаштування послідовного зв'язку між Arduino, GSM та Wi-Fi модулями
void setup() {
  Wire.begin(8);
  Wire.onReceive(receiveEvent);
  Wire.onRequest(requestEvent);
  Serial.begin(9600);
  ESPserial.begin(9600);
  pinMode(buzzer, OUTPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(resetgsm, OUTPUT);
  pinMode(firePin, INPUT);
  pinMode(gasPin, INPUT);
  mySerial.begin(115200);
  delay(2000);
  mySerial.println("AT");
  delay(100);
  if (!mySerial.find("OK")) {
    digitalWrite(resetgsm, HIGH);
    delay(1000);
    digitalWrite(resetgsm, LOW);
  }
  delay(2000);
  while (1) {
    mySerial.println("AT+COPS?");
    if (mySerial.find("+COPS: 0")) break;
  }
  mySerial.println("AT+CMGF=1");
  delay(100);
  mySerial.println("AT+CSCS=\"GSM\"");
  delay(100);
}

//Головна підпрограма
void loop() {
  checkSms(); //Перевіряємо новоприбулі команди з GSM модулю
  readEsp(); //Зчитуємо команди з веб-серверу
  checkSensors(); //Зчитуємо значення датчиків та опрацьовуємо їх
  sendToEsp(); //Відправляємо значення на веб сервер
  delay(5000);
}

//Зчитуємо значення датчиків та опрацьовуємо їх
void checkSensors() {
  mq2Value = analogRead(mq2Pin);
  mq7Value = analogRead(mq7Pin);
  fireValue = analogRead(firePin);
  tempValue = dht.readTemperature();

  if (mq2Value < gasThres && mq7Value < gasThres && fireValue < fireThres && tempValue >= tempThres && alarmState == true && state1 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчика температури. Висока вірогідність хибного спрацювання!");
    state1 = true;
  } else if (mq2Value < gasThres && mq7Value < gasThres && fireValue > fireThres && tempValue < tempThres && alarmState == true && state2 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчика вогню. Висока вірогідність хибного спрацювання!");
    state2 = true;
  } else if (mq2Value < gasThres && mq7Value < gasThres && fireValue > fireThres && tempValue > tempThres && alarmState == true && state3 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків вогню та температури. Вірогідність пожежі 50%");
    state3 = true;
  } else if (mq2Value < gasThres && mq7Value > gasThres && fireValue < fireThres && tempValue < tempThres && alarmState == true && state4 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчика вуглекислого газу. Висока вірогідність хибного спрацювання!");
    state4 = true;
  } else if (mq2Value < gasThres && mq7Value > gasThres && fireValue < fireThres && tempValue > tempThres && alarmState == true && state5 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків вуглекислого газу та температури. Вірогідність пожежі 50%");
    state5 = true;
  } else if (mq2Value < gasThres && mq7Value > gasThres && fireValue > fireThres && tempValue < tempThres && alarmState == true && state6 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків вуглекислого газу та вогню. Вірогідність пожежі 50%");
    state6 = true;
  } else if (mq2Value < gasThres && mq7Value > gasThres && fireValue > fireThres && tempValue > tempThres && alarmState == true && state7 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, HIGH);
    tone(buzzer, 2780);
    sms.sendSMS(nomer, "Спрацювання датчиків вуглекислого газу, вогню та температури. Висока вірогідність пожежи!");
    state7 = true;
  } else if (mq2Value > gasThres && mq7Value < gasThres && fireValue < fireThres && tempValue < tempThres && alarmState == true && state8 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчика диму. Висока вірогідність хибного спрацювання!");
    state8 = true;
  } else if (mq2Value > gasThres && mq7Value < gasThres && fireValue < fireThres && tempValue > tempThres && alarmState == true && state9 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків диму та температури. Вірогідність пожежі 50%");
    state9 = true;
  } else if (mq2Value > gasThres && mq7Value < gasThres && fireValue > fireThres && tempValue < tempThres && alarmState == true && state10 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків диму та вогню. Вірогідність пожежі 50%");
    state10 = true;
  } else if (mq2Value > gasThres && mq7Value < gasThres && fireValue > fireThres && tempValue > tempThres && alarmState == true && state11 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, HIGH);
    tone(buzzer, 2780);
    sms.sendSMS(nomer, "Спрацювання датчиків диму, вогню та температури. Висока вірогідність пожежи!");
    state11 = true;
  } else if (mq2Value > gasThres && mq7Value > gasThres && fireValue < fireThres && tempValue < tempThres && alarmState == true && state12 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, HIGH);
    digitalWrite(redLedPin, LOW);
    sms.sendSMS(nomer, "Спрацювання датчиків диму та вуглекислого газу. Вірогідність пожежі 50%");
    state12 = true;
  } else if (mq2Value > gasThres && mq7Value > gasThres && fireValue < fireThres && tempValue > tempThres && alarmState == true && state13 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, HIGH);
    tone(buzzer, 2780);
    sms.sendSMS(nomer, "Спрацювання датчиків диму, вуглекислого газу та температури. Висока вірогідність пожежи!");
    state13 = true;
  } else if (mq2Value > gasThres && mq7Value > gasThres && fireValue > fireThres && tempValue < tempThres && alarmState == true && state14 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, HIGH);
    tone(buzzer, 2780);
    sms.sendSMS(nomer, "Спрацювання датчиків диму, вуглекислого газу та вогню. Висока вірогідність пожежи!");
    state14 = true;
  } else if (mq2Value > gasThres && mq7Value > gasThres && fireValue > fireThres && tempValue > tempThres && alarmState == true state15 == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, HIGH);
    tone(buzzer, 2780);
    sms.sendSMS(nomer, "Увага! Виявлено пожежу!");
    state15 = true;
  }
  if (mq2Value < gasThres && mq7Value < gasThres && fireValue < fireThres && tempValue < tempThres && alarmState == true) {
    digitalWrite(greenLedPin, HIGH);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, LOW);
    noTone(buzzer);
  } else if (alarmState == false) {
    digitalWrite(greenLedPin, LOW);
    digitalWrite(orangeLedPin, LOW);
    digitalWrite(redLedPin, LOW);
    noTone(buzzer);
  }
}

//Відправляємо значення на веб сервер
void sendToEsp() {
  if (alarmState == true) {
    request[0] = '1';
  } else if (alarmState == false) {
    request[0] = '0';
  }
  request[1] = String(mq2Value);
  request[2] = String(mq7Value);
  request[3] = String(fireValue);
  request[4] = String(tempValue);
  if (mq2Value < gasThres && mq7Value < gasThres && fireValue < fireThres && tempValue < tempThres) {
    request[5] = '0';
  } else if (mq2Value > gasThres || mq7Value > gasThres || fireValue > fireThres || tempValue > tempThres) {
    request[5] = '1';
  } else if (mq2Value > gasThres && mq7Value > gasThres && fireValue > fireThres && tempValue > tempThres) {
    request[5] = '2';
  }
  sendToEsp = request[0] + request[1] + request[2] + request[3] + request[4] + request[5];
  char tempArray[6];
  sendToEsp.toCharArray(tempArray, 6);
  ESPserial.write(tempArray);
}

//Перевіряємо новоприбулі команди з GSM модулю
void checkSms() {
  char receivedSms = sms.IsSMSPresent(SMS_UNREAD);
  if (receivedSms) {
    String smsContent = getSmsContent(receivedSms);
    if (smsContent == alarmOffCommand) {
      sms.sendSMS(nomer, smsOff);
      alarmState = false;
      resetFlags();
    } else if (smsContent == alarmOnCommand) {
      sms.sendSMS(nomer, smsOn);
      alarmState = true;
      resetFlags();
    }
    sms.DeleteSMS(receivedSms);
  }
}

//Отримуємо вміст смс-повідомлень
String getSmsContent(char receivedSms) {
  char smsBuffer[smsBufferSize];
  sms.GetSMS(receivedSms, nomer, smsBuffer, sizeof(smsBuffer));
  return String(smsBuffer);
}

//Cкидання значень датчиків
void resetFlags() {
  noTone(buzzer);
  digitalWrite(greenLedPin, LOW);
  digitalWrite(orangeLedPin, LOW);
  digitalWrite(redLedPin, LOW);
  state1 = false;
  state2 = false;
  state3 = false;
  state4 = false;
  state5 = false;
  state6 = false;
  state7 = false;
  state8 = false;
  state9 = false;
  state10 = false;
  state11 = false;
  state12 = false;
  state13 = false;
  state14 = false;
  state15 = false;
}

//Зчитуємо команди з веб-серверу
void readEsp() {
  char request;
  String string;
  if (ESPserial.available()) {
    string = ESPserial.readString();
    string.toCharArray(request, 1);
    if (request == '0') {
      alarmState = false;
    } else if (request == '1') {
      alarmState = true;
    }
  }
}