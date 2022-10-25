EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 63427F75
P 4550 2300
F 0 "J3" H 4630 2292 50  0000 L CNN
F 1 "5V-Gnd" H 4630 2201 50  0000 L CNN
F 2 "Connector_Wire:SolderWirePad_1x02_P5.08mm_Drill1.5mm" H 4550 2300 50  0001 C CNN
F 3 "~" H 4550 2300 50  0001 C CNN
	1    4550 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 63442C2E
P 4550 3250
F 0 "J1" H 4630 3242 50  0000 L CNN
F 1 "Rx/Tx" H 4630 3151 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4550 3250 50  0001 C CNN
F 3 "~" H 4550 3250 50  0001 C CNN
	1    4550 3250
	1    0    0    -1  
$EndComp
$Comp
L PCBcam-rescue:ESP32-CAM-ESP32-CAM IC1
U 1 1 634374EB
P 5700 2300
F 0 "IC1" H 6300 2565 50  0000 C CNN
F 1 "ESP32-CAM" H 6300 2474 50  0000 C CNN
F 2 "espcam_footprint:ESP32CAM" H 6750 2400 50  0001 L CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Ai-Thinker-ESP32-CAM_C277946.pdf" H 6750 2300 50  0001 L CNN
F 4 "Modules PCBA Module RoHS" H 6750 2200 50  0001 L CNN "Description"
F 5 "5" H 6750 2100 50  0001 L CNN "Height"
F 6 "Ai-Thinker" H 6750 2000 50  0001 L CNN "Manufacturer_Name"
F 7 "ESP32-CAM" H 6750 1900 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 6750 1800 50  0001 L CNN "Mouser Part Number"
F 9 "" H 6750 1700 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6750 1600 50  0001 L CNN "Arrow Part Number"
F 11 "" H 6750 1500 50  0001 L CNN "Arrow Price/Stock"
F 12 "" H 6750 1400 50  0001 L CNN "Mouser Testing Part Number"
F 13 "" H 6750 1300 50  0001 L CNN "Mouser Testing Price/Stock"
	1    5700 2300
	1    0    0    -1  
$EndComp
Text GLabel 4350 2400 0    50   Input ~ 0
gnd
Text GLabel 5700 2400 0    50   UnSpc ~ 0
gnd
Text GLabel 4350 3350 0    50   Input ~ 0
tx
Text GLabel 4350 3250 0    50   Input ~ 0
rx
Text GLabel 6900 2800 2    50   Input ~ 0
rx
Text GLabel 6900 2900 2    50   Input ~ 0
tx
Wire Wire Line
	4250 2300 4350 2300
Text GLabel 5700 2300 0    50   UnSpc ~ 0
5v
Text GLabel 4250 2300 0    50   Input ~ 0
5v
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 63453EC1
P 4550 2750
F 0 "J2" H 4630 2742 50  0000 L CNN
F 1 "Boot" H 4630 2651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4550 2750 50  0001 C CNN
F 3 "~" H 4550 2750 50  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
Text GLabel 4350 2750 0    50   Input ~ 0
i0
Text GLabel 4350 2850 0    50   Input ~ 0
gnd
Text GLabel 6900 2600 2    50   Input ~ 0
gnd
Text GLabel 6900 2500 2    50   Input ~ 0
i0
Text GLabel 6900 2400 2    50   Input ~ 0
usr
$Comp
L Device:R R1
U 1 1 63469FBB
P 5350 3650
F 0 "R1" H 5420 3696 50  0000 L CNN
F 1 "1k" H 5420 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5280 3650 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
Text GLabel 5350 4100 3    50   Input ~ 0
gnd
Text GLabel 5350 3500 1    50   UnSpc ~ 0
5v
$Comp
L Device:LED D1
U 1 1 6346B22B
P 5350 3950
F 0 "D1" V 5389 3833 50  0000 R CNN
F 1 "LED" V 5298 3833 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5350 3950 50  0001 C CNN
F 3 "~" H 5350 3950 50  0001 C CNN
	1    5350 3950
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push BT1
U 1 1 6347C0B0
P 6500 3850
F 0 "BT1" H 6500 4135 50  0000 C CNN
F 1 "USR" H 6500 4044 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_SPST_NO_Alps_SKRK" H 6500 4050 50  0001 C CNN
F 3 "~" H 6500 4050 50  0001 C CNN
	1    6500 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 6347D236
P 6500 4200
F 0 "C1" V 6248 4200 50  0000 C CNN
F 1 "1uF" V 6339 4200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6538 4050 50  0001 C CNN
F 3 "~" H 6500 4200 50  0001 C CNN
	1    6500 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 4200 6700 4200
Wire Wire Line
	6700 4200 6700 4000
Wire Wire Line
	6350 4200 6200 4200
Wire Wire Line
	6200 4200 6200 4000
Wire Wire Line
	6200 3850 6300 3850
Text GLabel 7000 4000 2    50   Input ~ 0
usr
Wire Wire Line
	7000 4000 6900 4000
Connection ~ 6700 4000
Wire Wire Line
	6700 4000 6700 3850
NoConn ~ 5700 2500
NoConn ~ 5700 2600
NoConn ~ 5700 2700
NoConn ~ 5700 2800
NoConn ~ 5700 2900
NoConn ~ 5700 3000
NoConn ~ 6900 3000
NoConn ~ 6900 2700
Text GLabel 6050 4000 0    50   UnSpc ~ 0
gnd
Wire Wire Line
	6050 4000 6200 4000
Connection ~ 6200 4000
Wire Wire Line
	6200 4000 6200 3850
$Comp
L Device:R R2
U 1 1 6348B8EF
P 6900 3650
F 0 "R2" H 6970 3696 50  0000 L CNN
F 1 "10k" H 6970 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6830 3650 50  0001 C CNN
F 3 "~" H 6900 3650 50  0001 C CNN
	1    6900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 3800 6900 4000
Connection ~ 6900 4000
Wire Wire Line
	6900 4000 6700 4000
Text GLabel 6900 2300 2    50   UnSpc ~ 0
3v3
Text GLabel 6900 3500 1    50   UnSpc ~ 0
3v3
$EndSCHEMATC
