@icon("res://assets/dna1.svg")
class_name enemyDNA extends Node


var initial = GameData.enemyInitialDNA[get_parent().type]
@onready var DNA = initial.duplicate()


func _ready():
	pass

func apply_plasmids():
	for plasmid in get_children():
		for key in plasmid.fragment:
			if DNA.has(key):
				plasmid.apply_gene(DNA, key)
			else:
				print("Plasmid carries gene not present in DNA!")
				

var multipliedGenes = {}
func multiply_modifier_used(key): # if a gene is multiplied more than once, it is set to 1
	multipliedGenes[key] = multipliedGenes[key] + 1 if multipliedGenes.has(key) else 1
	
	if multipliedGenes[key] > 1:
		DNA[key] = 1
	
