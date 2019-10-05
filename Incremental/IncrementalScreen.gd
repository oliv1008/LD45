extends Control


onready var totalAntimatter = $CenterAntimatter/VerticalAntimatter/TotalAntimatter
onready var antimatterPerSeconds = $CenterAntimatter/VerticalAntimatter/AntimatterPerSeconds
onready var NumberBuilding1 = $CenterBuildings/VerticalBuildings/VBuilding1Container/HBuilding1Container2/NumberBuilding1
onready var RevenueBuilding1 = $CenterBuildings/VerticalBuildings/VBuilding1Container/HBuilding1Container2/RevenueBuilding1
onready var NumberBuilding2 = $CenterBuildings/VerticalBuildings/VBuilding2Container/HBuilding2Container2/NumberBuilding2
onready var RevenueBuilding2 = $CenterBuildings/VerticalBuildings/VBuilding2Container/HBuilding2Container2/RevenueBuilding2
onready var NumberBuilding3 = $CenterBuildings/VerticalBuildings/VBuilding3Container/HBuilding3Container2/NumberBuilding3
onready var RevenueBuilding3 = $CenterBuildings/VerticalBuildings/VBuilding3Container/HBuilding3Container2/RevenueBuilding3

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

func _ready():
	totalAntimatter.text = str("You have ", antimatter, " antimatter")
	antimatterPerSeconds.text = str("You win ", antimatterPerSec, " antimatter per seconds")

func _physics_process(delta):
	pass
	
func _on_CurrencyTimer_timeout():
	antimatter += antimatterPerSec
	totalAntimatter.text = str("You have ", antimatter, " antimatter")

func _on_BuyBuilding1_pressed():
	if (antimatter >= priceBuilding1):
		antimatter -= priceBuilding1
		antimatterPerSec += revenueBuilding1
		totalRevenueBuilding1 += revenueBuilding1
		quantityBuilding1 += 1
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding1.text = str("Quantity : ", quantityBuilding1)
		RevenueBuilding1.text = str("Revenue : ", totalRevenueBuilding1)
		antimatterPerSeconds.text = str("You win ", antimatterPerSec, " antimatter per seconds")

func _on_BuyBuilding2_pressed():
	if (antimatter >= priceBuilding2):
		antimatter -= priceBuilding2
		antimatterPerSec += revenueBuilding2
		totalRevenueBuilding2 += revenueBuilding2
		quantityBuilding2 += 1
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding2.text = str("Quantity : ", quantityBuilding2)
		RevenueBuilding2.text = str("Revenue : ", totalRevenueBuilding2)
		antimatterPerSeconds.text = str("You win ", antimatterPerSec, " antimatter per seconds")

func _on_BuyBuilding3_pressed():
	if (antimatter >= priceBuilding3):
		antimatter -= priceBuilding3
		antimatterPerSec += revenueBuilding3
		totalRevenueBuilding3 += revenueBuilding3
		quantityBuilding3 += 1
		totalAntimatter.text = str("You have ", antimatter, " antimatter")
		NumberBuilding3.text = str("Quantity : ", quantityBuilding3)
		RevenueBuilding3.text = str("Revenue : ", totalRevenueBuilding3)
		antimatterPerSeconds.text = str("You win ", antimatterPerSec, " antimatter per seconds")
