extends RakugoVar
class_name CharacterObject

var parameters_names: Array = [
	"name",
	"color",
	"prefix",
	"suffix",
	"avatar",
	"icon",
	"stats",
	"kind",
	"mkind",
	"mcolumns",
	"manchor"
	]

var _color := Color("#ffffff")
var _avatar: String

var name		:= ""
var prefix		:= ""
var suffix	 	:= ""
var icon		:= ""
var kind	 	:= ""
var mkind	 	:= ""
var mcolumns 	:= 0
var manchor	 	:= ""
var stats		:= {}

var color: String = "#ffffff" setget _set_color, _get_color
var avatar setget _set_avatar, _get_avatar

func _init(var_id: String, var_value: Dictionary
		).(var_id, var_value, Rakugo.Type.CHARACTER) -> void:
	
	if not ("name" in _value):
		_value["name"] = name
	
	if not ("color" in _value):
		_value["color"] = _color.to_html()
	
	if not ("prefix" in _value):
		_value["prefix"] = prefix
	
	if not ("suffix" in _value):
		_value["suffix"] = suffix
	
	if not ("avatar" in _value):
		_value["avatar"] = ""
	
	if not ("icon" in _value):
		_value["icon"] = ""

	if not ("kind" in _value):
		_value["kind"] = Rakugo.default_kind

	if not ("mkind" in _value):
		_value["mkind"] = Rakugo.default_mkind

	if not ("mcolumns" in _value):
		_value["mcolumns"] = Rakugo.default_mcolumns

	if not ("manchor" in _value):
		_value["manchor"] = Rakugo.default_manchor

	if not ("stats" in _value):
		_value["stats"] = stats

	_set_value(_value)


func _set_color(vcolor: String) -> void:
	_color = Color(vcolor)


func _get_color() -> String:
	return _color.to_html()


func _set_avatar(vavatar: Resource) -> void:
	_avatar = vavatar.resource_path


func _get_avatar() -> String:
	return _avatar


func _set_value(_value := {}) -> void:
	dict2character(_value)


func _get_value() -> Dictionary:
	return character2dict()


func say(parameters := {}) -> void:
	parameters["who"] = _id
	Rakugo.say(parameters)


func ask(parameters := {}) -> void:
	parameters["who"] = _id
	Rakugo.ask(parameters)


func menu(parameters := {}) -> void:
	parameters["who"] = _id
	Rakugo.menu(parameters)


func show(parameters := {"state": []}) -> void:
	Rakugo.show(_id, parameters)


func hide() -> void:
	Rakugo.hide(_id)


func parse_name() -> String:
	var ncharacter = ""

	if name != "":
		if Rakugo.markup == "bbcode":
			ncharacter = "{color=#" + color + "}"
			ncharacter += name
			ncharacter += "{/color}"

		if Rakugo.markup == "renpy":
			ncharacter = "[color=#" + color + "]"
			ncharacter += name
			ncharacter += "[/color]"

	return ncharacter


func parse_what(what: String) -> String:
	return prefix + what + suffix


func character2dict() -> Dictionary:
	var dict = {}
	dict["name"]		= name
	dict["color"]		= color
	dict["prefix"]		= prefix
	dict["suffix"]		= suffix
	dict["icon"]		= icon
	dict["avatar"]		= _avatar
	dict["kind"]		= kind
	dict["mkind"]		= mkind
	dict["mcolumns"]	= mcolumns
	dict["manchor"]		= manchor
	dict["stats"]		= stats

	return dict


func dict2character(dict: Dictionary) -> void:
	if dict.has("name"):
		name = dict.name

	if dict.has("color"):
		color = dict.color

	if dict.has("prefix"):
		prefix = dict.prefix

	if dict.has("suffix"):
		suffix = dict.suffix
	
	if dict.has("icon"):
		icon = dict.icon
	
	if dict.has("avatar"):
		_avatar = dict.avatar

	if dict.has("kind"):
		kind = dict.kind

	if dict.has("mkind"):
		mkind = dict.mkind

	if dict.has("mcolumns"):
		mcolumns = dict.mcolumns

	if dict.has("manchor"):
		manchor = dict.manchor

	if dict.has("stats"):
		stats = dict.stats


func parse_text(text: String, open: String, close: String) -> String:
	text = .parse_text(text, open, close)

	for k in character2dict().keys():
		var sa = open +  _id + "." + k + close
		var r = _value[k]

		if k == "name":
			r = parse_name()

		if text.find(sa) == -1:
			continue # no variable in this string

		text = text.replace(sa, r)

	return text
