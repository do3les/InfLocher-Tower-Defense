extends Node2D

@export var field = "don't forget to set this field!"
@onready var level = get_node("/root/Level")
var focus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = field


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !focus:
		$SpinBox.value = level[field]


func _on_spin_box_value_changed(value):
	level[field] = value


func _on_spin_box_focus_entered():
	focus = true


func _on_spin_box_focus_exited():
	focus = false
