extends RakugoVar
class_name NodeLink


var node : Node setget _set_node, _get_node
var _node : Node

func _init(var_id: String, var_type := Rakugo.Type.NODE, var_prefix := "node_link_").(
		var_id, {"node_path":""}, var_type, var_prefix) -> void:
	_node = Node.new()
	pass


func _set_node(n:Node):
	_set_value({"node_path": n.get_path()})


func _get_node()->Node:
	return _node.get_node(value)


func _set_value(dict: Dictionary) -> void:
	._set_value(dict)


func _get_value() -> Dictionary:
	return _value


func save_to(dict: Dictionary) -> void:
	if !save_included:
		return

	var save_value: Dictionary = _value.duplicate()
	save_value.erase("node_path")

	var save := {
		"value": save_value,
		"type": _type
	}

	dict[_id] = save

	Rakugo.debug(["saveing", _id])


func load_from(dict: Dictionary) -> void:
	dict["node_path"] = _value["node_path"]
	_value = dict
