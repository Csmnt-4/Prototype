extends Node2D

var weapon: Area2D

var currentWeapon = 0
var weaponCount = 0

func _ready():
	if get_children().is_empty(): return
	weaponCount = get_children().size()
	weapon = get_children()[currentWeapon]
	
	for w in get_children():
		if w != weapon:
			print_debug("disabling weapon")
			w.hide()
	
func enable():
	if !weapon: return
	#visible = true
	#weapon.enable()
	
func disable():
	if !weapon: return
	#visible = flase
	weapon.disable()
	
func change_weapon():
	if currentWeapon >= weaponCount - 1:
		currentWeapon = 0;
	else:
		currentWeapon = currentWeapon + 1
	weapon.hide()
	weapon = get_children()[currentWeapon]
	weapon.show()
	print_debug("current weapon: " + str(currentWeapon) + "weapon count " + str(weaponCount))

func primary_attack():
	if !weapon: return
	weapon.primary_attack()

func secondary_attack():
	if !weapon: return
	weapon.secondary_attack()
