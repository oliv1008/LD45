extends Node

var antimatterPerSec = 1
var meleeDamage = 10
var distanceDamage = 10
var pv = 3
var pvMax = 3
var numberOfAmmoMax = 10
var ammoLeft = numberOfAmmoMax
var ennemiesLeft = 0
var currentWeaponCacName = "Spear"
var currentWeaponDistanceName = "Handgun"
var dmgTillNextWeaponCac = 10
var dmgTillNextWeaponDistance = 10
var dmgBetweenWeapons = 10
var currentNumberOfBuilding = 0
var viewportARPG

var indexMelee = 0
var meleeWeapons = ["Spear", "Sword", "Axe", "BigSword"]
var indexDistance = 0
var distanceWeapons = ["Handgun", "Rifle", "Laser Gun", "Laser Rifle"]

func _ready():
	pass 