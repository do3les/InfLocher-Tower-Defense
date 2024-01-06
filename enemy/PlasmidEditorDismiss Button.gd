extends Button

var state = false
var offset = 248
@export var speed = 500
const MAX_OFFSET = 248

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == true:
		text = "v"
	else:
		text = "^"
	
	if state == true and offset > 0:
		offset -= delta * speed
	if state == false and offset < MAX_OFFSET:
		offset += delta * speed
	
	get_parent().position.y = 816 + offset
	self.position.y = 192 - offset


func _on_pressed():
	state = !state
