#include <SoftwareSerial.h> //підключаємо бібліотеку для програмного Rx Tx
SoftwareSerial mySerial(2, 3); // RX, TX

//бібліотеки для роботи з смс і дзвінками
#include "sms.h"
#include "call.h"

//об'єкти класу для роботи з смс і дзвінками
SMSGSM sms;
CallGSM call;

bool alarmState = false;//стан сигналізації: true - ввімк, false - вимк
bool flaggas = false;
bool flagfire = false;
const int GasPin = A5; //пін для сенсора газу
int GasValue = 0; //змінна для зберігання стану датчика газу
const int FirePin = A4; //пін для датчика вогню
int FireValue = 0; //змінна для зберігання стану датчика вогню
const int buzzer = 8; //пін для п'єзовипромінювача
const int ledPin = 10;//пін для led
const int resetgsm = 9;//пін для resetgsm

char nomer[] = "+380123456789";//номер абонента
const String AlarmOffCommand = "0";//Команда зняття з охорони
const String AlarmOnCommand = "1";//Команда постановки на охорону 
const char smsOgon[] = "UVAHA! SPRATSIUVANNIA DATCHYKA VOGNIU!";
const char smsGas[] = "UVAHA! SPRATSIUVANNIA DATCHYKA GAZU!";
const char smsOn[] = "POSTANOVKA NA OKHORONU!";
const char smsOff[] = "ZNIATO Z OKHORONY!";
const int SmsBufferSize = 160;// Розмір буфера SMS-повідомлення
const int sensorThres = 600;//Поріг зпрацювання датчика


void setup() 
{
  pinMode(buzzer, OUTPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(resetgsm, OUTPUT);
  pinMode(FirePin, INPUT);
  pinMode(GasPin, INPUT);
  mySerial.begin(115200);//швидкість порта
  delay(2000);//час на ініціалізацію модуля
  mySerial.println("AT");//чи є відповідь від модема
  delay(100);
  if (!mySerial.find("OK"))//якщо ні-ресет
  {
    digitalWrite(resetgsm, HIGH);
    delay(1000);
    digitalWrite(resetgsm, LOW);
  }
  delay(2000);//потрібно дочекатися включення модему і з'єднання з мережею
  while(1)//чекаємо підключення модему до мережі
  { 
        mySerial.println("AT+COPS?");
        if (mySerial.find("+COPS: 0")) break;
  }
  
  mySerial.println("AT+CMGF=1"); //режим кодування СМС - звичайний (для англ.)
  delay(100);
  mySerial.println("AT+CSCS=\"GSM\""); //режим кодування тексту
  delay(100);
}
 
void loop() 
{
  CheckSms();
  CheckSensor();
  delay(3000);
}

void CheckSensor()
{
  GasValue = analogRead(GasPin);//Зчитуємо значення з датчика газа
  if ((GasValue >= sensorThres) && flaggas==false && alarmState==true)
  {
  	digitalWrite(ledPin, HIGH);
    tone(buzzer, 2780);//Сирена pin freq
    sms.SendSMS(nomer, smsGas);//Відправляємо SMS-повідомлення про знаходження газу
    flaggas=true;
  }
  
  FireValue = analogRead(FirePin);//Зчитуємо значення з датчика вогню
  if ((FireValue >= 100) && flagfire==false && alarmState==true)
  {
  	digitalWrite(ledPin, HIGH);
    tone(buzzer, 2780);//Сирена pin freq
    sms.SendSMS(nomer, smsOgon);//Відправляємо SMS-повідомлення про знаходження вогню
    flagfire=true;
  }

}

void CheckSms()//Перевіряємо, чи прийшло SMS-повідомлення
{
  char receivedSms = sms.IsSMSPresent(SMS_UNREAD);//Перевіряємо непрочитанні SMS-повідомлення 
  if (receivedSms)//Якщо є непрочитані SMS-повідомлення, то... 
  {
    String smsContent = GetSmsContent(receivedSms);//Отримуємо вміст непрочитаного SMS-повідомлення     
    if (smsContent == AlarmOffCommand)//Вимикаємо сигналізацію, якщо прийшла команда вимкнення
    {
	    noTone(buzzer);//Вимикаємо п'єзолемент
	    digitalWrite(ledPin, LOW);
      sms.SendSMS(nomer, smsOff);//Відправляємо SMS-повідомлення про вимкнення сигналізації
      alarmState = false;
	    flaggas = false;
	    flagfire = false;
    }
    else if (smsContent == AlarmOnCommand)//Вмикаємо сигналізацію, якщо прийшла команда ввімкнення
    {
	    noTone(buzzer);//Вимикаємо п'єзолемент
	    digitalWrite(ledPin, LOW);
      sms.SendSMS(nomer, smsOn);//Відправляємо SMS-повідомлення про ввімкнення сигналізації
      alarmState = true; 
	    flaggas = false;
	    flagfire = false;
    } 
    sms.DeleteSMS(receivedSms);//Видаляємо SMS-повідомлення з SIM-карти
  }
}

String GetSmsContent(char receivedSms)//Отримуємо вміст SMS-повідомлення
{
	char smsBuffer[SmsBufferSize];
	sms.GetSMS(receivedSms, nomer, smsBuffer, sizeof(smsBuffer)); 
	
	return String(smsBuffer); 
}
