@icon("res://assets/dna1.svg")
class_name enemyDNA extends Node

@export var enemyType = "base"
var origin = GameData.enemyInitialDNA[enemyType].duplicate()
@onready var DNA = origin.duplicate()


func _ready():
	pass

func apply_plasmids(): # called when enemy is set up
	for plasmid in get_children():
		for key in plasmid.fragment:
			if DNA.has(key):
				plasmid.apply_gene(DNA, key)
				plasmid.apply_gene(origin, key) # origin remains as a "backup" of the original values
			else:
				print("Plasmid carries gene not present in DNA!")
				

var multipliedGenes = {}
func multiply_modifier_used(key): # if a gene is multiplied more than once, it is set to 1
	multipliedGenes[key] = multipliedGenes[key] + 1 if multipliedGenes.has(key) else 1
	
	if multipliedGenes[key] > 2:
		DNA[key] = 1
	
