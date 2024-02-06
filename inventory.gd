extends Node



func _on_quit_pressed():
	get_tree().quit()


func _on_menu_pressed():
	if $menuGUI.visible:
		$menuGUI.visible = false
		$menu.visible = true
	else:
		$menuGUI.visible = true
		$menu.visible = false


func _on_back_pressed():
	if $menuGUI.visible:
		$menuGUI.visible = false
		$menu.visible = true
	else:
		$menuGUI.visible = true
		$menu.visible = false


func _on_inventory_pressed():
	pass # Replace with function body.
