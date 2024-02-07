extends Panel

var default_tex = preload("res://graphics/icon.svg")
var empty_tex = preload("res://graphics/icon.svg")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var itemScene = preload("res://item.tscn")
var item = null
# Called when the node enters the scene tree for the first time.
func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_tex
	empty_style.texture = empty_tex
	if randi() % 2 == 0:
		item = itemScene.instantiate()
		add_child(item)
	refresh_styles()
	
func refresh_styles():
	if item == null:
		set("custom_styles/panel", empty_style)
	else:
		set("custom_styles/panel", default_style)
		
func pick_from_slot():
	remove_child(item)
	var inventoryNode = find_parent("inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_styles()
	
func put_in_slot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_styles()
