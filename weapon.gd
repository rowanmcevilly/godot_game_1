extends Marker2D

var hotbar = preload("res://hotbar.gd")
var textures = [hotbar, preload("res://graphics/gold.jpeg")]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("weapon_tex").texture = textures[0]

func _input(event):
	if event is InputEventKey:
		if event.is_pressed:
			if int(event.as_text_key_label()) <= 3 && int(event.as_text_key_label()) >= 1:
				if int(event.as_text_key_label()):
					var item = find_parent("world").find_child("hotbar").get_hotbar_item(int(event.as_text_key_label()))
					print(item.find_child("TextureRect").texture)
					get_node("weapon_tex").texture = item.find_child("TextureRect").texture
