extends Control


onready var CenterIntroduction = $CenterIntroduction

onready var totalAntimatter = $CenterAntimatter/VerticalAntimatter/HBoxContainer/TotalAntimatter
onready var antimatterPerSeconds = $CenterAntimatter/VerticalAntimatter/HBoxContainer2/AntimatterPerSeconds

onready var TurnScreenOn = $CenterAntimatter/VerticalAntimatter/TurnOnScreen

var firstTime = true
var secondTime = true

onready var CreateRobot = $CenterAntimatter/VerticalAntimatter/CreateRobot
onready var CenterRobot = $CenterRobot

# VARIABLES BUILDING
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
# --------------------

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

var priceBuilding4 = 200
var revenueBuilding4 = 400
var quantityBuilding4 = 0
var totalRevenueBuilding4 = 0

var heartPrice = 10
var improveMeleePrice = 1
var improveDistancePrice = 1
var ammoPrice = 1

var spriteHandgun = load("res://assets/images/Armes/Distance/HandgunIncrementalScreen.png")
var spriteLaserHandgun = load("res://assets/images/Armes/Distance/HandgunIncrementalScreen.png")
var spriteLaserRifle = load("res://assets/images/Armes/Distance/HandgunIncrementalScreen.png")
var spriteRifle = load("res://assets/images/Armes/Distance/HandgunIncrementalScreen.png")

var spriteSpear = load("res://icon.png")
var spriteSword = load("res://icon.png")
var spriteAxe = load("res://icon.png")
var spriteBigSword = load("res://icon.png")
	
func _ready():
	nc.add_observer(self, "Antimatter","handleNotification")
	NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
	RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
	PriceBuilding1.text = str(priceBuilding1)
	PriceBuilding2.text = str(priceBuilding2)
	NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
	RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
	PriceBuilding3.text = str(priceBuilding3)
	NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
	RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
	PriceBuilding4.text = str(priceBuilding4)
	NumberBuilding4.text = str("Quantity : ", quantityBuilding4)
	RevenueBuilding4.text = str("Revenue : ", totalRevenueBuilding4)
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
	DistanceWeaponName.text = PersoGlobal.currentWeaponDistanceName
	if (PersoGlobal.currentWeaponDistanceName == "Handgun"):
		DistanceWeaponSprite.texture = spriteHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Laser Gun"):
		DistanceWeaponSprite.texture = spriteLaserHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Laser Rifle"):
		DistanceWeaponSprite.texture = spriteHandgun
	if (PersoGlobal.currentWeaponDistanceName == "Rifle"):
		DistanceWeaponSprite.texture = spriteRifle
		
		
	

func _exit_tree():
	nc.remove_observer(self,"Antimatter")

func handleNotification(observer,notificationName,notificationData):
	if (notificationName == "Antimatter"):
		antimatter += notificationData

func _letsGoAntimatter():
	totalAntimatter.text = str("You have ", antimatter)
	antimatterPerSeconds.text = str("You earn ", antimatterPerSec)

func _physics_process(delta):
	pass
	
func _on_CurrencyTimer_timeout():
	antimatter += antimatterPerSec
	totalAntimatter.text = str("You have ", antimatter)
	if (antimatter == 3 && firstTime == true):
		TurnScreenOn.visible = true
	if (antimatter >= 5 && firstTime == false && secondTime == true):
		CreateRobot.visible = true;

func _on_BuyBuilding1_pressed():
	if (antimatter >= priceBuilding1):
		antimatter -= priceBuilding1
		antimatterPerSec += revenueBuilding1
		totalRevenueBuilding1 += revenueBuilding1
		quantityBuilding1 += 1
		priceBuilding1 *= 2
		PriceBuilding1.text = str(priceBuilding1)
		totalAntimatter.text = str("You have ", antimatter)
		NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
		RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec)

func _on_BuyBuilding2_pressed():
	if (antimatter >= priceBuilding2):
		antimatter -= priceBuilding2
		antimatterPerSec += revenueBuilding2
		totalRevenueBuilding2 += revenueBuilding2
		quantityBuilding2 += 1
		priceBuilding2 *= 2
		PriceBuilding2.text = str(priceBuilding2)
		totalAntimatter.text = str("You have ", antimatter)
		NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
		RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec)

func _on_BuyBuilding3_pressed():
	if (antimatter >= priceBuilding3):
		antimatter -= priceBuilding3
		antimatterPerSec += revenueBuilding3
		totalRevenueBuilding3 += revenueBuilding3
		quantityBuilding3 += 1
		priceBuilding3 *= 2
		PriceBuilding3.text = str(priceBuilding3)
		totalAntimatter.text = str("You have ", antimatter)
		NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
		RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec)
		
func _on_BuyBuilding4_pressed():
	if (antimatter >= priceBuilding4):
		antimatter -= priceBuilding4
		antimatterPerSec += revenueBuilding4
		totalRevenueBuilding4 += revenueBuilding4
		quantityBuilding4 += 1
		priceBuilding4 *= 2
		PriceBuilding4.text = str(priceBuilding4)
		totalAntimatter.text = str("You have ", antimatter)
		NumberBuilding4.text = str("Quantity : ", quantityBuilding4)
		RevenueBuilding4.text = str("Revenue : ", totalRevenueBuilding4)
		antimatterPerSeconds.text = str("You earn ", antimatterPerSec)

func _on_ImproveMeleeButton_pressed():
	if (antimatter >= improveMeleePrice):
		antimatter -= improveMeleePrice
		PersoGlobal.meleeDamage += 10
		improveMeleePrice *= 2
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
		PriceImproveMelee.text = str(improveMeleePrice)
		
		

func _on_ImproveDistanceButton_pressed():
	if (antimatter >= improveDistancePrice):
		antimatter -= improveDistancePrice
		PersoGlobal.distanceDamage += 10
		improveDistancePrice *= 2
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
					DistanceWeaponSprite.texture = spriteHandgun
				if (PersoGlobal.currentWeaponDistanceName == "Rifle"):
					DistanceWeaponSprite.texture = spriteRifle
		DistanceValue.text = str(PersoGlobal.distanceDamage , " dmg")
		PriceImproveDistance.text = str(improveDistancePrice)

func _on_1AmmoButton_pressed():
	if (antimatter >= ammoPrice):
		antimatter -= ammoPrice
		PersoGlobal.numberOfAmmoMax += 1
		ammoPrice *= 2
		NumberOfAmmo.text = str(PersoGlobal.numberOfAmmoMax, " Ammo")
		PriceAmmo.text = str(ammoPrice)

func _on_ImprovePVButton_pressed():
	if (PersoGlobal.pvMax == 3):
		if (antimatter >= heartPrice):
			antimatter -= heartPrice
			PersoGlobal.pvMax += 1
			heartPrice *= 1000
			Heart4.visible = true
			PriceHeart.text = str(heartPrice)
	if (PersoGlobal.pvMax == 4):
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
