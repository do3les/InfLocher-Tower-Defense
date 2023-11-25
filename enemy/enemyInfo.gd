extends Label

@onready var DNA = get_parent().get_parent().get_node("DNA").DNA


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = JSON.stringify(DNA, "\t")
	if Input.is_key_pressed(KEY_BACKSPACE):
		queue_free()
