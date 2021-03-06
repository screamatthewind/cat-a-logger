EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RHT_Beacon_SHTC3"
Date "2017-10-18"
Rev "v2"
Comp "Daniel Lehmann"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L nrf52_shtc3_board-rescue:MDBT42Q_NRF52832 IC1
U 1 1 59E683CC
P 2750 3900
F 0 "IC1" H 2050 5000 60  0000 C CNN
F 1 "MDBT42Q_NRF52832" H 2750 3500 60  0000 C CNN
F 2 "rht_beacon_footprints:RF_Module_42_pin" H 2150 3800 60  0001 C CNN
F 3 "" H 2150 3800 60  0001 C CNN
	1    2750 3900
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:SHTC3 S1
U 1 1 59E684B5
P 4750 4250
F 0 "S1" H 4600 4450 60  0000 C CNN
F 1 "SHTC3" H 4750 4250 60  0000 C CNN
F 2 "RHT_beacon:DFN_4_pin_2x2" H 4750 4250 60  0001 C CNN
F 3 "" H 4750 4250 60  0001 C CNN
	1    4750 4250
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:R R1
U 1 1 59E68E7D
P 4100 3950
F 0 "R1" V 4180 3950 50  0000 C CNN
F 1 "10k" V 4100 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4030 3950 50  0001 C CNN
F 3 "" H 4100 3950 50  0000 C CNN
	1    4100 3950
	-1   0    0    1   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C3
U 1 1 59E68EA5
P 1600 4700
F 0 "C3" H 1625 4800 50  0000 L CNN
F 1 "10uF" H 1625 4600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 1638 4550 50  0001 C CNN
F 3 "" H 1600 4700 50  0000 C CNN
	1    1600 4700
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C1
U 1 1 59E690AC
P 750 4300
F 0 "C1" H 775 4400 50  0000 L CNN
F 1 "1uF" H 775 4200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 788 4150 50  0001 C CNN
F 3 "" H 750 4300 50  0000 C CNN
	1    750  4300
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C4
U 1 1 59E69145
P 2050 5850
F 0 "C4" H 2075 5950 50  0000 L CNN
F 1 "12pF" H 2075 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2088 5700 50  0001 C CNN
F 3 "" H 2050 5850 50  0000 C CNN
	1    2050 5850
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C5
U 1 1 59E691F7
P 2550 5850
F 0 "C5" H 2575 5950 50  0000 L CNN
F 1 "12pF" H 2575 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 2588 5700 50  0001 C CNN
F 3 "" H 2550 5850 50  0000 C CNN
	1    2550 5850
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:L L1
U 1 1 59E69233
P 1400 4050
F 0 "L1" V 1350 4050 50  0000 C CNN
F 1 "10uH" V 1475 4050 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 1400 4050 50  0001 C CNN
F 3 "" H 1400 4050 50  0000 C CNN
	1    1400 4050
	0    -1   -1   0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:L L2
U 1 1 59E693D6
P 1050 4050
F 0 "L2" V 1000 4050 50  0000 C CNN
F 1 "15nH" V 1125 4050 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 1050 4050 50  0001 C CNN
F 3 "" H 1050 4050 50  0000 C CNN
	1    1050 4050
	0    -1   -1   0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C6
U 1 1 59E69455
P 5300 4250
F 0 "C6" H 5325 4350 50  0000 L CNN
F 1 "100nF" H 5325 4150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 5338 4100 50  0001 C CNN
F 3 "" H 5300 4250 50  0000 C CNN
	1    5300 4250
	-1   0    0    1   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:C C2
U 1 1 59E69599
P 750 1400
F 0 "C2" H 775 1500 50  0000 L CNN
F 1 "10uF" H 775 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 788 1250 50  0001 C CNN
F 3 "" H 750 1400 50  0000 C CNN
	1    750  1400
	-1   0    0    1   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR01
U 1 1 59E6A19B
P 1600 5050
F 0 "#PWR01" H 1600 4800 50  0001 C CNN
F 1 "GND" H 1600 4900 50  0000 C CNN
F 2 "" H 1600 5050 50  0000 C CNN
F 3 "" H 1600 5050 50  0000 C CNN
	1    1600 5050
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR02
U 1 1 59E6AA85
P 750 1750
F 0 "#PWR02" H 750 1500 50  0001 C CNN
F 1 "GND" H 750 1600 50  0000 C CNN
F 2 "" H 750 1750 50  0000 C CNN
F 3 "" H 750 1750 50  0000 C CNN
	1    750  1750
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR03
U 1 1 59E6AADE
P 7650 5000
F 0 "#PWR03" H 7650 4750 50  0001 C CNN
F 1 "GND" H 7650 4850 50  0000 C CNN
F 2 "" H 7650 5000 50  0000 C CNN
F 3 "" H 7650 5000 50  0000 C CNN
	1    7650 5000
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR04
U 1 1 59E6AD15
P 7650 1550
F 0 "#PWR04" H 7650 1400 50  0001 C CNN
F 1 "VDD" H 7650 1700 50  0000 C CNN
F 2 "" H 7650 1550 50  0000 C CNN
F 3 "" H 7650 1550 50  0000 C CNN
	1    7650 1550
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR05
U 1 1 59E6ADF7
P 750 850
F 0 "#PWR05" H 750 700 50  0001 C CNN
F 1 "VDD" H 750 1000 50  0000 C CNN
F 2 "" H 750 850 50  0000 C CNN
F 3 "" H 750 850 50  0000 C CNN
	1    750  850 
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR06
U 1 1 59E6AE43
P 1400 4400
F 0 "#PWR06" H 1400 4250 50  0001 C CNN
F 1 "VDD" H 1400 4550 50  0000 C CNN
F 2 "" H 1400 4400 50  0000 C CNN
F 3 "" H 1400 4400 50  0000 C CNN
	1    1400 4400
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR07
U 1 1 59E6AF6C
P 2050 6200
F 0 "#PWR07" H 2050 5950 50  0001 C CNN
F 1 "GND" H 2050 6050 50  0000 C CNN
F 2 "" H 2050 6200 50  0000 C CNN
F 3 "" H 2050 6200 50  0000 C CNN
	1    2050 6200
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR08
U 1 1 59E6AF9E
P 2550 6200
F 0 "#PWR08" H 2550 5950 50  0001 C CNN
F 1 "GND" H 2550 6050 50  0000 C CNN
F 2 "" H 2550 6200 50  0000 C CNN
F 3 "" H 2550 6200 50  0000 C CNN
	1    2550 6200
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:Crystal Y1
U 1 1 59E6B2AD
P 2300 5500
F 0 "Y1" H 2300 5650 50  0000 C CNN
F 1 "Crystal" H 2300 5350 50  0000 C CNN
F 2 "rht_beacon_footprints:Crystal_1.6x1_2pad" H 2300 5500 50  0001 C CNN
F 3 "" H 2300 5500 50  0000 C CNN
	1    2300 5500
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR09
U 1 1 59E6C353
P 1800 1200
F 0 "#PWR09" H 1800 950 50  0001 C CNN
F 1 "GND" H 1800 1050 50  0000 C CNN
F 2 "" H 1800 1200 50  0000 C CNN
F 3 "" H 1800 1200 50  0000 C CNN
	1    1800 1200
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR010
U 1 1 59E6DB1E
P 750 4650
F 0 "#PWR010" H 750 4400 50  0001 C CNN
F 1 "GND" H 750 4500 50  0000 C CNN
F 2 "" H 750 4650 50  0000 C CNN
F 3 "" H 750 4650 50  0000 C CNN
	1    750  4650
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR011
U 1 1 59E6E3FF
P 3700 4900
F 0 "#PWR011" H 3700 4750 50  0001 C CNN
F 1 "VDD" H 3700 5050 50  0000 C CNN
F 2 "" H 3700 4900 50  0000 C CNN
F 3 "" H 3700 4900 50  0000 C CNN
	1    3700 4900
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR012
U 1 1 59E6E513
P 4850 4850
F 0 "#PWR012" H 4850 4600 50  0001 C CNN
F 1 "GND" H 4850 4700 50  0000 C CNN
F 2 "" H 4850 4850 50  0000 C CNN
F 3 "" H 4850 4850 50  0000 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:R R2
U 1 1 59E68CA0
P 4100 4750
F 0 "R2" V 4180 4750 50  0000 C CNN
F 1 "10k" V 4100 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4030 4750 50  0001 C CNN
F 3 "" H 4100 4750 50  0000 C CNN
	1    4100 4750
	-1   0    0    1   
$EndComp
NoConn ~ 1800 3500
NoConn ~ 1800 3600
NoConn ~ 1800 3800
NoConn ~ 1800 3900
NoConn ~ 1800 4000
NoConn ~ 1800 4100
NoConn ~ 2450 5150
NoConn ~ 2550 5150
NoConn ~ 2650 5150
NoConn ~ 2750 5150
NoConn ~ 2850 5150
NoConn ~ 2950 5150
NoConn ~ 3050 5150
NoConn ~ 3150 5150
NoConn ~ 3250 5150
NoConn ~ 3700 4600
NoConn ~ 3700 4500
NoConn ~ 3700 4200
NoConn ~ 3700 4100
NoConn ~ 3700 4000
NoConn ~ 3700 3900
NoConn ~ 3700 3800
NoConn ~ 3700 3700
NoConn ~ 3700 3300
$Comp
L nrf52_shtc3_board-rescue:GND #PWR013
U 1 1 59E6F765
P 1600 3200
F 0 "#PWR013" H 1600 2950 50  0001 C CNN
F 1 "GND" H 1600 3050 50  0000 C CNN
F 2 "" H 1600 3200 50  0000 C CNN
F 3 "" H 1600 3200 50  0000 C CNN
	1    1600 3200
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR014
U 1 1 59E6F79A
P 3900 3000
F 0 "#PWR014" H 3900 2750 50  0001 C CNN
F 1 "GND" H 3900 2850 50  0000 C CNN
F 2 "" H 3900 3000 50  0000 C CNN
F 3 "" H 3900 3000 50  0000 C CNN
	1    3900 3000
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR015
U 1 1 59E6F811
P 1900 5150
F 0 "#PWR015" H 1900 4900 50  0001 C CNN
F 1 "GND" H 1900 5000 50  0000 C CNN
F 2 "" H 1900 5150 50  0000 C CNN
F 3 "" H 1900 5150 50  0000 C CNN
	1    1900 5150
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR016
U 1 1 59E6F88C
P 3350 5350
F 0 "#PWR016" H 3350 5100 50  0001 C CNN
F 1 "GND" H 3350 5200 50  0000 C CNN
F 2 "" H 3350 5350 50  0000 C CNN
F 3 "" H 3350 5350 50  0000 C CNN
	1    3350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5250 2250 5150
Wire Wire Line
	2050 5250 2250 5250
Wire Wire Line
	2350 5250 2550 5250
Wire Wire Line
	2350 5250 2350 5150
Wire Wire Line
	750  850  750  1050
Wire Wire Line
	750  1550 750  1750
Wire Wire Line
	1800 1050 1800 1200
Wire Wire Line
	1400 4400 1600 4400
Wire Wire Line
	1600 4550 1600 4400
Connection ~ 1600 4400
Wire Wire Line
	1600 4850 1600 5050
Wire Wire Line
	750  3900 750  4050
Wire Wire Line
	1600 4300 1800 4300
Wire Wire Line
	1600 4050 1600 4300
Wire Wire Line
	1800 4200 1700 4200
Wire Wire Line
	1700 4200 1700 3900
Wire Wire Line
	1700 3900 750  3900
Wire Wire Line
	750  4650 750  4450
Wire Wire Line
	2050 5250 2050 5500
Wire Wire Line
	2050 6000 2050 6200
Wire Wire Line
	2550 5250 2550 5500
Wire Wire Line
	2550 6000 2550 6200
Wire Wire Line
	2150 5500 2050 5500
Connection ~ 2050 5500
Wire Wire Line
	2450 5500 2550 5500
Connection ~ 2550 5500
Wire Wire Line
	4850 4650 4850 4850
Wire Wire Line
	5300 4400 5300 4600
Wire Wire Line
	4850 3600 4850 3700
Wire Wire Line
	5300 3700 5300 4100
Wire Wire Line
	3700 4400 4100 4400
Wire Wire Line
	3700 4300 4100 4300
Wire Wire Line
	4100 4600 4100 4400
Connection ~ 4100 4400
Wire Wire Line
	4100 4100 4100 4300
Connection ~ 4100 4300
Wire Wire Line
	4100 5100 4100 4900
Wire Wire Line
	3700 5100 4100 5100
Wire Wire Line
	3700 5100 3700 4900
Wire Wire Line
	1800 3200 1600 3200
Wire Wire Line
	1900 5150 2150 5150
Wire Wire Line
	3350 5350 3350 5150
Wire Wire Line
	4300 4300 4300 3850
Wire Wire Line
	4300 3850 4650 3850
Wire Wire Line
	4300 4400 4300 4650
Wire Wire Line
	4300 4650 4650 4650
Wire Wire Line
	3700 3200 3800 3200
Wire Wire Line
	3800 3200 3800 2900
Wire Wire Line
	3800 2900 3900 2900
Wire Wire Line
	3900 2900 3900 3000
Wire Wire Line
	4100 3800 4100 3700
NoConn ~ 2700 2650
NoConn ~ 2800 2650
Wire Wire Line
	4100 3700 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	3700 3400 4000 3400
Wire Wire Line
	3700 3500 4000 3500
Wire Wire Line
	3700 3600 4000 3600
Text Label 3800 3400 0    60   ~ 0
SWDIO
Text Label 3800 3500 0    60   ~ 0
SWDCLK
Text Label 3800 3600 0    60   ~ 0
RESET
$Comp
L nrf52_shtc3_board-rescue:TEST_1P SWDIO1
U 1 1 59E70657
P 2750 1250
F 0 "SWDIO1" H 2750 1520 50  0000 C CNN
F 1 "SWDIO" H 2750 1450 50  0000 C CNN
F 2 "rht_beacon_footprints:WirePad_1mm_SMD" H 2950 1250 50  0001 C CNN
F 3 "" H 2950 1250 50  0000 C CNN
	1    2750 1250
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:TEST_1P CLK1
U 1 1 59E70883
P 2750 1500
F 0 "CLK1" H 2750 1770 50  0000 C CNN
F 1 "CLK" H 2750 1700 50  0000 C CNN
F 2 "rht_beacon_footprints:WirePad_1mm_SMD" H 2950 1500 50  0001 C CNN
F 3 "" H 2950 1500 50  0000 C CNN
	1    2750 1500
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:TEST_1P RES1
U 1 1 59E708D9
P 2750 1700
F 0 "RES1" H 2750 1970 50  0000 C CNN
F 1 "RES" H 2750 1900 50  0000 C CNN
F 2 "rht_beacon_footprints:WirePad_1mm_SMD" H 2950 1700 50  0001 C CNN
F 3 "" H 2950 1700 50  0000 C CNN
	1    2750 1700
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:TEST_1P GND1
U 1 1 59E70922
P 2750 1900
F 0 "GND1" H 2750 2170 50  0000 C CNN
F 1 "GND" H 2750 2100 50  0000 C CNN
F 2 "rht_beacon_footprints:WirePad_1mm_SMD" H 2950 1900 50  0001 C CNN
F 3 "" H 2950 1900 50  0000 C CNN
	1    2750 1900
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:TEST_1P VDD1
U 1 1 59E709B2
P 2750 1000
F 0 "VDD1" H 2750 1270 50  0000 C CNN
F 1 "VDD" H 2750 1200 50  0000 C CNN
F 2 "rht_beacon_footprints:WirePad_1mm_SMD" H 2950 1000 50  0001 C CNN
F 3 "" H 2950 1000 50  0000 C CNN
	1    2750 1000
	0    1    1    0   
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR017
U 1 1 59E70DFB
P 2450 850
F 0 "#PWR017" H 2450 700 50  0001 C CNN
F 1 "VDD" H 2450 1000 50  0000 C CNN
F 2 "" H 2450 850 50  0000 C CNN
F 3 "" H 2450 850 50  0000 C CNN
	1    2450 850 
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:GND #PWR018
U 1 1 59E70E3F
P 2450 2000
F 0 "#PWR018" H 2450 1750 50  0001 C CNN
F 1 "GND" H 2450 1850 50  0000 C CNN
F 2 "" H 2450 2000 50  0000 C CNN
F 3 "" H 2450 2000 50  0000 C CNN
	1    2450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2000 2450 1900
Wire Wire Line
	2200 1900 2450 1900
Wire Wire Line
	2450 1000 2450 850 
Wire Wire Line
	2450 1250 2750 1250
Wire Wire Line
	2450 1500 2750 1500
Wire Wire Line
	2450 1700 2750 1700
Text Label 2450 1250 0    60   ~ 0
SWDIO
Text Label 2450 1500 0    60   ~ 0
SWDCLK
Text Label 2450 1700 0    60   ~ 0
RESET
$Comp
L nrf52_shtc3_board-rescue:PWR_FLAG #FLG019
U 1 1 59E7254E
P 2200 1000
F 0 "#FLG019" H 2200 1095 50  0001 C CNN
F 1 "PWR_FLAG" H 2200 1180 50  0000 C CNN
F 2 "" H 2200 1000 50  0000 C CNN
F 3 "" H 2200 1000 50  0000 C CNN
	1    2200 1000
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:PWR_FLAG #FLG020
U 1 1 59E72599
P 2200 1900
F 0 "#FLG020" H 2200 1995 50  0001 C CNN
F 1 "PWR_FLAG" H 2200 2080 50  0000 C CNN
F 2 "" H 2200 1900 50  0000 C CNN
F 3 "" H 2200 1900 50  0000 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
Connection ~ 2450 1000
Connection ~ 2450 1900
Wire Wire Line
	2200 1000 2450 1000
Wire Wire Line
	1600 4050 1550 4050
Wire Wire Line
	1250 4050 1200 4050
Wire Wire Line
	900  4050 750  4050
Connection ~ 750  4050
$Comp
L nrf52_shtc3_board-rescue:GND #PWR021
U 1 1 59EFC8C8
P 800 3650
F 0 "#PWR021" H 800 3400 50  0001 C CNN
F 1 "GND" H 800 3500 50  0000 C CNN
F 2 "" H 800 3650 50  0000 C CNN
F 3 "" H 800 3650 50  0000 C CNN
	1    800  3650
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:R R3
U 1 1 59EFC90F
P 800 2550
F 0 "R3" V 880 2550 50  0000 C CNN
F 1 "10k" V 800 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 730 2550 50  0001 C CNN
F 3 "" H 800 2550 50  0000 C CNN
	1    800  2550
	1    0    0    -1  
$EndComp
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR022
U 1 1 59EFCA7D
P 800 2250
F 0 "#PWR022" H 800 2100 50  0001 C CNN
F 1 "VDD" H 800 2400 50  0000 C CNN
F 2 "" H 800 2250 50  0000 C CNN
F 3 "" H 800 2250 50  0000 C CNN
	1    800  2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  2400 800  2250
$Comp
L nrf52_shtc3_board-rescue:B3U-1000P B1
U 1 1 59EFD0F4
P 800 3200
F 0 "B1" H 750 3300 60  0000 C CNN
F 1 "B3U-1000P" H 850 3100 60  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_B3U-1000P" H 750 3200 60  0001 C CNN
F 3 "" H 750 3200 60  0001 C CNN
	1    800  3200
	0    1    1    0   
$EndComp
Wire Wire Line
	800  3650 800  3500
Wire Wire Line
	1800 3700 1250 3700
Wire Wire Line
	1250 3700 1250 2800
Wire Wire Line
	1250 2800 800  2800
Wire Wire Line
	800  2700 800  2800
Connection ~ 800  2800
$Comp
L nrf52_shtc3_board-rescue:BU2032SM-JJ-GCT BAT1
U 1 1 5B035147
P 1200 1050
F 0 "BAT1" H 1100 1150 60  0000 C CNN
F 1 "BU2032SM-JJ-GCT" H 1250 950 60  0000 C CNN
F 2 "rht_beacon_footprints:BAT_Holder_2032" H 1200 1050 60  0001 C CNN
F 3 "" H 1200 1050 60  0001 C CNN
	1    1200 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  1050 750  1050
Connection ~ 750  1050
Wire Wire Line
	1650 1050 1800 1050
$Comp
L nrf52_shtc3_board-rescue:TC2030-CTX P1
U 1 1 5B074BE3
P 4700 1450
F 0 "P1" H 4650 1250 40  0000 L CNN
F 1 "TC2030-CTX" H 4700 1650 40  0000 C CNN
F 2 "Tag-Connect:TC2030-NL_SMALL" H 4700 1450 60  0001 C CNN
F 3 "" H 4700 1450 60  0001 C CNN
	1    4700 1450
	1    0    0    -1  
$EndComp
NoConn ~ 5150 1550
Wire Wire Line
	4250 1550 3950 1550
Wire Wire Line
	4250 1450 3950 1450
Wire Wire Line
	4250 1350 3950 1350
Wire Wire Line
	5150 1350 5450 1350
Wire Wire Line
	5150 1450 5450 1450
$Comp
L nrf52_shtc3_board-rescue:VDD #PWR023
U 1 1 5B0766AB
P 3950 1300
F 0 "#PWR023" H 3950 1150 50  0001 C CNN
F 1 "VDD" H 3950 1450 50  0000 C CNN
F 2 "" H 3950 1300 50  0000 C CNN
F 3 "" H 3950 1300 50  0000 C CNN
	1    3950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1350 3950 1300
$Comp
L nrf52_shtc3_board-rescue:GND #PWR024
U 1 1 5B076764
P 3950 1600
F 0 "#PWR024" H 3950 1350 50  0001 C CNN
F 1 "GND" H 3950 1450 50  0000 C CNN
F 2 "" H 3950 1600 50  0000 C CNN
F 3 "" H 3950 1600 50  0000 C CNN
	1    3950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1550 3950 1600
Text Label 3950 1450 0    60   ~ 0
RESET
Text Label 5200 1350 0    60   ~ 0
SWDIO
Text Label 5200 1450 0    60   ~ 0
SWDCLK
Wire Wire Line
	1600 4400 1800 4400
Wire Wire Line
	2050 5500 2050 5700
Wire Wire Line
	2550 5500 2550 5700
Wire Wire Line
	4100 4400 4300 4400
Wire Wire Line
	4100 4300 4300 4300
Wire Wire Line
	4850 3700 4850 3850
Wire Wire Line
	4850 3700 5300 3700
Wire Wire Line
	2450 1000 2750 1000
Wire Wire Line
	2450 1900 2750 1900
Wire Wire Line
	750  4050 750  4150
Wire Wire Line
	800  2800 800  2900
Wire Wire Line
	750  1050 750  1250
$Comp
L RF_Module:ESP32-WROOM-32U U?
U 1 1 5FC43C25
P 7650 3350
F 0 "U?" H 7650 4931 50  0000 C CNN
F 1 "ESP32-WROOM-32U" H 7650 4840 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32U" H 7650 1850 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 7350 3400 50  0001 C CNN
	1    7650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 1950 7650 1550
Wire Wire Line
	7650 4750 7650 5000
$EndSCHEMATC
