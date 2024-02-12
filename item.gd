extends Node2D

@onready var stick_class = preload("res://items/stick.gd").new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var object;
	if randi() % 2 == 0:
		object = stick_class
		#$TextureRect.texture = load("res://graphics/sowrd.png")
	else:
		object = stick_class
	$TextureRect.texture = object.get_texture()
	
func get_item():
	return stick_class


	
		
