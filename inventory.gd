extends Node



func _on_quit_pressed():
	get_tree().quit()


func _on_menu_pressed():
	if $inventory.visible:
		$inventory.visible = false
	else:
		$inventory.visible = true
