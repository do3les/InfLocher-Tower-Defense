@icon("res://assets/cycle.svg")
class_name enemyPlasmid extends Node

@export var fragment = {}
@export var weight = 0.0
@export var mutationStrength = 2
@export var modifierActionChangeChance = 0.05

func _ready():
	self.mutate(mutationStrength)
	


func mutate(factor, _seed=-1):
	if _seed == -1:
		randomize()
	else:
		seed(_seed)

	for key in fragment:
		var gene = fragment[key]
		
		match GameData.DNAformats[key]:
			"val":
				gene = gene + randf()*factor
			"mod": # should be of the form mod = ["type", val]
				gene[1] = gene[1] + randf()*factor
#				if randf() < modifierActionChangeChance: # this was a bad idea :(
#					if gene[0] == "+":
#						gene[0] = "*"
#					elif gene[0] == "*":
#						gene[0] = "+"
#					else:
#						# other modifiers could be "=", ...
#						print("Modifier action in gene not recognized!")
			"dict_mult":
				pass
			"dict_vals":
				pass
			
			"color":
				pass
			"shape":
				pass
			
			_:
				print("Gene type not recognized!")
				


func apply_gene(DNA, key):
	var gene = fragment[key]
	match GameData.DNAformats[key]:
		"val":
			pass
		"mod":
			if gene[0] == "+":
				DNA[key] += gene[1]
			elif gene[0] == "*":
				DNA[key] = DNA[key] * gene[1]
				get_parent().multiply_modifier_used(key)
			else:
				print("Modifier action in gene not recognized!")
		
		"dict_mult":
			pass
		"dict_vals":
			pass
		"color":
			DNA[key] = gene
		"shape":
			pass
	
		_:
			print("Gene type not recognized!")
