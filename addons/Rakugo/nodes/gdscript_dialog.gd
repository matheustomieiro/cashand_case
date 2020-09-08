extends Node
class_name GDScriptDialog, "res://addons/Rakugo/icons/gdscript.svg"

export (Array, String) var begin_from = ["", ""]
export (Array, String) var dialogs_names
export var start_from_state = 0

var state = 0
var dialog_init = false

func _ready() -> void:
	if begin_from.size() == 2:

		var b = begin_from.duplicate()
		b.insert(1, name)

		if not Rakugo.is_connected("begin", Rakugo, "on_begin"):
			Rakugo.connect("begin", Rakugo, "on_begin", b)

	add_dialogs()


func add_dialogs() -> void:
	for dn in dialogs_names:
		if dn:
			Rakugo.add_dialog(self, dn)


func get_story_state() -> int:
	return Rakugo.story_state


func next_state() -> bool:
	state += 1
	return state - 1 == get_story_state()


func story_step() -> void:
	Rakugo.story_step()


func check_dialog(node_name, dialog_name, check_for) -> bool:
	var result = true

	if node_name != name:
		result = false

	var real_name = name
	if name.begins_with("@"):
		real_name = name.split("@", false)[0]

	if node_name != real_name:
		result = false

	else:
		result = true

	if dialog_name != check_for:
		result = false

	state = start_from_state

	if result:
		if !dialog_init:
			Rakugo.debug([
					"check_dialog:", result,
					"(",'"'+name +'"', '"'+node_name+'"', '"'+real_name+'"', ")",
					"(", '"'+dialog_name+'"', '"'+check_for+'"', ")"
				])


	else:
		dialog_init = false

	return result


func define(var_name: String, value = null, save_included := true) -> RakugoVar:
	return Rakugo.define(var_name, value, save_included)


func ranged_var(var_name: String, start_value := 0.0, min_value := 0.0, max_value := 0.0) -> RakugoRangedVar:
	return Rakugo.ranged_var(var_name, start_value, min_value, max_value)


func character(character_id: String, parameters :={}) -> CharacterObject:
	return Rakugo.character(character_id, parameters)


func set_var(var_name: String, value) -> RakugoVar:
	return Rakugo.set_var(var_name, value)


func get_var(var_name: String) -> RakugoVar:
	return Rakugo.get_var(var_name)


func get_value(var_name: String):
	return Rakugo.get_value(var_name)


func subquest(subquest_id: String, parameters := {}) -> Subquest:
	return Rakugo.subquest(subquest_id, parameters)


func quest(quest_id: String, parameters :={}) -> Quest:
	return Rakugo.quest(quest_id, parameters)


func say(parameters: Dictionary) -> void:
	Rakugo.say(parameters)


func ask(parameters: Dictionary) -> void:
	Rakugo.ask(parameters)


func menu(parameters: Dictionary) -> void:
	if not ("node" in parameters):
		parameters["node"] = self

	Rakugo.menu(parameters)


func show(node_id: String, parameters := {"state": []}):
	Rakugo.show(node_id, parameters)


func hide(node_id: String) -> void:
	Rakugo.hide(node_id)


func notify(info: String, length: int = get_value("notify_time")) -> void:
	Rakugo.notify(info, length)


func play_anim( node_id: String, anim_name: String) -> void:
	Rakugo.play_anim(node_id, anim_name)


func stop_anim(node_id: String, reset := true) -> void:
	Rakugo.stop_anim(node_id, reset)


func play_audio(node_id: String, from_pos := 0.0) -> void:
	Rakugo.play_audio(node_id, from_pos)


func stop_audio(node_id: String) -> void:
	Rakugo.stop_audio(node_id)


func call_node(node_id: String, func_name: String, args := []) -> void:
	Rakugo.call_node(node_id, func_name, args)


func jump(scene_id: String, node_name: String, dialog_name: String) -> void:
	Rakugo.jump(scene_id, node_name, dialog_name)


func end_game() -> void:
	Rakugo.end_game()
