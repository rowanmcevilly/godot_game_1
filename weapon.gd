extends Marker2D

var textures = [preload("res://graphics/diamond.png"), preload("res://graphics/gold.jpeg")]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("weapon_tex").texture = textures[0]

func _input(event):
	if event is InputEventKey:
		if event.is_pressed:
			if int(event.as_text_key_label()) < (textures.len - 1) && int(event.as_text_key_label()) > 0:
				print(event.as_text_key_label())
				get_node("weapon_tex").texture = textures[int(event.as_text_key_label())]
