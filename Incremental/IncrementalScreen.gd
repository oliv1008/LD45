extends Control


onready var CenterIntroduction = $CenterIntroduction

onready var totalAntimatter = $CenterAntimatter/VerticalAntimatter/TotalAntimatter
onready var antimatterPerSeconds = $CenterAntimatter/VerticalAntimatter/AntimatterPerSeconds

onready var TurnScreenOn = $CenterAntimatter/VerticalAntimatter/TurnOnScreen

var firstTime = true
var secondTime = true

onready var CreateRobot = $CenterAntimatter/VerticalAntimatter/CreateRobot
onready var CenterRobot = $CenterRobot

onready var NumberBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container2/NumberBuilding1
onready var RevenueBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container2/RevenueBuilding1
onready var NumberBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container2/NumberBuilding2
onready var RevenueBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container2/RevenueBuilding2
onready var NumberBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container2/NumberBuilding3
onready var RevenueBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container2/RevenueBuilding3
onready var PriceBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container/BuyBuilding1
onready var PriceBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container/BuyBuilding2
onready var PriceBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container/BuyBuilding3

onready var MeleeValue = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer/MeleeValue
onready var DistanceValue = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer/DistanceValue
onready var NumberOfAmmo = $CenterRobot/ScrollContainer/VerticalRobot/HAmmoContainer/NumberOfAmmo
onready var PriceHeart = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/ImprovePVButton
onready var PriceImproveMelee = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer/ImproveMeleeButton
onready var PriceImproveDistance = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer/ImproveDistanceButton
onready var PriceAmmo = $CenterRobot/ScrollContainer/VerticalRobot/HAmmoContainer/AmmoButton

onready var Heart4 = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/Heart4
onready var Heart5 = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/Heart5

var antimatter = 0
var antimatterPerSec = 1

var priceBuilding1 = 10
var revenueBuilding1 = 2
var quantityBuilding1 = 0
var totalRevenueBuilding1 = 0

var priceBuilding2 = 100
var revenueBuilding2 = 30
var quantityBuilding2 = 0
var totalRevenueBuilding2 = 0

var priceBuilding3 = 1000
var revenueBuilding3 = 400
var quantityBuilding3 = 0
var totalRevenueBuilding3 = 0

var heartPrice = 10
var improveMeleePrice = 20
var improveDistancePrice = 40
var ammoPrice = 1

func _ready():
	#NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
	#RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
	#PriceBuilding1.text = str(priceBuilding1, " AM")
	#PriceBuilding2.text = str(priceBuilding2, " AM")
	#NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
	#RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
	#PriceBuilding3.text = str(priceBuilding3, " AM")
	#NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
	#RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
	MeleeValue.text = str(PersoGlobal.meleeDamage , " dmg")
	DistanceValue.text = str(PersoGlobal.distanceDamage , " dmg")
	NumberOfAmmo.text = str(PersoGlobal.numberOfAmmo, " Ammo")
	PriceImproveMelee.text = str(improveMeleePrice, " AM")
	PriceImproveDistance.text = str(improveDistancePrice, " AM")
	PriceAmmo.text = str(ammoPrice, " AM")
	PriceHeart.text = str(heartPrice, " AM")

func _letsGoAntimatter():
	totalAntimatter.text = str("You have ", antimatter, " antimatter")
	antimatterPerSeconds.text = str("You earn ", antimatterPerSec, " antimatter per seconds")

func _physics_process(delta):
	pass
	
func _on_CurrencyTimer_timeout():
	antimatter += antimatterPerSec
	totalAntimatter.text = str("You have ", antimatter, " antimatter")
	if (antimatter == 3 && firstTime == true):
		TurnScreenOn.visible = true
	if (antimatter == 5 && firstTime == false && secondTime == true):
		CreateRobot.visible = true;

func _on_BuyBuilding1_pressed():
	if (antimatter >= priceBuilding1):
		antimatter -= priceBuilding1
		antimatterPerSec += revenueBuilding1
		totalRevenueBuilding1 += revenueBuilding1
		quantityBuilding1 += 1
		priceBuilding1 *= 2
		PriceBuilding1.text = str(priceBuilding1, " AM")
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
		RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec, " antimatter per seconds")

func _on_BuyBuilding2_pressed():
	if (antimatter >= priceBuilding2):
		antimatter -= priceBuilding2
		antimatterPerSec += revenueBuilding2
		totalRevenueBuilding2 += revenueBuilding2
		quantityBuilding2 += 1
		priceBuilding2 *= 2
		PriceBuilding2.text = str(priceBuilding2, " AM")
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
		RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec, " antimatter per seconds")

func _on_BuyBuilding3_pressed():
	if (antimatter >= priceBuilding3):
		antimatter -= priceBuilding3
		antimatterPerSec += revenueBuilding3
		totalRevenueBuilding3 += revenueBuilding3
		quantityBuilding3 += 1
		priceBuilding3 *= 2
		PriceBuilding3.text = str(priceBuilding3, " AM")
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
		RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec, " antimatter per seconds")

func _on_ImproveMeleeButton_pressed():
	if (antimatter >= improveMeleePrice):
		antimatter -= improveMeleePrice
		PersoGlobal.meleeDamage += 10
		improveMeleePrice *= 2
		MeleeValue.text = str(PersoGlobal.meleeDamage , " dmg")
		PriceImproveMelee.text = str(improveMeleePrice, " AM")
		

func _on_ImproveDistanceButton_pressed():
	if (antimatter >= improveDistancePrice):
		antimatter -= improveDistancePrice
		PersoGlobal.distanceDamage += 10
		improveDistancePrice *= 2
		DistanceValue.text = str(PersoGlobal.distanceDamage , " dmg")
		PriceImproveDistance.text = str(improveDistancePrice, " AM")

func _on_1AmmoButton_pressed():
	if (antimatter >= ammoPrice):
		antimatter -= ammoPrice
		PersoGlobal.numberOfAmmo += 1
		ammoPrice *= 2
		NumberOfAmmo.text = str(PersoGlobal.numberOfAmmo, " Ammo")
		PriceAmmo.text = str(ammoPrice, " AM")

func _on_ImprovePVButton_pressed():
	if (PersoGlobal.pv == 3):
		if (antimatter >= heartPrice):
			antimatter -= heartPrice
			PersoGlobal.pv += 1
			heartPrice *= 1000
			Heart4.visible = true
			PriceHeart.text = str(heartPrice, " AM")
	if (PersoGlobal.pv == 4):
		if (antimatter >= heartPrice):
			antimatter -= heartPrice
			PersoGlobal.pv += 1
			Heart5.visible = true
			PriceHeart.visible = false


func _on_TurnOnScreen_pressed():
	var notificationData = "allumetoi"
	nc.post_notification("DEMO_NOTIFICATION", notificationData)
	firstTime = false;
	$HorizontalLimit.visible = true;
	TurnScreenOn.visible = false
	antimatter -= 3

func _on_StartTheGame_pressed():
	CenterIntroduction.visible = false
	$ColorRect.visible = false
	antimatter = 0
	_letsGoAntimatter()

func _on_CreateRobot_pressed():
	var notificationData = "Create robot"
	nc.post_notification("DEMO_NOTIFICATION", notificationData)
	secondTime = false
	CreateRobot.visible = false
	$VerticalLimit.visible = true
	antimatter -= 5
	CenterRobot.visible = true
