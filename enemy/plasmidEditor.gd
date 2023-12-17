extends Node2D

var index = 0
@onready var plasmids = get_node("/root/Level1/EnemyGenePool").get_children()
@onready var current = plasmids[index]

func _ready():
	$PlasmidEdit.text = JSON.stringify(current.fragment, "\t")
	update()


func update():
	plasmids = get_node("/root/Level1/EnemyGenePool").get_children()
	$PlasmidList.clear()
	for plasmid in plasmids:
		$PlasmidList.add_item(plasmid.name)
	await get_tree().create_timer(1.0).timeout
	update()


func _process(delta):
	pass


func _on_plasmid_list_item_activated(i):
	index = i
	current = plasmids[index]
	$PlasmidEdit.text = JSON.stringify(current.fragment, "\t")


func _on_confirm_button_pressed():
	current.fragment = JSON.parse_string($PlasmidEdit.text)
