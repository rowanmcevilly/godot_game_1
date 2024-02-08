extends GridContainer

var hotbar = []

func _ready():
	for hot in get_children():
		hotbar.append(hot.item)
	
	

func slot_change():
	hotbar = []
	for hot in get_children():
		hotbar.append(hot.item)
		
func get_hotbar_item(slot):
	return hotbar[slot-1]
