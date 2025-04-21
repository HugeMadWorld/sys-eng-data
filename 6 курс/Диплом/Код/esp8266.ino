#include <ESP8266WiFi.h>

#include <WiFiClient.h>

#include <ESP8266WebServer.h>

#include <ESP8266mDNS.h>

const char * ssid = "Wi-fi name";
const char * password = "password";
char mq2Value[];
char mq7Value[];
char fireValue[];
char tempValue[];
String alarmState;
String alarmStatus;
WiFiServer server(80);

void setup() {
  Serial.begin(9600);
  delay(10);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("WiFi connected");
  Serial.println("Server started");
  Serial.print("Use this URL to connect: ");
  Serial.print("http:
    Serial.print(WiFi.localIP()); Serial.println("/");
  }
}

void loop() {
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
  Serial.println("new client");
  String request = client.readStringUntil('\r');
  Serial.println(request);
  client.flush();
  if (request.indexOf("/SYS=ON") != -1) {
    digitalWrite(sendPin, LOW)
  }
  if (request.indexOf("/SYS=OFF") != -1) {
    digitalWrite(sendPin, HIGH)
  }

  serialRequest();
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/> <meta charset=\"utf-8\"><title>System info</title><style>button{color:red;padding: 10px 27px;}</style></head>");
  client.println("<h1 style=\"text-align: center;font-family: Open sans;font-weight: 100;font-size: 20px;\">Інформаційна система протипожежної безпеки</h1><div>");
  if (alarmState == "ON") {
    client.println("<div style=\"text-align: center;width: 98px;color:white;border: 5px solid #fff;padding: 10px 80px;background-color: #43a209;margin: 0 auto;\">Система ввімкнена</div>");
  } else if (alarmState == "OFF") {
    client.println("<div style=\"text-align: center;width: 98px;color:white;border: 5px solid #fff;padding: 10px 80px;background-color: #ec1212;margin: 0 auto;\">Система вимкнена</div>");
  }
  if (alarmStatus == "FINE") {
    client.println("<div style=\"text-align: center;width: 98px;color:white;border: 5px solid #fff;padding: 10px 80px;background-color: #43a209;margin: 0 auto;\">Загроз немає</div>");
  } else if (alarmStatus == "ERROR") {
    client.println("<div style=\"text-align: center;width: 180px;color:white;border: 5px solid #fff;padding: 10px 38px;background-color: #ff8000;margin: 0 auto;\">Деякі датчики спрацювали, можливе хибне спрацювання</div>");
  } else if (alarmStatus == "DANGER") {
    client.println("<div style=\"text-align: center;width: 98px;color:white;border: 5px solid #fff;padding: 10px 80px;background-color: #ec1212;margin: 0 auto;\">Увага! Пожежа!</div>");
  }
  client.println("<p><center>Показники:</center>");
  client.println("<br>");
  client.println("<p><center>Датчик диму: ");
  client.println(mq2Value);
  client.println(" ppm</center>");
  client.println("<p><center>Датчик вуглекислого газу: ");
  client.println(mq7Value);
  client.println(" ppm</center>");
  client.println("<p><center>Датчик вогню: ");
  client.println(fireValue);
  client.println("</center>");
  client.println("<p><center>Датчик температури: ");
  client.println(tempValue);
  client.println("&deg;C </center>");
  client.println("<br>");
  client.println("<center> Керування системою: </center>");
  client.println("<div style=\"text-align: center;margin: 5px 0px;\"> <a href=\"/SYS=ON\"><button>Увімнути</button></a>&nbsp;<a href=\"/SYS=OFF\"><button>Вимнути</button></a></div>");
  client.println("</html>");
  delay(1);
  Serial.println("Client disconnected");
}

void serialRequest() {
  char fullRequest[6];
  String string;
  if (Serial.available()) {
    string = Serial.readString();
    string.toCharArray(fullRequest, 8);
    if (fullRequest[0] == '0') {
      alarmState = "ON";
    } else if (fullRequest[0] == '1') {
      alarmState = "OFF";
    }
    mq2Value = fullRequest[1];
    mq7Value = fullRequest[2];
    fireValue = fullRequest[3];
    temperature = fullRequest[4];
    if (fullRequest[5] == '0') {
      alarmState = "FINE";
    } else if (fullRequest[5] == '1') {
      alarmState = "ERROR";
    } else if (fullRequest[5] == '2') {
      alarmState = "DANGER";
    }
  }
}