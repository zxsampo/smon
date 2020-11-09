EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title "Wire monopole antenna from CC2530 datasheet"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C?
U 1 1 5FBF4D77
P 6300 3900
AR Path="/5FBF4D77" Ref="C?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D77" Ref="C251"  Part="1" 
F 0 "C251" V 6071 3900 50  0000 C CNN
F 1 "18p" V 6162 3900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6300 3900 50  0001 C CNN
F 3 "~" H 6300 3900 50  0001 C CNN
	1    6300 3900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FBF4D7D
P 6300 4400
AR Path="/5FBF4D7D" Ref="C?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D7D" Ref="C261"  Part="1" 
F 0 "C261" V 6071 4400 50  0000 C CNN
F 1 "18p" V 6162 4400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6300 4400 50  0001 C CNN
F 3 "~" H 6300 4400 50  0001 C CNN
	1    6300 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FBF4D83
P 6750 4500
AR Path="/5FBF4D83" Ref="C?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D83" Ref="C262"  Part="1" 
F 0 "C262" H 6842 4546 50  0000 L CNN
F 1 "1p" H 6842 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6750 4500 50  0001 C CNN
F 3 "~" H 6750 4500 50  0001 C CNN
	1    6750 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FBF4D89
P 7250 3900
AR Path="/5FBF4D89" Ref="C?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D89" Ref="C252"  Part="1" 
F 0 "C252" V 7021 3900 50  0000 C CNN
F 1 "1p" V 7112 3900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7250 3900 50  0001 C CNN
F 3 "~" H 7250 3900 50  0001 C CNN
	1    7250 3900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FBF4D8F
P 7600 4150
AR Path="/5FBF4D8F" Ref="C?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D8F" Ref="C253"  Part="1" 
F 0 "C253" V 7371 4150 50  0000 C CNN
F 1 "2p2" V 7462 4150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7600 4150 50  0001 C CNN
F 3 "~" H 7600 4150 50  0001 C CNN
	1    7600 4150
	0    1    1    0   
$EndComp
$Comp
L Device:L L?
U 1 1 5FBF4D95
P 6600 4050
AR Path="/5FBF4D95" Ref="L?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D95" Ref="L252"  Part="1" 
F 0 "L252" H 6653 4096 50  0000 L CNN
F 1 "2nH" H 6653 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6600 4050 50  0001 C CNN
F 3 "~" H 6600 4050 50  0001 C CNN
	1    6600 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FBF4D9B
P 7250 4400
AR Path="/5FBF4D9B" Ref="L?"  Part="1" 
AR Path="/5FBCBA16/5FBF4D9B" Ref="L261"  Part="1" 
F 0 "L261" V 7069 4400 50  0000 C CNN
F 1 "2nH" V 7160 4400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7250 4400 50  0001 C CNN
F 3 "~" H 7250 4400 50  0001 C CNN
	1    7250 4400
	0    1    1    0   
$EndComp
$Comp
L Device:Antenna Antenna?
U 1 1 5FBF4DA1
P 7850 3750
AR Path="/5FBF4DA1" Ref="Antenna?"  Part="1" 
AR Path="/5FBCBA16/5FBF4DA1" Ref="Ant1"  Part="1" 
F 0 "Ant1" H 7930 3739 50  0000 L CNN
F 1 "50 ohm" H 7930 3648 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 7850 3750 50  0001 C CNN
F 3 "~" H 7850 3750 50  0001 C CNN
	1    7850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4150 7850 4150
Wire Wire Line
	7850 4150 7850 3950
Wire Wire Line
	4500 4100 6000 4100
Wire Wire Line
	6000 4100 6000 4400
Wire Wire Line
	6000 4400 6200 4400
Wire Wire Line
	4500 4000 6000 4000
Wire Wire Line
	6000 4000 6000 3900
Wire Wire Line
	6000 3900 6200 3900
Wire Wire Line
	6400 3900 6600 3900
Wire Wire Line
	6600 3900 7150 3900
Connection ~ 6600 3900
Wire Wire Line
	7350 3900 7500 3900
Wire Wire Line
	7500 3900 7500 4150
Wire Wire Line
	7400 4400 7500 4400
Wire Wire Line
	7500 4400 7500 4150
Connection ~ 7500 4150
Wire Wire Line
	6400 4400 6750 4400
Wire Wire Line
	6750 4400 7100 4400
Connection ~ 6750 4400
Wire Wire Line
	6600 4200 6600 4650
Wire Wire Line
	6600 4650 6750 4650
Wire Wire Line
	6750 4650 6750 4600
$Comp
L power:GNDD #PWR?
U 1 1 5FBF4DBD
P 6600 4650
AR Path="/5FBF4DBD" Ref="#PWR?"  Part="1" 
AR Path="/5FBCBA16/5FBF4DBD" Ref="#PWR06001"  Part="1" 
F 0 "#PWR06001" H 6600 4400 50  0001 C CNN
F 1 "GNDD" H 6604 4495 50  0000 C CNN
F 2 "" H 6600 4650 50  0001 C CNN
F 3 "" H 6600 4650 50  0001 C CNN
	1    6600 4650
	1    0    0    -1  
$EndComp
Connection ~ 6600 4650
Text HLabel 4500 4100 0    50   UnSpc ~ 0
ANT_P
Text HLabel 4500 4000 0    50   UnSpc ~ 0
ANT_N
$EndSCHEMATC
