extends Path2D
@export var enemy_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_start_wave_pressed():
	var enemy = enemy_scene.instantiate()
	
	add_child(enemy)
