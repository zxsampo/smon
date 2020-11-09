EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "Power harvester"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Battery_Management:BQ25504 PwrHarv1
U 1 1 5F85CD43
P 7500 4100
F 0 "PwrHarv1" H 7600 4200 50  0000 L CNN
F 1 "BQ25504" H 7600 4100 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-16-1EP_3x3mm_P0.5mm_EP1.75x1.75mm_ThermalVias" H 7500 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq25504.pdf" H 7200 4900 50  0001 C CNN
	1    7500 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR02001
U 1 1 5F85DB0D
P 7300 5050
F 0 "#PWR02001" H 7300 4800 50  0001 C CNN
F 1 "GNDD" H 7304 4895 50  0000 C CNN
F 2 "" H 7300 5050 50  0001 C CNN
F 3 "" H 7300 5050 50  0001 C CNN
	1    7300 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5050 7300 5000
Wire Wire Line
	7300 4900 7300 5000
Connection ~ 7500 5000
Wire Wire Line
	7500 5000 7500 4900
Wire Wire Line
	7500 5000 7700 5000
Wire Wire Line
	7700 5000 7700 4900
Wire Wire Line
	7000 4500 6900 4500
Connection ~ 7300 5000
$Comp
L Device:R_Small Rov3
U 1 1 5F85E9F9
P 4900 4200
F 0 "Rov3" H 4959 4246 50  0000 L CNN
F 1 "1M5" H 4959 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4900 4200 50  0001 C CNN
F 3 "~" H 4900 4200 50  0001 C CNN
	1    4900 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Rov1
U 1 1 5F85F16F
P 4900 4850
F 0 "Rov1" H 4959 4896 50  0000 L CNN
F 1 "5M1" H 4959 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4900 4850 50  0001 C CNN
F 3 "~" H 4900 4850 50  0001 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Ruv2
U 1 1 5F85F965
P 5350 4200
F 0 "Ruv2" H 5409 4246 50  0000 L CNN
F 1 "5M1" H 5409 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5350 4200 50  0001 C CNN
F 3 "~" H 5350 4200 50  0001 C CNN
	1    5350 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Ruv1
U 1 1 5F85FC1D
P 5350 4500
F 0 "Ruv1" H 5409 4546 50  0000 L CNN
F 1 "4M7" H 5409 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5350 4500 50  0001 C CNN
F 3 "~" H 5350 4500 50  0001 C CNN
	1    5350 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Rok3
U 1 1 5F85FF16
P 6000 4200
F 0 "Rok3" H 6059 4246 50  0000 L CNN
F 1 "1M" H 6059 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6000 4200 50  0001 C CNN
F 3 "~" H 6000 4200 50  0001 C CNN
	1    6000 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Rok2
U 1 1 5F860250
P 6000 4500
F 0 "Rok2" H 6059 4546 50  0000 L CNN
F 1 "5M1" H 6059 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6000 4500 50  0001 C CNN
F 3 "~" H 6000 4500 50  0001 C CNN
	1    6000 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Rok1
U 1 1 5F8605CB
P 6000 4850
F 0 "Rok1" H 6059 4896 50  0000 L CNN
F 1 "5M1" H 6059 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6000 4850 50  0001 C CNN
F 3 "~" H 6000 4850 50  0001 C CNN
	1    6000 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4950 6000 5000
Wire Wire Line
	5350 4600 5350 5000
Wire Wire Line
	5350 5000 6000 5000
Connection ~ 5350 5000
Wire Wire Line
	6000 4750 6000 4650
Wire Wire Line
	6000 4450 6000 4400
Wire Wire Line
	5350 4450 5350 4400
Wire Wire Line
	6000 4350 6300 4350
Wire Wire Line
	6350 4300 6350 4650
Wire Wire Line
	6350 4650 6000 4650
Connection ~ 6000 4650
Wire Wire Line
	6000 4650 6000 4600
Wire Wire Line
	5350 4350 5750 4350
Connection ~ 6000 5000
Wire Wire Line
	7300 5000 7500 5000
Wire Wire Line
	6900 4500 6900 5000
Wire Wire Line
	6900 5000 7300 5000
Connection ~ 6900 4500
Wire Wire Line
	4900 3900 5350 3900
Wire Wire Line
	4900 3900 4900 4100
Wire Wire Line
	5350 3900 5350 4100
Connection ~ 5350 3900
Wire Wire Line
	5350 3900 6000 3900
Wire Wire Line
	6000 3900 6000 4100
Connection ~ 6000 3900
Wire Wire Line
	6000 4300 6000 4350
Connection ~ 6000 4400
Connection ~ 6000 4350
Wire Wire Line
	6000 4350 6000 4400
Wire Wire Line
	5350 4300 5350 4350
Connection ~ 5350 4400
Connection ~ 5350 4350
Wire Wire Line
	5350 4350 5350 4400
Wire Wire Line
	5750 4050 6350 4050
Wire Wire Line
	6350 4050 6350 4100
Wire Wire Line
	5750 4050 5750 4350
Wire Wire Line
	6300 4200 6300 4350
Wire Wire Line
	6000 3900 6900 3900
Wire Wire Line
	5200 4000 6900 4000
Wire Wire Line
	6350 4100 6900 4100
Wire Wire Line
	6300 4200 6900 4200
Wire Wire Line
	6350 4300 6900 4300
Wire Wire Line
	6000 5000 6550 5000
Connection ~ 6900 5000
$Comp
L Device:C Cref1
U 1 1 5F8846A7
P 6550 4750
F 0 "Cref1" H 6665 4796 50  0000 L CNN
F 1 "10n" H 6665 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6588 4600 50  0001 C CNN
F 3 "~" H 6550 4750 50  0001 C CNN
	1    6550 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4600 6550 4400
Wire Wire Line
	6550 4400 6900 4400
Wire Wire Line
	6550 4900 6550 5000
Connection ~ 6550 5000
Wire Wire Line
	6550 5000 6900 5000
$Comp
L Device:R_Small Roc3
U 1 1 5F8865AB
P 4400 4200
F 0 "Roc3" H 4459 4246 50  0000 L CNN
F 1 "4M7" H 4459 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4400 4200 50  0001 C CNN
F 3 "~" H 4400 4200 50  0001 C CNN
	1    4400 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small Roc2
U 1 1 5F886D80
P 4400 4500
F 0 "Roc2" H 4459 4546 50  0000 L CNN
F 1 "5M1" H 4459 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4400 4500 50  0001 C CNN
F 3 "~" H 4400 4500 50  0001 C CNN
	1    4400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4400 4400 4350
Wire Wire Line
	4400 4100 4400 3200
Wire Wire Line
	4400 3200 7100 3200
Wire Wire Line
	7100 3200 7100 3300
Wire Wire Line
	4400 4350 4750 4350
Wire Wire Line
	4750 4350 4750 3800
Wire Wire Line
	4750 3800 6900 3800
Connection ~ 4400 4350
Wire Wire Line
	4400 4350 4400 4300
$Comp
L Device:C Cbyp1
U 1 1 5F88B550
P 8250 4750
F 0 "Cbyp1" H 8365 4796 50  0000 L CNN
F 1 "100n" H 8365 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8288 4600 50  0001 C CNN
F 3 "~" H 8250 4750 50  0001 C CNN
	1    8250 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 Cstor1
U 1 1 5F88BEEC
P 8700 4750
F 0 "Cstor1" H 8815 4796 50  0000 L CNN
F 1 "4u7" H 8815 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8700 4750 50  0001 C CNN
F 3 "~" H 8700 4750 50  0001 C CNN
	1    8700 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell Bat1
U 1 1 5F88C855
P 9150 4800
F 0 "Bat1" H 9268 4896 50  0000 L CNN
F 1 "4v2" H 9268 4805 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 9150 4860 50  0001 C CNN
F 3 "~" V 9150 4860 50  0001 C CNN
	1    9150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 5000 8250 5000
Wire Wire Line
	9150 5000 9150 4900
Connection ~ 7700 5000
Wire Wire Line
	8700 5000 8700 4900
Connection ~ 8700 5000
Wire Wire Line
	8700 5000 9150 5000
Wire Wire Line
	8250 5000 8250 4900
Connection ~ 8250 5000
Wire Wire Line
	8250 5000 8700 5000
Wire Wire Line
	8100 4400 8250 4400
Wire Wire Line
	8700 4400 8700 4600
Wire Wire Line
	8250 4600 8250 4400
Connection ~ 8250 4400
Wire Wire Line
	8250 4400 8700 4400
Wire Wire Line
	7900 3300 7900 3200
Wire Wire Line
	7900 3200 9150 3200
Wire Wire Line
	9150 3200 9150 4600
$Comp
L Device:L Lbst1
U 1 1 5F8964A8
P 7350 3200
F 0 "Lbst1" V 7540 3200 50  0000 C CNN
F 1 "22uH" V 7449 3200 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H6mm" H 7350 3200 50  0001 C CNN
F 3 "~" H 7350 3200 50  0001 C CNN
	1    7350 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 3200 7200 3200
Connection ~ 7100 3200
Wire Wire Line
	7500 3200 7600 3200
Wire Wire Line
	7600 3200 7600 3300
$Comp
L Device:C C_hv1
U 1 1 5F89A747
P 4000 4200
F 0 "C_hv1" H 4115 4246 50  0000 L CNN
F 1 "4u7" H 4115 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4038 4050 50  0001 C CNN
F 3 "~" H 4000 4200 50  0001 C CNN
	1    4000 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4350 4000 5000
Wire Wire Line
	4000 4050 4000 3200
Wire Wire Line
	4000 3200 4400 3200
Connection ~ 4400 3200
$Comp
L Device:Solar_Cell SC1
U 1 1 5F89F0EA
P 3600 4250
F 0 "SC1" H 3708 4346 50  0000 L CNN
F 1 "0v6" H 3708 4255 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 3600 4310 50  0001 C CNN
F 3 "~" V 3600 4310 50  0001 C CNN
	1    3600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4350 3600 5000
Wire Wire Line
	3600 5000 4000 5000
Connection ~ 4000 5000
Wire Wire Line
	3600 4050 3600 3200
Wire Wire Line
	3600 3200 4000 3200
Connection ~ 4000 3200
Wire Wire Line
	4000 5000 4400 5000
$Comp
L Device:R_Small Roc1
U 1 1 5F8AAA87
P 4400 4850
F 0 "Roc1" H 4459 4896 50  0000 L CNN
F 1 "10M" H 4459 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4400 4850 50  0001 C CNN
F 3 "~" H 4400 4850 50  0001 C CNN
	1    4400 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4950 4400 5000
Connection ~ 4400 5000
Wire Wire Line
	4400 4750 4400 4600
Wire Wire Line
	4400 5000 4900 5000
$Comp
L Device:R_Small Rov2
U 1 1 5F8B729A
P 4900 4500
F 0 "Rov2" H 4959 4546 50  0000 L CNN
F 1 "2M2" H 4959 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4900 4500 50  0001 C CNN
F 3 "~" H 4900 4500 50  0001 C CNN
	1    4900 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 4300 4900 4400
Wire Wire Line
	4900 4600 4900 4650
Connection ~ 4900 4750
Wire Wire Line
	4900 4750 4900 4800
Wire Wire Line
	4900 4950 4900 5000
Connection ~ 4900 5000
Wire Wire Line
	4900 5000 5350 5000
Wire Wire Line
	5200 4650 4900 4650
Wire Wire Line
	5200 4000 5200 4650
Connection ~ 4900 4650
Wire Wire Line
	4900 4650 4900 4750
Connection ~ 8700 4400
Text HLabel 9650 4400 2    50   UnSpc ~ 0
pwr_3v3
Wire Wire Line
	8700 4400 9650 4400
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5FDCD71A
P 2650 3200
F 0 "#FLG0101" H 2650 3275 50  0001 C CNN
F 1 "PWR_FLAG" H 2650 3373 50  0000 C CNN
F 2 "" H 2650 3200 50  0001 C CNN
F 3 "~" H 2650 3200 50  0001 C CNN
	1    2650 3200
	1    0    0    -1  
$EndComp
Connection ~ 3600 3200
Text HLabel 9650 3800 2    50   UnSpc ~ 0
BAT_OK_RESET
Wire Wire Line
	8100 3800 9650 3800
$Comp
L Regulator_Linear:AMS1117-3.3 U1
U 1 1 5F9C7C89
P 3150 3200
F 0 "U1" H 3150 3442 50  0000 C CNN
F 1 "AMS1117-3.3" H 3150 3351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3150 3400 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3250 2950 50  0001 C CNN
	1    3150 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3500 3150 5000
Wire Wire Line
	3150 5000 3600 5000
Connection ~ 3600 5000
Wire Wire Line
	3450 3200 3500 3200
$Comp
L Connector_Generic:Conn_01x04 JPH3
U 1 1 5FB5A6E0
P 2350 3950
F 0 "JPH3" H 2350 3650 50  0000 C CNN
F 1 "Hdr" H 2350 3550 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 2350 3950 50  0001 C CNN
F 3 "~" H 2350 3950 50  0001 C CNN
	1    2350 3950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial ANT2
U 1 1 5FB5E7D8
P 1700 3950
F 0 "ANT2" H 1628 4188 50  0000 C CNN
F 1 "U.FL" H 1628 4097 50  0000 C CNN
F 2 "Connector_Coaxial:U.FL_Molex_MCRF_73412-0110_Vertical" H 1700 3950 50  0001 C CNN
F 3 " ~" H 1700 3950 50  0001 C CNN
	1    1700 3950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 4150 2550 4150
$Comp
L Connector_Generic:Conn_01x02 JPH2
U 1 1 5FB765EE
P 2200 3850
F 0 "JPH2" H 2050 4100 50  0000 L CNN
F 1 "Hdr" H 2050 4000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2200 3850 50  0001 C CNN
F 3 "~" H 2200 3850 50  0001 C CNN
	1    2200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4050 2750 4050
Wire Wire Line
	1900 3950 1950 3950
Wire Wire Line
	2000 3850 1950 3850
Wire Wire Line
	1950 3850 1950 3950
Connection ~ 1950 3950
Wire Wire Line
	1950 3950 2000 3950
Wire Wire Line
	3150 5000 2950 5000
Wire Wire Line
	2550 5000 2550 4150
Connection ~ 3150 5000
Connection ~ 2550 4150
$Comp
L Device:D_Schottky DS1
U 1 1 5FB9F655
P 2650 3500
F 0 "DS1" V 2604 3580 50  0000 L CNN
F 1 "Schottky" V 2695 3580 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 2650 3500 50  0001 C CNN
F 3 "~" H 2650 3500 50  0001 C CNN
	1    2650 3500
	0    -1   1    0   
$EndComp
Wire Wire Line
	3500 3850 3500 3200
Connection ~ 3500 3200
Wire Wire Line
	3500 3200 3600 3200
Wire Wire Line
	2650 3350 2650 3200
Wire Wire Line
	2650 3200 2750 3200
Wire Wire Line
	2650 3650 2650 3950
Wire Wire Line
	2500 3950 2550 3950
Connection ~ 2550 3950
Wire Wire Line
	2550 3950 2650 3950
Wire Wire Line
	2750 4050 2750 3200
Connection ~ 2750 3200
Wire Wire Line
	2750 3200 2850 3200
Wire Wire Line
	2550 3850 2950 3850
$Comp
L Device:D_Zener_ALT DZ2
U 1 1 5FBCD5B0
P 2950 4400
F 0 "DZ2" V 2904 4480 50  0000 L CNN
F 1 "3v3" V 2995 4480 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF" H 2950 4400 50  0001 C CNN
F 3 "~" H 2950 4400 50  0001 C CNN
	1    2950 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 4250 2950 3850
Connection ~ 2950 3850
Wire Wire Line
	2950 3850 3500 3850
Wire Wire Line
	2950 4550 2950 5000
Connection ~ 2950 5000
Wire Wire Line
	2950 5000 2550 5000
$Comp
L power:+5V #PWR0102
U 1 1 5FC2A2AF
P 2750 3100
F 0 "#PWR0102" H 2750 2950 50  0001 C CNN
F 1 "+5V" H 2765 3273 50  0000 C CNN
F 2 "" H 2750 3100 50  0001 C CNN
F 3 "" H 2750 3100 50  0001 C CNN
	1    2750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3100 2750 3200
Connection ~ 2650 3200
Text Label 6200 4650 0    50   ~ 0
OKP
Text Label 6150 4350 0    50   ~ 0
OKH
Text Label 5600 4350 0    50   ~ 0
UV
Text Label 5100 4650 0    50   ~ 0
OV
Text Label 4600 4350 0    50   ~ 0
OC
Text Label 6250 3200 0    50   ~ 0
Vin_raw
Text Label 8350 3200 0    50   ~ 0
Vbat
$EndSCHEMATC