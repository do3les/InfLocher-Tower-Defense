extends Node

var schwierigkeitsgrad = 2
var damageMultiplier
var attackSpeedMultiplier

func _ready():
	set_multipliers()

func set_multipliers():
	if schwierigkeitsgrad == 1:
		damageMultiplier = 1.25
		attackSpeedMultiplier = 0.75
	if schwierigkeitsgrad == 2:
		damageMultiplier = 1
		attackSpeedMultiplier = 1
	if schwierigkeitsgrad == 3:
		damageMultiplier = 0.75
		attackSpeedMultiplier = 1.5
