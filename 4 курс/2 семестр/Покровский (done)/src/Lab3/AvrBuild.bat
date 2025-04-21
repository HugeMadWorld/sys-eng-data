@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Temp\Lab3_test\labels.tmp" -fI -W+ie -C V2E -o "C:\Temp\Lab3_test\Lab3_test.hex" -d "C:\Temp\Lab3_test\Lab3_test.obj" -e "C:\Temp\Lab3_test\Lab3_test.eep" -m "C:\Temp\Lab3_test\Lab3_test.map" "C:\Temp\Lab3_test\Lab3_test.asm"
