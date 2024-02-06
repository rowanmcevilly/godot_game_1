extends Panel

var itemScene = preload("res://item.tscn")
var item = null
# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		item = itemScene.instantiate()
		add_child(item)
