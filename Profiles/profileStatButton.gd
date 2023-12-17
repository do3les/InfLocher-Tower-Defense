extends OptionButton

var profleStats
var value
var lastId = 0

func _ready():
	add_separator("Stats")
	addStats()
	select(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_text_backspace") == true:
		refresh()

func addStats():
	for stat in ProfileManager.profileData:
		lastId += 1;
		value = ProfileManager.profileData[stat]
		add_item(stat + ": " + str(value))

func refresh():
	remove_all_items()
	lastId = 0
	addStats()
	select(0)


func remove_all_items():
	while lastId > 0:
		remove_item(lastId)
		lastId -= 1
