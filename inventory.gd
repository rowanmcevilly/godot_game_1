extends Node2D

const slot_class = preload("res://slot.gd")
const world_class = preload("res://world.tscn")
@onready var inventory_slots = $menuGUI/ColorRect2/GridContainer
var holding_item = null

func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))

func slot_gui_input(event: InputEvent, slot: slot_class):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
			if holding_item != null:
				if !slot.item:
					slot.put_in_slot(holding_item)
					holding_item = null
				else:
					var temp_item = slot.item
					slot.pick_from_slot()
					temp_item.global_position = event.global_position
					slot.put_in_slot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pick_from_slot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()

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

func _on_quit_pressed():
	get_tree().quit()
