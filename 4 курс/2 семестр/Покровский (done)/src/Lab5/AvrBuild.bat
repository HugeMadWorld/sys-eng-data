@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "c:\Temp\Lab5_test\labels.tmp" -fI -W+ie -C V2E -o "c:\Temp\Lab5_test\Lab5_test.hex" -d "c:\Temp\Lab5_test\Lab5_test.obj" -e "c:\Temp\Lab5_test\Lab5_test.eep" -m "c:\Temp\Lab5_test\Lab5_test.map" "c:\Temp\Lab5_test\Lab5_test.asm"
