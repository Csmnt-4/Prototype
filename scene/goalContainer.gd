extends VBoxContainer

@onready var mushroomText = $MushroomTxt
@onready var lettuceText = $LettuceTxt
@onready var cheeseText = $CheeseTxt
@onready var tomatoTxt = $TomatoTxt

var mushroomKilled = 0
var mushroomGoal = 3
var lettuceKilled = 0
var lettuceGoal = 3
var cheeseKilled = 0
var cheeseGoal = 3
var tomatoKilled = 0
var tomatoGoal = 3

signal on_goal_done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enemy_death(name):
	print("enemy_death_trigger " + name)
	if (name.contains("Mushroom")):
		mushroomKilled += 1
		mushroomText.set_text("Mushroom: " + str(mushroomKilled) + "/" + str(mushroomGoal))
	elif name.contains("Lettuce"):
		lettuceKilled += 1
		lettuceText.set_text("Lettuce: " + str(lettuceKilled) + "/" + str(lettuceGoal))
	elif name.contains("Cheese"):
		cheeseKilled += 1
		cheeseText.set_text("Cheese: " + str(cheeseKilled) + "/" + str(cheeseGoal))
	elif name.contains("Tomato"):
		tomatoKilled += 1
		tomatoTxt.set_text("Tomatoes: " + str(tomatoKilled) + "/" + str(tomatoGoal))

	if (mushroomKilled >= mushroomGoal and \
		lettuceKilled >= lettuceGoal and \
		cheeseKilled >= cheeseGoal and \
		tomatoKilled >= tomatoGoal):
			on_goal_done.emit()

