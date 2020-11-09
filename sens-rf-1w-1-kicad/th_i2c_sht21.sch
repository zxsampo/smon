EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title "I2C Temperature and Humidity Sensor"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 2020-10-06_11-52-57:SHT21 TH?
U 1 1 5FA4CA4C
P 4900 4050
AR Path="/5FA4CA4C" Ref="TH?"  Part="1" 
AR Path="/5F9E2C6B/5FA4CA4C" Ref="TH1"  Part="1" 
AR Path="/5FAEC4C9/5FA4CA4C" Ref="TH2"  Part="1" 
AR Path="/5FB539AD/5FA4CA4C" Ref="TH3"  Part="1" 
F 0 "TH2" H 5700 4150 60  0000 C CNN
F 1 "SHT21" H 5700 4050 60  0000 C CNN
F 2 "Libraries:SHT21" H 5700 4290 60  0001 C CNN
F 3 "" H 4900 4050 60  0000 C CNN
	1    4900 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FA4CA52
P 7000 4500
AR Path="/5FA4CA52" Ref="C?"  Part="1" 
AR Path="/5F9E2C6B/5FA4CA52" Ref="C1"  Part="1" 
AR Path="/5FAEC4C9/5FA4CA52" Ref="C2"  Part="1" 
AR Path="/5FB539AD/5FA4CA52" Ref="C3"  Part="1" 
F 0 "C2" H 7092 4546 50  0000 L CNN
F 1 "100n" H 7092 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7000 4500 50  0001 C CNN
F 3 "~" H 7000 4500 50  0001 C CNN
	1    7000 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4150 4800 4150
$Comp
L power:GNDD #PWR?
U 1 1 5FA4CA59
P 7000 4800
AR Path="/5FA4CA59" Ref="#PWR?"  Part="1" 
AR Path="/5F9E2C6B/5FA4CA59" Ref="#PWR03002"  Part="1" 
AR Path="/5FAEC4C9/5FA4CA59" Ref="#PWR04002"  Part="1" 
AR Path="/5FB539AD/5FA4CA59" Ref="#PWR05002"  Part="1" 
F 0 "#PWR05002" H 7000 4550 50  0001 C CNN
F 1 "GNDD" H 7004 4645 50  0000 C CNN
F 2 "" H 7000 4800 50  0001 C CNN
F 3 "" H 7000 4800 50  0001 C CNN
	1    7000 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5FA4CA5F
P 6850 4250
AR Path="/5FA4CA5F" Ref="#PWR?"  Part="1" 
AR Path="/5F9E2C6B/5FA4CA5F" Ref="#PWR03001"  Part="1" 
AR Path="/5FAEC4C9/5FA4CA5F" Ref="#PWR04001"  Part="1" 
AR Path="/5FB539AD/5FA4CA5F" Ref="#PWR05001"  Part="1" 
F 0 "#PWR05001" H 6850 4100 50  0001 C CNN
F 1 "+3V3" H 6865 4423 50  0000 C CNN
F 2 "" H 6850 4250 50  0001 C CNN
F 3 "" H 6850 4250 50  0001 C CNN
	1    6850 4250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5FA4CA65
P 4150 4250
AR Path="/5FA4CA65" Ref="J?"  Part="1" 
AR Path="/5F9E2C6B/5FA4CA65" Ref="J1"  Part="1" 
AR Path="/5FAEC4C9/5FA4CA65" Ref="J2"  Part="1" 
AR Path="/5FB539AD/5FA4CA65" Ref="J3"  Part="1" 
F 0 "J2" H 4068 3825 50  0000 C CNN
F 1 "I2C" H 4068 3916 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4150 4250 50  0001 C CNN
F 3 "~" H 4150 4250 50  0001 C CNN
	1    4150 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 4150 6600 4150
Wire Wire Line
	6600 4150 6600 4650
Wire Wire Line
	4600 4650 6600 4650
Wire Wire Line
	6500 4250 6850 4250
Wire Wire Line
	6850 4250 7000 4250
Wire Wire Line
	7000 4250 7000 4400
Connection ~ 6850 4250
Wire Wire Line
	7000 4800 7000 4750
Wire Wire Line
	7000 4750 6700 4750
Connection ~ 7000 4750
Wire Wire Line
	7000 4750 7000 4600
Wire Wire Line
	6500 4050 6700 4050
Wire Wire Line
	6700 4050 6700 4750
Connection ~ 6700 4750
Wire Wire Line
	6700 4750 4800 4750
Wire Wire Line
	6850 4250 6850 4850
Wire Wire Line
	6850 4850 4500 4850
NoConn ~ 6500 4350
NoConn ~ 4900 4250
Connection ~ 6600 4650
Wire Wire Line
	6600 5050 6600 4650
Text HLabel 4700 5050 3    50   UnSpc ~ 0
SDA
Text HLabel 6600 5050 3    50   UnSpc ~ 0
SCL
Wire Wire Line
	4350 4050 4700 4050
Wire Wire Line
	4700 4050 4700 5050
Connection ~ 4700 4050
Wire Wire Line
	4700 4050 4900 4050
Wire Wire Line
	4350 4150 4800 4150
Connection ~ 4800 4150
Wire Wire Line
	4800 4150 4800 4750
Wire Wire Line
	4600 4250 4350 4250
Wire Wire Line
	4600 4250 4600 4650
Wire Wire Line
	4500 4850 4500 4350
Wire Wire Line
	4500 4350 4350 4350
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 5FA6FE25
P 3800 4250
AR Path="/5FA6FE25" Ref="J?"  Part="1" 
AR Path="/5F9E2C6B/5FA6FE25" Ref="JB1"  Part="1" 
AR Path="/5FAEC4C9/5FA6FE25" Ref="JB2"  Part="1" 
AR Path="/5FB539AD/5FA6FE25" Ref="JB3"  Part="1" 
F 0 "JB2" H 3718 3825 50  0000 C CNN
F 1 "I2C" H 3718 3916 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3800 4250 50  0001 C CNN
F 3 "~" H 3800 4250 50  0001 C CNN
	1    3800 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 4050 4350 4050
Connection ~ 4350 4050
Wire Wire Line
	4000 4150 4350 4150
Connection ~ 4350 4150
Wire Wire Line
	4000 4250 4350 4250
Connection ~ 4350 4250
Wire Wire Line
	4000 4350 4350 4350
Connection ~ 4350 4350
$EndSCHEMATC
