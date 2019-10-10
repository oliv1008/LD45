extends Control

onready var CenterIntroduction = $CenterIntroduction

onready var totalAntimatter = $CenterAntimatter/VerticalAntimatter/HBoxContainer/TotalAntimatter
onready var antimatterPerSeconds = $CenterAntimatter/VerticalAntimatter/HBoxContainer2/AntimatterPerSeconds

onready var TurnScreenOn = $CenterAntimatter/VerticalAntimatter/TurnOnScreen

var firstTime = true
var secondTime = true

onready var CreateRobot = $CenterAntimatter/VerticalAntimatter/CreateRobot
onready var CenterRobot = $CenterRobot

onready var NumberBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container2/NumberBuilding1
onready var RevenueBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container3/RevenueBuilding1
onready var PriceBuilding1 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container4/BuyBuilding1

onready var NumberBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container2/NumberBuilding2
onready var RevenueBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container3/RevenueBuilding2
onready var PriceBuilding2 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container4/BuyBuilding2

onready var NumberBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container2/NumberBuilding3
onready var RevenueBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container3/RevenueBuilding3
onready var PriceBuilding3 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container4/BuyBuilding3

onready var NumberBuilding4 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding4Container/HBuilding4Container2/NumberBuilding4
onready var RevenueBuilding4 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding4Container/HBuilding4Container3/RevenueBuilding4
onready var PriceBuilding4 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding4Container/HBuilding4Container4/BuyBuilding4

onready var NumberBuilding5 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding5Container/HBuilding5Container2/NumberBuilding5
onready var RevenueBuilding5 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding5Container/HBuilding5Container3/RevenueBuilding5
onready var PriceBuilding5 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding5Container/HBuilding5Container4/BuyBuilding5

onready var NumberBuilding6 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding6Container/HBuilding6Container2/NumberBuilding6
onready var RevenueBuilding6 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding6Container/HBuilding6Container3/RevenueBuilding6
onready var PriceBuilding6 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding6Container/HBuilding6Container4/BuyBuilding6

onready var NumberBuilding7 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding7Container/HBuilding7Container2/NumberBuilding7
onready var RevenueBuilding7 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding7Container/HBuilding7Container3/RevenueBuilding7
onready var PriceBuilding7 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding7Container/HBuilding7Container4/BuyBuilding7

onready var NumberBuilding8 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding8Container/HBuilding8Container2/NumberBuilding8
onready var RevenueBuilding8 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding8Container/HBuilding8Container3/RevenueBuilding8
onready var PriceBuilding8 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding8Container/HBuilding8Container4/BuyBuilding8

onready var NumberBuilding9 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding9Container/HBuilding9Container2/NumberBuilding9
onready var RevenueBuilding9 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding9Container/HBuilding9Container3/RevenueBuilding9
onready var PriceBuilding9 = $CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding9Container/HBuilding9Container4/BuyBuilding9

onready var MeleeValue = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer/MeleeValue
onready var DistanceValue = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer/DistanceValue
onready var NumberOfAmmo = $CenterRobot/ScrollContainer/VerticalRobot/VAmmoContainer/HAmmoContainer1/NumberOfAmmo
onready var PriceHeart = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/ImprovePVButton
onready var PriceImproveMelee = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer4/ImproveMeleeButton
onready var PriceImproveDistance = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer4/ImproveDistanceButton
onready var PriceAmmo = $CenterRobot/ScrollContainer/VerticalRobot/VAmmoContainer/HAmmoContainer2/AmmoButton

onready var Heart4 = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/Heart4
onready var Heart5 = $CenterRobot/ScrollContainer/VerticalRobot/HPVContainer/Heart5

onready var CacWeaponName = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer2/WeaponName
onready var CacWeaponSprite = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer2/TextureRect
onready var DistanceWeaponName = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer2/WeaponName
onready var DistanceWeaponSprite = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer2/TextureRect

onready var BeforeNextDistanceWeapon = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer3/Label
onready var BeforeNextMeleeWeapon = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer3/Label
onready var LabelAvantBeforeNextDistance = $CenterRobot/ScrollContainer/VerticalRobot/VDistanceContainer/HDistanceContainer3/BeforeNext
onready var LabelAvantBeforeNextMelee = $CenterRobot/ScrollContainer/VerticalRobot/VCacContainer/HCacContainer3/BeforeNext

var antimatter = 0
var antimatterPerSec = 1

var priceBuilding1 = 10
var revenueBuilding1 = 1
var quantityBuilding1 = 0
var totalRevenueBuilding1 = 0

var priceBuilding2 = 120
var revenueBuilding2 = 10
var quantityBuilding2 = 0
var totalRevenueBuilding2 = 0

var priceBuilding3 = 1300
var revenueBuilding3 = 90
var quantityBuilding3 = 0
var totalRevenueBuilding3 = 0

var priceBuilding4 = 14000
var revenueBuilding4 = 810
var quantityBuilding4 = 0
var totalRevenueBuilding4 = 0

var priceBuilding5 = 150000
var revenueBuilding5 = 7230
var quantityBuilding5 = 0
var totalRevenueBuilding5 = 0

var priceBuilding6 = 1600000
var revenueBuilding6 = 64300
var quantityBuilding6 = 0
var totalRevenueBuilding6 = 0

var priceBuilding7 = 17000000
var revenueBuilding7 = 569000
var quantityBuilding7 = 0
var totalRevenueBuilding7 = 0

var priceBuilding8 = 180000000
var revenueBuilding8 = 5023000
var quantityBuilding8 = 0
var totalRevenueBuilding8 = 0

var priceBuilding9 = 1900000000
var revenueBuilding9 = 44187000
var quantityBuilding9 = 0
var totalRevenueBuilding9 = 0

var heartPrice = 1000
var improveMeleePrice = 10
var improveDistancePrice = 10
var coeffWeapon = 1.15
var coeffAmmo = 1.15
var ammoPrice = 10

var bFactor = 1.03

var spriteHandgun = load("res://assets/images/Armes/Distance/HandgunIncrementalScreen.png")
var spriteLaserHandgun = load("res://assets/images/Armes/Distance/LaserHandgunIncrementalScreen.png")
var spriteLaserRifle = load("res://assets/images/Armes/Distance/LaserRifleIncrementalScreen.png")
var spriteRifle = load("res://assets/images/Armes/Distance/RifleIncrementalScreen.png")

var spriteSpear = load("res://assets/images/Armes/Cac/LanceIncrementalScreen.png")
var spriteSword = load("res://assets/images/Armes/Cac/EpeeIncrementalScreen.png")
var spriteAxe = load("res://assets/images/Armes/Cac/AxeIncrementalScreen.png")
var spriteBigSword = load("res://assets/images/Armes/Cac/BigSwordIncrementalScreen.png")
	
func _ready():
	nc.add_observer(self, "LEVEL_END","handleNotification")
	nc.add_observer(self, "Antimatter","handleNotification")
	PriceBuilding1.text = str(priceBuilding1)
	NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
	RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
	PriceBuilding2.text = str(priceBuilding2)
	NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
	RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
	PriceBuilding3.text = str(priceBuilding3)
	NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
	RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
	PriceBuilding4.text = str(priceBuilding4)
	NumberBuilding4.text = str("Quantity : ", quantityBuilding4)
	RevenueBuilding4.text = str("Revenue : ", totalRevenueBuilding4)
	PriceBuilding5.text = str(priceBuilding5)
	NumberBuilding5.text = str("Quantity : ", quantityBuilding5)
	RevenueBuilding5.text = str("Revenue : ", totalRevenueBuilding5)
	PriceBuilding6.text = str(priceBuilding6)
	NumberBuilding6.text = str("Quantity : ", quantityBuilding6)
	RevenueBuilding6.text = str("Revenue : ", totalRevenueBuilding6)
	PriceBuilding7.text = str(priceBuilding7)
	NumberBuilding7.text = str("Quantity : ", quantityBuilding7)
	RevenueBuilding7.text = str("Revenue : ", totalRevenueBuilding7)
	PriceBuilding8.text = str(priceBuilding8)
	NumberBuilding8.text = str("Quantity : ", quantityBuilding8)
	RevenueBuilding8.text = str("Revenue : ", totalRevenueBuilding8)
	PriceBuilding9.text = str(priceBuilding9)
	NumberBuilding9.text = str("Quantity : ", quantityBuilding9)
	RevenueBuilding9.text = str("Revenue : ", totalRevenueBuilding9)
	_updateBuildings()
	MeleeValue.text = str(PersoGlobal.meleeDamage , " dmg")
	DistanceValue.text = str(PersoGlobal.distanceDamage , " dmg")
	NumberOfAmmo.text = str(PersoGlobal.numberOfAmmoMax, " Ammo")
	PriceImproveMelee.text = str(improveMeleePrice)
	PriceImproveDistance.text = str(improveDistancePrice)
	PriceAmmo.text = str(ammoPrice)
	PriceHeart.text = str(heartPrice)
	
	BeforeNextDistanceWeapon.text = str(PersoGlobal.dmgTillNextWeaponDistance)
	BeforeNextMeleeWeapon.text = str(PersoGlobal.dmgTillNextWeaponCac)
	
	CacWeaponName.text = PersoGlobal.currentWeaponCacName
	if (PersoGlobal.currentWeaponCacName == "Spear"):
		CacWeaponSprite.texture = spriteSpear
	if (PersoGlobal.currentWeaponCacName == "Sword"):
		CacWeaponSprite.texture = spriteSword
	if (PersoGlobal.currentWeaponCacName == "Axe"):
		CacWeaponSprite.texture = spriteAxe
	if (PersoGlobal.currentWeaponCacName == "BigSword"):
		CacWeaponSprite.texture = spriteBigSword
	DistanceWeaponName.text = PersoGlobal.currentWeaponDistanceName
	if (PersoGlobal.currentWeaponDistanceName == "Handgun"):
		DistanceWeaponSprite.texture = spriteHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Laser Gun"):
		DistanceWeaponSprite.texture = spriteLaserHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Laser Rifle"):
		DistanceWeaponSprite.texture = spriteHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Rifle"):
		DistanceWeaponSprite.texture = spriteRifle
		
		
	

func _updateBuildings():
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container/HBuilding1Container/ValuePerSec.text = str(_format(revenueBuilding1))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container/HBuilding2Container/ValuePerSec.text = str(_format(revenueBuilding2))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container/HBuilding3Container/ValuePerSec.text = str(_format(revenueBuilding3))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding4Container/HBuilding4Container/ValuePerSec.text = str(_format(revenueBuilding4))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding5Container/HBuilding5Container/ValuePerSec.text = str(_format(revenueBuilding5))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding6Container/HBuilding6Container/ValuePerSec.text = str(_format(revenueBuilding6))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding7Container/HBuilding7Container/ValuePerSec.text = str(_format(revenueBuilding7))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding8Container/HBuilding8Container/ValuePerSec.text = str(_format(revenueBuilding8))
	$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding9Container/HBuilding9Container/ValuePerSec.text = str(_format(revenueBuilding9))
	PriceBuilding1.text = str(_format(priceBuilding1))
	PriceBuilding2.text = str(_format(priceBuilding2))
	PriceBuilding3.text = str(_format(priceBuilding3))
	PriceBuilding4.text = str(_format(priceBuilding4))
	PriceBuilding5.text = str(_format(priceBuilding5))
	PriceBuilding6.text = str(_format(priceBuilding6))
	PriceBuilding7.text = str(_format(priceBuilding7))
	PriceBuilding8.text = str(_format(priceBuilding8))
	PriceBuilding9.text = str(_format(priceBuilding9))
	
func _format(value):
	if (value < 1000):
		return str(round(value))
	elif (value < 10000):
		return str(stepify(round(value)/1000,0.01)) + "K"
	elif (value < 100000):
		return str(stepify(round(value)/1000,0.1)) + "K"
	elif (value < 1000000):
		return str(stepify(round(value)/1000,1)) + "K"
	elif (value < 10000000):
		return str(stepify(round(value)/1000000,0.01)) + "M"
	elif (value < 100000000):
		return str(stepify(round(value)/1000000,0.1)) + "M"
	elif (value < 1000000000):
		return str(stepify(round(value)/1000000,1)) + "M"
	elif (value < 10000000000):
		return str(stepify(round(value)/1000000000,0.01)) + "G"
	elif (value < 100000000000):
		return str(stepify(round(value)/1000000000,0.1)) + "G"
	elif (value < 1000000000000):
		return str(stepify(round(value)/1000000000,1)) + "G"
	else:
		return "way too much"

func _exit_tree():
	nc.remove_observer(self,"Antimatter")
	nc.remove_observer(self,"LEVEL_END")

func handleNotification(observer,notificationName,notificationData):
	if (notificationName == "Antimatter"):
		antimatter += notificationData
	if (notificationName == "LEVEL_END"):
		if (PersoGlobal.currentNumberOfBuilding == 0):
			$CenterBuildings.visible = true
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding1Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 1):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding2Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 2):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding3Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 3):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding4Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 4):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding5Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 5):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding6Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 6):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding7Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 7):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding8Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1
		elif (PersoGlobal.currentNumberOfBuilding == 8):
			$CenterBuildings/ScrollContainer/VerticalBuildings/VBuilding9Container.visible = true
			PersoGlobal.currentNumberOfBuilding += 1

func _letsGoAntimatter():
	totalAntimatter.text = str("You have ", _format(antimatter))
	antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))

func _physics_process(delta):
	pass
	
func _on_CurrencyTimer_timeout():
	antimatter += antimatterPerSec
	totalAntimatter.text = str("You have ", _format(antimatter))
	if (antimatter == 3 && firstTime == true):
		TurnScreenOn.visible = true
	if (antimatter >= 5 && firstTime == false && secondTime == true):
		CreateRobot.visible = true;

func _on_BuyBuilding1_pressed():
	if (antimatter >= priceBuilding1):
		antimatter -= priceBuilding1
		antimatterPerSec += revenueBuilding1
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding1 += revenueBuilding1
		priceBuilding1 = priceBuilding1 * pow(bFactor, quantityBuilding1)
		quantityBuilding1 += 1
		PriceBuilding1.text = str(_format(priceBuilding1))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
		RevenueBuilding1.text = str("Revenue : ", _format(totalRevenueBuilding1))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))

func _on_BuyBuilding2_pressed():
	if (antimatter >= priceBuilding2):
		antimatter -= priceBuilding2
		antimatterPerSec += revenueBuilding2
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding2 += revenueBuilding2
		priceBuilding2 = priceBuilding2 * pow(bFactor, quantityBuilding2)
		quantityBuilding2 += 1
		PriceBuilding2.text = str(_format(priceBuilding2))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
		RevenueBuilding2.text = str("Revenue : ", _format(totalRevenueBuilding2))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))

func _on_BuyBuilding3_pressed():
	if (antimatter >= priceBuilding3):
		antimatter -= priceBuilding3
		antimatterPerSec += revenueBuilding3
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding3 += revenueBuilding3
		priceBuilding3 = priceBuilding3 * pow(bFactor, quantityBuilding3)
		quantityBuilding3 += 1
		PriceBuilding3.text = str(_format(priceBuilding3))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
		RevenueBuilding3.text = str("Revenue : ", _format(totalRevenueBuilding3))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding4_pressed():
	if (antimatter >= priceBuilding4):
		antimatter -= priceBuilding4
		antimatterPerSec += revenueBuilding4
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding4 += revenueBuilding4
		priceBuilding4 = priceBuilding4 * pow(bFactor, quantityBuilding4)
		quantityBuilding4 += 1
		PriceBuilding4.text = str(_format(priceBuilding4))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding4.text = str("Quantity : ", quantityBuilding4)
		RevenueBuilding4.text = str("Revenue : ", _format(totalRevenueBuilding4))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding5_pressed():
	if (antimatter >= priceBuilding5):
		antimatter -= priceBuilding5
		antimatterPerSec += revenueBuilding5
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding5 += revenueBuilding5
		priceBuilding5 = priceBuilding5 * pow(bFactor, quantityBuilding5)
		quantityBuilding5 += 1
		PriceBuilding5.text = str(_format(priceBuilding5))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding5.text = str("Quantity : ", quantityBuilding5)
		RevenueBuilding5.text = str("Revenue : ", _format(totalRevenueBuilding5))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding6_pressed():
	if (antimatter >= priceBuilding6):
		antimatter -= priceBuilding6
		antimatterPerSec += revenueBuilding6
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding6 += revenueBuilding6
		priceBuilding6 = priceBuilding6 * pow(bFactor, quantityBuilding6)
		quantityBuilding6 += 1
		PriceBuilding6.text = str(_format(priceBuilding6))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding6.text = str("Quantity : ", quantityBuilding6)
		RevenueBuilding6.text = str("Revenue : ", _format(totalRevenueBuilding6))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding7_pressed():
	if (antimatter >= priceBuilding7):
		antimatter -= priceBuilding7
		antimatterPerSec += revenueBuilding7
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding7 += revenueBuilding7
		priceBuilding7 = priceBuilding7 * pow(bFactor, quantityBuilding7)
		quantityBuilding7 += 1
		PriceBuilding7.text = str(_format(priceBuilding7))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding7.text = str("Quantity : ", quantityBuilding7)
		RevenueBuilding7.text = str("Revenue : ", _format(totalRevenueBuilding7))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding8_pressed():
	if (antimatter >= priceBuilding8):
		antimatter -= priceBuilding8
		antimatterPerSec += revenueBuilding8
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding8 += revenueBuilding8
		priceBuilding8 = priceBuilding8 * pow(bFactor, quantityBuilding8)
		quantityBuilding8 += 1
		PriceBuilding8.text = str(_format(priceBuilding8))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding8.text = str("Quantity : ", quantityBuilding8)
		RevenueBuilding8.text = str("Revenue : ", _format(totalRevenueBuilding8))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))
		
func _on_BuyBuilding9_pressed():
	if (antimatter >= priceBuilding9):
		antimatter -= priceBuilding9
		antimatterPerSec += revenueBuilding9
		PersoGlobal.antimatterPerSec = antimatterPerSec
		totalRevenueBuilding9 += revenueBuilding9
		priceBuilding9 = priceBuilding9 * pow(bFactor, quantityBuilding9)
		quantityBuilding9 += 1
		PriceBuilding9.text = str(_format(priceBuilding9))
		totalAntimatter.text = str("You have ", _format(antimatter))
		NumberBuilding9.text = str("Quantity : ", quantityBuilding9)
		RevenueBuilding9.text = str("Revenue : ", _format(totalRevenueBuilding9))
		antimatterPerSeconds.text = str("You earn ", _format(antimatterPerSec))

func _on_ImproveMeleeButton_pressed():
	if (antimatter >= improveMeleePrice):
		antimatter -= improveMeleePrice
		improveMeleePrice *= pow(coeffWeapon, PersoGlobal.meleeDamage/10)
		PersoGlobal.meleeDamage += 10
		if (PersoGlobal.indexMelee < 3):
			PersoGlobal.dmgTillNextWeaponCac -= 10
			if (PersoGlobal.dmgTillNextWeaponCac <= 0):
				PersoGlobal.dmgTillNextWeaponCac = PersoGlobal.dmgBetweenWeapons
				PersoGlobal.indexMelee += 1
				if (PersoGlobal.indexMelee == 3):
					BeforeNextMeleeWeapon.text = "You reached the last weapon"
					LabelAvantBeforeNextMelee.visible = false
				else:
					BeforeNextMeleeWeapon.text = str(PersoGlobal.dmgTillNextWeaponCac)
				PersoGlobal.currentWeaponCacName = PersoGlobal.meleeWeapons[PersoGlobal.indexMelee]
				if (PersoGlobal.indexMelee == 3):
					CacWeaponName.text = "Antimatter Sword"
				else:
					CacWeaponName.text = PersoGlobal.currentWeaponCacName
				if (PersoGlobal.currentWeaponCacName == "Spear"):
					CacWeaponSprite.texture = spriteSpear
				if (PersoGlobal.currentWeaponCacName == "Sword"):
					CacWeaponSprite.texture = spriteSword
				if (PersoGlobal.currentWeaponCacName == "Axe"):
					CacWeaponSprite.texture = spriteAxe
				if (PersoGlobal.currentWeaponCacName == "BigSword"):
					CacWeaponSprite.texture = spriteBigSword
		MeleeValue.text = str(PersoGlobal.meleeDamage , " dmg")
		PriceImproveMelee.text = str(_format(improveMeleePrice))
		
		

func _on_ImproveDistanceButton_pressed():
	if (antimatter >= improveDistancePrice):
		antimatter -= improveDistancePrice
		improveDistancePrice *= pow(coeffWeapon, PersoGlobal.distanceDamage/10)
		PersoGlobal.distanceDamage += 10
		if (PersoGlobal.indexDistance < 3):
			PersoGlobal.dmgTillNextWeaponDistance -= 10
			if (PersoGlobal.dmgTillNextWeaponDistance <= 0):
				PersoGlobal.dmgTillNextWeaponDistance = PersoGlobal.dmgBetweenWeapons
				PersoGlobal.indexDistance += 1
				if (PersoGlobal.indexDistance == 3):
					BeforeNextDistanceWeapon.text = "You reached the last weapon"
					LabelAvantBeforeNextDistance.visible = false
				else:
					BeforeNextDistanceWeapon.text = str(PersoGlobal.dmgTillNextWeaponDistance)
				PersoGlobal.currentWeaponDistanceName = PersoGlobal.distanceWeapons[PersoGlobal.indexDistance]
				DistanceWeaponName.text = PersoGlobal.currentWeaponDistanceName
				if (PersoGlobal.currentWeaponDistanceName == "Handgun"):
					DistanceWeaponSprite.texture = spriteHandgun
				if (PersoGlobal.currentWeaponDistanceName == "Laser Gun"):
					DistanceWeaponSprite.texture = spriteLaserHandgun
				if (PersoGlobal.currentWeaponDistanceName == "Laser Rifle"):
					DistanceWeaponSprite.texture = spriteLaserRifle
				if (PersoGlobal.currentWeaponDistanceName == "Rifle"):
					DistanceWeaponSprite.texture = spriteRifle
		DistanceValue.text = str(PersoGlobal.distanceDamage , " dmg")
		PriceImproveDistance.text = str(_format(improveDistancePrice))

func _on_1AmmoButton_pressed():
	if (antimatter >= ammoPrice):
		antimatter -= ammoPrice
		ammoPrice *= pow(coeffAmmo, PersoGlobal.numberOfAmmoMax/5)
		PersoGlobal.numberOfAmmoMax += 5
		NumberOfAmmo.text = str(PersoGlobal.numberOfAmmoMax, " Ammo")
		PriceAmmo.text = str(_format(ammoPrice))

func _on_ImprovePVButton_pressed():
	if (PersoGlobal.pvMax == 3):
		if (antimatter >= heartPrice):
			antimatter -= heartPrice
			PersoGlobal.pvMax += 1
			heartPrice *= 1000
			Heart4.visible = true
			PriceHeart.text = str(heartPrice)
	elif (PersoGlobal.pvMax == 4):
		if (antimatter >= heartPrice):
			antimatter -= heartPrice
			PersoGlobal.pvMax += 1
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
