EESchema Schematic File Version 4
LIBS:atmega328-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "mySensors PIR/BH1750 relay"
Date "2019-01-01"
Rev "1"
Comp "grzegorz@sapijaszko.net"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328-PU U3
U 1 1 5C0E56A2
P 5400 4200
F 0 "U3" H 4756 4246 50  0000 R CNN
F 1 "ATmega328-PU" H 4756 4155 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5400 4200 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 5400 4200 50  0001 C CNN
	1    5400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3600 6700 3600
Wire Wire Line
	6000 3700 6700 3700
Text Label 6700 3600 2    50   ~ 0
XTAL1
Text Label 6700 3700 2    50   ~ 0
XTAL2
$Comp
L Device:C C4
U 1 1 5C0E8EEA
P 4100 3550
F 0 "C4" H 4215 3596 50  0000 L CNN
F 1 "22p" H 4215 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4138 3400 50  0001 C CNN
F 3 "~" H 4100 3550 50  0001 C CNN
	1    4100 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5C0E9CBE
P 3350 3550
F 0 "C2" H 3465 3596 50  0000 L CNN
F 1 "22p" H 3465 3505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3388 3400 50  0001 C CNN
F 3 "~" H 3350 3550 50  0001 C CNN
	1    3350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2800 3350 2950
Connection ~ 3350 3400
Wire Wire Line
	3350 3400 3600 3400
Connection ~ 4100 3400
$Comp
L power:GND #PWR09
U 1 1 5C0EC555
P 4100 3700
F 0 "#PWR09" H 4100 3450 50  0001 C CNN
F 1 "GND" H 4105 3527 50  0000 C CNN
F 2 "" H 4100 3700 50  0001 C CNN
F 3 "" H 4100 3700 50  0001 C CNN
	1    4100 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5C0ED05C
P 3350 3700
F 0 "#PWR05" H 3350 3450 50  0001 C CNN
F 1 "GND" H 3355 3527 50  0000 C CNN
F 2 "" H 3350 3700 50  0001 C CNN
F 3 "" H 3350 3700 50  0001 C CNN
	1    3350 3700
	1    0    0    -1  
$EndComp
Text Label 4100 2850 1    50   ~ 0
XTAL1
Text Label 3350 2800 1    50   ~ 0
XTAL2
Wire Wire Line
	5500 2700 5400 2700
Wire Wire Line
	5400 2700 5400 2150
Wire Wire Line
	5400 2150 5400 2000
$Comp
L power:+5V #PWR014
U 1 1 5C0EE2FC
P 5400 2000
F 0 "#PWR014" H 5400 1850 50  0001 C CNN
F 1 "+5V" H 5415 2173 50  0000 C CNN
F 2 "" H 5400 2000 50  0001 C CNN
F 3 "" H 5400 2000 50  0001 C CNN
	1    5400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C8
U 1 1 5C0EE891
P 5550 2300
F 0 "C8" H 5668 2346 50  0000 L CNN
F 1 "47uF" H 5668 2255 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5588 2150 50  0001 C CNN
F 3 "~" H 5550 2300 50  0001 C CNN
	1    5550 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5C0EF685
P 5550 2450
F 0 "#PWR016" H 5550 2200 50  0001 C CNN
F 1 "GND" H 5555 2277 50  0000 C CNN
F 2 "" H 5550 2450 50  0001 C CNN
F 3 "" H 5550 2450 50  0001 C CNN
	1    5550 2450
	1    0    0    -1  
$EndComp
Connection ~ 5400 2700
Connection ~ 5400 2150
$Comp
L power:GND #PWR015
U 1 1 5C0F1CFF
P 5400 5700
F 0 "#PWR015" H 5400 5450 50  0001 C CNN
F 1 "GND" H 5405 5527 50  0000 C CNN
F 2 "" H 5400 5700 50  0001 C CNN
F 3 "" H 5400 5700 50  0001 C CNN
	1    5400 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-ISP-6 J2
U 1 1 5C0F2C08
P 3650 1500
F 0 "J2" H 3371 1596 50  0000 R CNN
F 1 "AVR-ISP-6" H 3371 1505 50  0000 R CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Vertical" V 3400 1550 50  0001 C CNN
F 3 " ~" H 2375 950 50  0001 C CNN
	1    3650 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C0F6488
P 3550 1900
F 0 "#PWR08" H 3550 1650 50  0001 C CNN
F 1 "GND" H 3555 1727 50  0000 C CNN
F 2 "" H 3550 1900 50  0001 C CNN
F 3 "" H 3550 1900 50  0001 C CNN
	1    3550 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5C0F68E4
P 3550 1000
F 0 "#PWR07" H 3550 850 50  0001 C CNN
F 1 "+5V" H 3565 1173 50  0000 C CNN
F 2 "" H 3550 1000 50  0001 C CNN
F 3 "" H 3550 1000 50  0001 C CNN
	1    3550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3300 6700 3300
Wire Wire Line
	6000 3200 6700 3200
Wire Wire Line
	6000 3100 6700 3100
Text Label 6700 3400 2    50   ~ 0
MISO
Wire Wire Line
	4050 1300 4400 1300
Wire Wire Line
	4050 1400 4400 1400
Wire Wire Line
	4050 1500 4400 1500
Text Label 4400 1300 2    50   ~ 0
MISO
Text Label 6700 3300 2    50   ~ 0
MOSI
Text Label 4400 1400 2    50   ~ 0
MOSI
Text Label 4400 1500 2    50   ~ 0
SCK
Text Label 6700 3500 2    50   ~ 0
SCK
Wire Wire Line
	6000 4500 6300 4500
Wire Wire Line
	6300 4500 6300 1600
Wire Wire Line
	6300 1600 5150 1600
$Comp
L Device:R R2
U 1 1 5C0F8C2A
P 4850 1250
F 0 "R2" H 4920 1296 50  0000 L CNN
F 1 "10k" H 4920 1205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 4780 1250 50  0001 C CNN
F 3 "~" H 4850 1250 50  0001 C CNN
	1    4850 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5C0F9D3C
P 4850 1000
F 0 "#PWR010" H 4850 850 50  0001 C CNN
F 1 "+5V" H 4865 1173 50  0000 C CNN
F 2 "" H 4850 1000 50  0001 C CNN
F 3 "" H 4850 1000 50  0001 C CNN
	1    4850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1000 4850 1100
Wire Wire Line
	4850 1400 4850 1600
Connection ~ 4850 1600
Wire Wire Line
	4100 2850 4100 2950
Wire Wire Line
	3900 3400 4100 3400
$Comp
L Device:R R1
U 1 1 5C101832
P 3750 2950
F 0 "R1" V 3543 2950 50  0000 C CNN
F 1 "1M" V 3634 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3680 2950 50  0001 C CNN
F 3 "~" H 3750 2950 50  0001 C CNN
	1    3750 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 2950 4100 2950
Connection ~ 4100 2950
Wire Wire Line
	4100 2950 4100 3400
Wire Wire Line
	3600 2950 3350 2950
Connection ~ 3350 2950
Wire Wire Line
	3350 2950 3350 3400
Wire Wire Line
	6000 3400 6700 3400
Wire Wire Line
	6000 3500 6700 3500
$Comp
L Device:D D1
U 1 1 5C1033B0
P 5150 1250
F 0 "D1" V 5104 1329 50  0000 L CNN
F 1 "1N4007" V 5195 1329 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5150 1250 50  0001 C CNN
F 3 "~" H 5150 1250 50  0001 C CNN
	1    5150 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 1100 4850 1100
Connection ~ 4850 1100
Wire Wire Line
	5150 1400 5150 1600
Connection ~ 5150 1600
Wire Wire Line
	5150 1600 4850 1600
Wire Wire Line
	4850 1850 4850 1600
$Comp
L power:GND #PWR011
U 1 1 5C10B71F
P 4850 2250
F 0 "#PWR011" H 4850 2000 50  0001 C CNN
F 1 "GND" H 4855 2077 50  0000 C CNN
F 2 "" H 4850 2250 50  0001 C CNN
F 3 "" H 4850 2250 50  0001 C CNN
	1    4850 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5C223746
P 5950 2300
F 0 "C9" H 6065 2346 50  0000 L CNN
F 1 "100n" H 6065 2255 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 5988 2150 50  0001 C CNN
F 3 "~" H 5950 2300 50  0001 C CNN
	1    5950 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5C224521
P 5950 2500
F 0 "#PWR017" H 5950 2250 50  0001 C CNN
F 1 "GND" H 5955 2327 50  0000 C CNN
F 2 "" H 5950 2500 50  0001 C CNN
F 3 "" H 5950 2500 50  0001 C CNN
	1    5950 2500
	1    0    0    -1  
$EndComp
$Comp
L RF:NRF24L01_Breakout U1
U 1 1 5C226193
P 1800 1950
F 0 "U1" H 2277 1929 50  0000 L CNN
F 1 "NRF24L01_Breakout" H 2277 1838 50  0000 L CNN
F 2 "RF_Module:nRF24L01_Breakout" H 1950 2550 50  0001 L CIN
F 3 "http://www.nordicsemi.com/eng/content/download/2730/34105/file/nRF24L01_Product_Specification_v2_0.pdf" H 1800 1850 50  0001 C CNN
	1    1800 1950
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 5C22A09E
P 1800 950
F 0 "#PWR03" H 1800 800 50  0001 C CNN
F 1 "+3.3V" H 1815 1123 50  0000 C CNN
F 2 "" H 1800 950 50  0001 C CNN
F 3 "" H 1800 950 50  0001 C CNN
	1    1800 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5C22A16C
P 1800 2550
F 0 "#PWR04" H 1800 2300 50  0001 C CNN
F 1 "GND" H 1805 2377 50  0000 C CNN
F 2 "" H 1800 2550 50  0001 C CNN
F 3 "" H 1800 2550 50  0001 C CNN
	1    1800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 950  1800 1350
Text Label 6700 3100 2    50   ~ 0
9(CE)
Wire Wire Line
	2300 1650 2750 1650
Wire Wire Line
	2300 1750 2750 1750
Wire Wire Line
	2300 1850 2750 1850
Wire Wire Line
	2300 1950 2750 1950
Wire Wire Line
	2300 2150 2750 2150
Wire Wire Line
	2300 2250 2750 2250
Text Label 2750 2150 2    50   ~ 0
9(CE)
Text Label 6700 3200 2    50   ~ 0
10(CS)
Text Label 2750 1950 2    50   ~ 0
10(CS)
Text Label 2750 1850 2    50   ~ 0
SCK
Text Label 2750 1750 2    50   ~ 0
MISO
Text Label 2750 1650 2    50   ~ 0
MOSI
Wire Wire Line
	6000 4900 6700 4900
Text Label 6700 4900 2    50   ~ 0
2(INT0)
Text Label 2750 2250 2    50   ~ 0
2(INT0)
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5C27F524
P 1150 6750
F 0 "J1" H 1200 7000 50  0000 C CNN
F 1 "220V" H 1250 6900 50  0000 C CNN
F 2 "kicad_libraries:KF301-2P-5.0" H 1150 6750 50  0001 C CNN
F 3 "~" H 1150 6750 50  0001 C CNN
	1    1150 6750
	1    0    0    1   
$EndComp
Wire Wire Line
	1350 6750 1350 6850
$Comp
L power:LINE #PWR01
U 1 1 5C27F52D
P 1750 6650
F 0 "#PWR01" H 1750 6500 50  0001 C CNN
F 1 "LINE" H 1767 6823 50  0000 C CNN
F 2 "" H 1750 6650 50  0001 C CNN
F 3 "" H 1750 6650 50  0001 C CNN
	1    1750 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 6650 1850 6650
$Comp
L power:NEUT #PWR02
U 1 1 5C27F535
P 1750 6850
F 0 "#PWR02" H 1750 6700 50  0001 C CNN
F 1 "NEUT" H 1768 7023 50  0000 C CNN
F 2 "" H 1750 6850 50  0001 C CNN
F 3 "" H 1750 6850 50  0001 C CNN
	1    1750 6850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 6850 1900 6850
$Comp
L Regulator_Linear:L78L33_TO92 U2
U 1 1 5C27F53D
P 4050 6650
F 0 "U2" H 4050 6892 50  0000 C CNN
F 1 "L78L33_TO92" H 4050 6801 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92" H 4050 6875 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4050 6600 50  0001 C CNN
	1    4050 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5C27F543
P 3500 6800
F 0 "C3" H 3615 6846 50  0000 L CNN
F 1 "100n" H 3615 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 3538 6650 50  0001 C CNN
F 3 "~" H 3500 6800 50  0001 C CNN
	1    3500 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5C27F549
P 4950 6800
F 0 "C7" H 5065 6846 50  0000 L CNN
F 1 "100n" H 5065 6755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 4988 6650 50  0001 C CNN
F 3 "~" H 4950 6800 50  0001 C CNN
	1    4950 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C6
U 1 1 5C27F54F
P 4550 6800
F 0 "C6" H 4668 6846 50  0000 L CNN
F 1 "47uF" H 4668 6755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4588 6650 50  0001 C CNN
F 3 "~" H 4550 6800 50  0001 C CNN
	1    4550 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 6650 2850 6650
Connection ~ 3500 6650
Wire Wire Line
	3500 6650 3750 6650
Wire Wire Line
	4350 6650 4550 6650
Connection ~ 4550 6650
Wire Wire Line
	4550 6650 4950 6650
Connection ~ 4950 6650
Wire Wire Line
	4950 6650 5350 6650
Wire Wire Line
	2750 6850 2800 6850
Wire Wire Line
	2800 6850 2800 6950
Wire Wire Line
	2800 6950 3000 6950
Wire Wire Line
	3500 6950 4050 6950
Connection ~ 4050 6950
Wire Wire Line
	4050 6950 4550 6950
Connection ~ 4550 6950
Wire Wire Line
	4550 6950 4950 6950
Connection ~ 4950 6950
Wire Wire Line
	4950 6950 5350 6950
$Comp
L power:+5V #PWR06
U 1 1 5C27F567
P 3500 6650
F 0 "#PWR06" H 3500 6500 50  0001 C CNN
F 1 "+5V" H 3515 6823 50  0000 C CNN
F 2 "" H 3500 6650 50  0001 C CNN
F 3 "" H 3500 6650 50  0001 C CNN
	1    3500 6650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5C27F56D
P 5350 6950
F 0 "#PWR013" H 5350 6700 50  0001 C CNN
F 1 "GND" H 5355 6777 50  0000 C CNN
F 2 "" H 5350 6950 50  0001 C CNN
F 3 "" H 5350 6950 50  0001 C CNN
	1    5350 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR012
U 1 1 5C27F573
P 5350 6650
F 0 "#PWR012" H 5350 6500 50  0001 C CNN
F 1 "+3.3V" H 5365 6823 50  0000 C CNN
F 2 "" H 5350 6650 50  0001 C CNN
F 3 "" H 5350 6650 50  0001 C CNN
	1    5350 6650
	1    0    0    -1  
$EndComp
Connection ~ 3500 6950
$Comp
L Relay:SANYOU_SRD_Form_C K?
U 1 1 5C28C39E
P 9200 1500
AR Path="/5C26D6AE/5C28C39E" Ref="K?"  Part="1" 
AR Path="/5C28C39E" Ref="K1"  Part="1" 
F 0 "K1" H 9600 750 50  0000 R CNN
F 1 "SANYOU_SRD_Form_C" H 9600 850 50  0000 R CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 9650 1450 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 9200 1500 50  0001 C CNN
	1    9200 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	9400 1200 9800 1200
$Comp
L Device:D D?
U 1 1 5C28C3A5
P 9800 1500
AR Path="/5C26D6AE/5C28C3A5" Ref="D?"  Part="1" 
AR Path="/5C28C3A5" Ref="D2"  Part="1" 
F 0 "D2" V 9754 1579 50  0000 L CNN
F 1 "1N4007" V 9845 1579 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9800 1500 50  0001 C CNN
F 3 "~" H 9800 1500 50  0001 C CNN
	1    9800 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	9800 1350 9800 1200
Connection ~ 9800 1200
Wire Wire Line
	9800 1200 9800 1050
Wire Wire Line
	9800 1650 9800 1800
Wire Wire Line
	9400 1800 9800 1800
Connection ~ 9800 1800
Wire Wire Line
	9800 1800 9800 2000
$Comp
L power:+5V #PWR?
U 1 1 5C28C3B2
P 9800 1050
AR Path="/5C26D6AE/5C28C3B2" Ref="#PWR?"  Part="1" 
AR Path="/5C28C3B2" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 9800 900 50  0001 C CNN
F 1 "+5V" H 9815 1223 50  0000 C CNN
F 2 "" H 9800 1050 50  0001 C CNN
F 3 "" H 9800 1050 50  0001 C CNN
	1    9800 1050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC547 Q?
U 1 1 5C28C3B8
P 9900 2200
AR Path="/5C26D6AE/5C28C3B8" Ref="Q?"  Part="1" 
AR Path="/5C28C3B8" Ref="Q1"  Part="1" 
F 0 "Q1" H 10091 2246 50  0000 L CNN
F 1 "BC548" H 10091 2155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 10100 2125 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 9900 2200 50  0001 L CNN
	1    9900 2200
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5C28C3BE
P 10250 2200
AR Path="/5C26D6AE/5C28C3BE" Ref="R?"  Part="1" 
AR Path="/5C28C3BE" Ref="R6"  Part="1" 
F 0 "R6" V 10043 2200 50  0000 C CNN
F 1 "10k" V 10134 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10180 2200 50  0001 C CNN
F 3 "~" H 10250 2200 50  0001 C CNN
	1    10250 2200
	0    1    1    0   
$EndComp
$Comp
L Device:D D?
U 1 1 5C28C3C4
P 10650 2200
AR Path="/5C26D6AE/5C28C3C4" Ref="D?"  Part="1" 
AR Path="/5C28C3C4" Ref="D6"  Part="1" 
F 0 "D6" H 10650 2416 50  0000 C CNN
F 1 "1N4148" H 10650 2325 50  0000 C CNN
F 2 "Diode_THT:D_DO-34_SOD68_P7.62mm_Horizontal" H 10650 2200 50  0001 C CNN
F 3 "~" H 10650 2200 50  0001 C CNN
	1    10650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2200 10500 2200
Wire Wire Line
	9800 2400 9800 2650
$Comp
L power:GND #PWR?
U 1 1 5C28C3CC
P 9800 2650
AR Path="/5C26D6AE/5C28C3CC" Ref="#PWR?"  Part="1" 
AR Path="/5C28C3CC" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 9800 2400 50  0001 C CNN
F 1 "GND" H 9805 2477 50  0000 C CNN
F 2 "" H 9800 2650 50  0001 C CNN
F 3 "" H 9800 2650 50  0001 C CNN
	1    9800 2650
	1    0    0    -1  
$EndComp
Text Label 10800 2200 0    50   ~ 0
5(PD5)
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5C28C3D3
P 9100 2400
AR Path="/5C26D6AE/5C28C3D3" Ref="J?"  Part="1" 
AR Path="/5C28C3D3" Ref="J6"  Part="1" 
F 0 "J6" V 9000 2500 50  0000 R CNN
F 1 "LAMP" V 8900 2600 50  0000 R CNN
F 2 "kicad_libraries:KF301-2P-5.0" H 9100 2400 50  0001 C CNN
F 3 "~" H 9100 2400 50  0001 C CNN
	1    9100 2400
	0    1    -1   0   
$EndComp
$Comp
L power:NEUT #PWR?
U 1 1 5C28C3D9
P 9000 2200
AR Path="/5C26D6AE/5C28C3D9" Ref="#PWR?"  Part="1" 
AR Path="/5C28C3D9" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 9000 2050 50  0001 C CNN
F 1 "NEUT" V 8900 2250 50  0000 C CNN
F 2 "" H 9000 2200 50  0001 C CNN
F 3 "" H 9000 2200 50  0001 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
$Comp
L power:LINE #PWR?
U 1 1 5C28C3DF
P 9000 1200
AR Path="/5C26D6AE/5C28C3DF" Ref="#PWR?"  Part="1" 
AR Path="/5C28C3DF" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 9000 1050 50  0001 C CNN
F 1 "LINE" H 9017 1373 50  0000 C CNN
F 2 "" H 9000 1200 50  0001 C CNN
F 3 "" H 9000 1200 50  0001 C CNN
	1    9000 1200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5C291DFC
P 6900 1600
AR Path="/5C26D6AE/5C291DFC" Ref="J?"  Part="1" 
AR Path="/5C291DFC" Ref="J3"  Part="1" 
F 0 "J3" V 7054 1412 50  0000 R CNN
F 1 "PIR" V 6963 1412 50  0000 R CNN
F 2 "IFS_Connectors:KF2510-A-3P-M-TH-V" H 6900 1600 50  0001 C CNN
F 3 "~" H 6900 1600 50  0001 C CNN
	1    6900 1600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5C291E02
P 6800 1400
AR Path="/5C26D6AE/5C291E02" Ref="#PWR?"  Part="1" 
AR Path="/5C291E02" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 6800 1250 50  0001 C CNN
F 1 "+5V" H 6815 1573 50  0000 C CNN
F 2 "" H 6800 1400 50  0001 C CNN
F 3 "" H 6800 1400 50  0001 C CNN
	1    6800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C291E08
P 7000 1400
AR Path="/5C26D6AE/5C291E08" Ref="#PWR?"  Part="1" 
AR Path="/5C291E08" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 7000 1150 50  0001 C CNN
F 1 "GND" H 7005 1227 50  0000 C CNN
F 2 "" H 7000 1400 50  0001 C CNN
F 3 "" H 7000 1400 50  0001 C CNN
	1    7000 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 1400 6900 1100
Text Label 6900 1100 1    50   ~ 0
3(INT1)
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5C291E10
P 7750 1600
AR Path="/5C26D6AE/5C291E10" Ref="J?"  Part="1" 
AR Path="/5C291E10" Ref="J4"  Part="1" 
F 0 "J4" V 7904 1312 50  0000 R CNN
F 1 "BH1750" V 7813 1312 50  0000 R CNN
F 2 "kicad_libraries:KF2510-A-5P-M-TH-V" H 7750 1600 50  0001 C CNN
F 3 "~" H 7750 1600 50  0001 C CNN
	1    7750 1600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5C291E16
P 7550 1400
AR Path="/5C26D6AE/5C291E16" Ref="#PWR?"  Part="1" 
AR Path="/5C291E16" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 7550 1250 50  0001 C CNN
F 1 "+3.3V" V 7500 1600 50  0000 C CNN
F 2 "" H 7550 1400 50  0001 C CNN
F 3 "" H 7550 1400 50  0001 C CNN
	1    7550 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C291E1C
P 7650 1400
AR Path="/5C26D6AE/5C291E1C" Ref="#PWR?"  Part="1" 
AR Path="/5C291E1C" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 7650 1150 50  0001 C CNN
F 1 "GND" V 7650 1200 50  0000 C CNN
F 2 "" H 7650 1400 50  0001 C CNN
F 3 "" H 7650 1400 50  0001 C CNN
	1    7650 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 1400 7750 1100
Wire Wire Line
	7850 1400 7850 1100
Text Label 7750 1100 1    50   ~ 0
SCL
Text Label 7850 1100 1    50   ~ 0
SDA
Wire Wire Line
	6000 5000 6700 5000
Text Label 6700 5000 2    50   ~ 0
3(INT1)
Wire Wire Line
	6000 4300 6700 4300
Wire Wire Line
	6000 4400 6700 4400
Text Label 6700 4300 2    50   ~ 0
SDA
Text Label 6700 4400 2    50   ~ 0
SCL
Wire Wire Line
	6000 5200 6700 5200
Text Label 6700 5200 2    50   ~ 0
5(PD5)
$Comp
L Device:CP C1
U 1 1 5C2B43B7
P 3000 6800
F 0 "C1" H 3118 6846 50  0000 L CNN
F 1 "220uF" H 3118 6755 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3038 6650 50  0001 C CNN
F 3 "~" H 3000 6800 50  0001 C CNN
	1    3000 6800
	1    0    0    -1  
$EndComp
Connection ~ 3000 6650
Connection ~ 3000 6950
Wire Wire Line
	3000 6650 3500 6650
Wire Wire Line
	3000 6950 3500 6950
$Comp
L Device:Fuse F1
U 1 1 5C25E69C
P 1500 6650
F 0 "F1" V 1303 6650 50  0000 C CNN
F 1 "500mA" V 1394 6650 50  0000 C CNN
F 2 "Fuse:Fuseholder_TR5_Littelfuse_No560_No460" V 1430 6650 50  0001 C CNN
F 3 "~" H 1500 6650 50  0001 C CNN
	1    1500 6650
	0    1    1    0   
$EndComp
Connection ~ 1750 6850
Wire Wire Line
	1350 6850 1750 6850
Wire Wire Line
	1650 6650 1750 6650
Connection ~ 1750 6650
Wire Wire Line
	9100 2200 9100 1800
$Comp
L Device:Crystal Y1
U 1 1 5C265144
P 3750 3400
F 0 "Y1" H 3750 3668 50  0000 C CNN
F 1 "16MHz" H 3750 3577 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 3750 3400 50  0001 C CNN
F 3 "~" H 3750 3400 50  0001 C CNN
	1    3750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5400 6700 5400
Wire Wire Line
	6000 5300 6700 5300
Wire Wire Line
	6000 5100 6700 5100
Text Label 6700 5100 2    50   ~ 0
(PD4)
Text Label 6700 5300 2    50   ~ 0
(PD6)
Text Label 6700 5400 2    50   ~ 0
(PD7)
$Comp
L Device:LED D3
U 1 1 5C271870
P 10400 3250
F 0 "D3" H 10393 3466 50  0000 C CNN
F 1 "red" H 10393 3375 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O3.81mm_Z9.0mm" H 10400 3250 50  0001 C CNN
F 3 "~" H 10400 3250 50  0001 C CNN
	1    10400 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5C27206E
P 10400 3600
F 0 "D4" H 10393 3816 50  0000 C CNN
F 1 "green" H 10393 3725 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O3.81mm_Z9.0mm" H 10400 3600 50  0001 C CNN
F 3 "~" H 10400 3600 50  0001 C CNN
	1    10400 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 5C27276A
P 10400 3950
F 0 "D5" H 10393 4166 50  0000 C CNN
F 1 "yellow" H 10393 4075 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O3.81mm_Z9.0mm" H 10400 3950 50  0001 C CNN
F 3 "~" H 10400 3950 50  0001 C CNN
	1    10400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 3250 10550 3600
Connection ~ 10550 3600
Wire Wire Line
	10550 3600 10550 3950
$Comp
L power:+5V #PWR029
U 1 1 5C27A692
P 10550 3600
F 0 "#PWR029" H 10550 3450 50  0001 C CNN
F 1 "+5V" V 10565 3728 50  0000 L CNN
F 2 "" H 10550 3600 50  0001 C CNN
F 3 "" H 10550 3600 50  0001 C CNN
	1    10550 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5C27AED5
P 10100 3250
F 0 "R3" V 9893 3250 50  0000 C CNN
F 1 "470" V 9984 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 10030 3250 50  0001 C CNN
F 3 "~" H 10100 3250 50  0001 C CNN
	1    10100 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5C27B25C
P 10100 3600
F 0 "R4" V 9893 3600 50  0000 C CNN
F 1 "470" V 9984 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 10030 3600 50  0001 C CNN
F 3 "~" H 10100 3600 50  0001 C CNN
	1    10100 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5C27DB1C
P 10100 3950
F 0 "R5" V 9893 3950 50  0000 C CNN
F 1 "470" V 9984 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" V 10030 3950 50  0001 C CNN
F 3 "~" H 10100 3950 50  0001 C CNN
	1    10100 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 3950 9650 3950
Wire Wire Line
	9650 3600 9950 3600
Wire Wire Line
	9650 3250 9950 3250
Text Label 9650 3950 0    50   ~ 0
(PD7)
Text Label 9650 3600 0    50   ~ 0
(PD6)
Text Label 9650 3250 0    50   ~ 0
(PD4)
Text Notes 9700 4250 0    50   ~ 0
RADIO BLINKING DIODES
NoConn ~ 8900 1800
NoConn ~ 7950 1400
$Comp
L Switch:SW_Push SW1
U 1 1 5C2702CC
P 4850 2050
F 0 "SW1" V 4896 2002 50  0000 R CNN
F 1 "SW_Push" V 4805 2002 50  0000 R CNN
F 2 "Button_Switch_THT:SW_Tactile_SKHH_Angled" H 4850 2250 50  0001 C CNN
F 3 "" H 4850 2250 50  0001 C CNN
	1    4850 2050
	0    -1   -1   0   
$EndComp
$Comp
L Converter_ACDC:HLK-PM01 PS1
U 1 1 5C290BCE
P 2350 6000
F 0 "PS1" H 2350 6325 50  0000 C CNN
F 1 "HLK-PM01" H 2350 6234 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_HiLink_HLK-PMxx" H 2350 5700 50  0001 C CNN
F 3 "http://www.hlktech.net/product_detail.php?ProId=54" H 2750 5650 50  0001 C CNN
	1    2350 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6100 1900 6100
Wire Wire Line
	1900 6100 1900 6850
Connection ~ 1900 6850
Wire Wire Line
	1900 6850 1950 6850
Wire Wire Line
	1950 5900 1850 5900
Wire Wire Line
	1850 5900 1850 6650
Connection ~ 1850 6650
Wire Wire Line
	1850 6650 1950 6650
Wire Wire Line
	2750 6100 2800 6100
Wire Wire Line
	2800 6100 2800 6850
Connection ~ 2800 6850
Wire Wire Line
	2750 5900 2850 5900
Wire Wire Line
	2850 5900 2850 6650
Connection ~ 2850 6650
Wire Wire Line
	2850 6650 3000 6650
Wire Notes Line
	1550 5450 3150 5450
Wire Notes Line
	3150 5450 3150 6350
Wire Notes Line
	3150 6350 1550 6350
Wire Notes Line
	1550 6350 1550 5450
Text Notes 2200 5400 0    50   ~ 0
OPTIONAL
$Comp
L kicad_rozne_moje:AC_DC_5V_3W-Converter_ACDC PS2
U 1 1 5C2B02DE
P 2350 6750
F 0 "PS2" H 2350 7075 50  0000 C CNN
F 1 "AC_DC_5V_3W-Converter_ACDC" H 2350 6984 50  0000 C CNN
F 2 "Converter_ACDC:AC_DC_5V_3W" H 2350 6450 50  0001 C CNN
F 3 "" H 2350 6350 50  0001 C CNN
	1    2350 6750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5C2B47CC
P 9300 5950
F 0 "H1" H 9400 5999 50  0000 L CNN
F 1 "H" H 9400 5908 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad_Via" H 9300 5950 50  0001 C CNN
F 3 "~" H 9300 5950 50  0001 C CNN
	1    9300 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5C2B5312
P 9300 6050
F 0 "#PWR024" H 9300 5800 50  0001 C CNN
F 1 "GND" H 9305 5877 50  0000 C CNN
F 2 "" H 9300 6050 50  0001 C CNN
F 3 "" H 9300 6050 50  0001 C CNN
	1    9300 6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5C32394A
P 9650 5950
F 0 "H2" H 9750 5999 50  0000 L CNN
F 1 "H" H 9750 5908 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad_Via" H 9650 5950 50  0001 C CNN
F 3 "~" H 9650 5950 50  0001 C CNN
	1    9650 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5C323950
P 9650 6050
F 0 "#PWR025" H 9650 5800 50  0001 C CNN
F 1 "GND" H 9655 5877 50  0000 C CNN
F 2 "" H 9650 6050 50  0001 C CNN
F 3 "" H 9650 6050 50  0001 C CNN
	1    9650 6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5C326C5F
P 9950 5950
F 0 "H3" H 10050 5999 50  0000 L CNN
F 1 "H" H 10050 5908 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad_Via" H 9950 5950 50  0001 C CNN
F 3 "~" H 9950 5950 50  0001 C CNN
	1    9950 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5C326C65
P 9950 6050
F 0 "#PWR028" H 9950 5800 50  0001 C CNN
F 1 "GND" H 9955 5877 50  0000 C CNN
F 2 "" H 9950 6050 50  0001 C CNN
F 3 "" H 9950 6050 50  0001 C CNN
	1    9950 6050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5C330200
P 10300 5900
F 0 "H4" H 10400 5946 50  0000 L CNN
F 1 "H" H 10400 5855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad_Via" H 10300 5900 50  0001 C CNN
F 3 "~" H 10300 5900 50  0001 C CNN
	1    10300 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J5
U 1 1 5C2BD8EE
P 8700 3300
F 0 "J5" H 8728 3276 50  0000 L CNN
F 1 "FTDI" H 8728 3185 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 8700 3300 50  0001 C CNN
F 3 "~" H 8700 3300 50  0001 C CNN
	1    8700 3300
	1    0    0    -1  
$EndComp
Text Label 8500 3100 2    50   ~ 0
GND
Text Label 8500 3200 2    50   ~ 0
GND
Text Label 8500 3300 2    50   ~ 0
+5V
Text Label 8500 3400 2    50   ~ 0
TX
Text Label 8500 3500 2    50   ~ 0
RX
Wire Wire Line
	4050 1600 4450 1600
Wire Wire Line
	5400 2150 5550 2150
Wire Wire Line
	5950 2500 5950 2450
Wire Wire Line
	5950 2150 5550 2150
Connection ~ 5550 2150
$Comp
L Device:C C5
U 1 1 5C2DD439
P 4450 1750
F 0 "C5" H 4565 1796 50  0000 L CNN
F 1 "100n" H 4565 1705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.1mm_W3.2mm_P5.00mm" H 4488 1600 50  0001 C CNN
F 3 "~" H 4450 1750 50  0001 C CNN
	1    4450 1750
	1    0    0    -1  
$EndComp
Connection ~ 4450 1600
Wire Wire Line
	4450 1600 4850 1600
Wire Wire Line
	4450 2150 4450 1900
Wire Wire Line
	6000 4700 6700 4700
Wire Wire Line
	6000 4800 6700 4800
Text Label 6700 4700 2    50   ~ 0
TX
Text Label 6700 4800 2    50   ~ 0
RX
Text Label 8500 3600 2    50   ~ 0
DTR
Text Label 4450 2150 1    50   ~ 0
DTR
$EndSCHEMATC
