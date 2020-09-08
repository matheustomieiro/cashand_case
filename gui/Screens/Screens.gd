tool
extends RakugoControl

export onready var nav_panel: Node = $Navigation
export var nav_parent_path := "Navigation/ScrollContainer/HBoxContainer"
export var nav_path: NodePath = nav_parent_path + "/VBoxContainer"
export var viewport_path := "/root/Window/ViewportContainer"
export onready var scrollbar := get_node(nav_parent_path + "/VScrollBar")
export var use_back_button := false
export onready var back_button: Button = $BackButton
export onready var unpause_timer: Timer = $UnpauseTimer
export onready var qno_button = $QuitBox/HBoxContainer/No
export onready var qyes_button = $QuitBox/HBoxContainer/Yes

var current_node: Node = self
var viewport_con : Control

onready var new_game_button: Button = get_page("NewGame")
onready var continue_button: Button = get_page("Continue")
onready var return_button: Button = get_page("Return")
onready var save_button: Button = get_page("Save")
onready var history_button: Button = get_page("History")
onready var quests_button: Button = get_page("Quests")
onready var load_button: Button = get_page("Load")
onready var options_button: Button = get_page("Options")
onready var about_button: Button = get_page("About")
onready var help_button: Button = get_page("Help")
onready var quit_button: Button = get_page("Quit")

var blur_shader : ShaderMaterial

func get_page(node_name:String) -> Node:
	return get_node(str(nav_path).plus_file(node_name))


func get_viewport() -> Viewport:
	return viewport_con.get_node("Viewport") as Viewport


func _ready():
	if Engine.editor_hint:
		return

	viewport_con = get_node(viewport_path)
	blur_shader = viewport_con.material as ShaderMaterial

	get_tree().set_auto_accept_quit(false)
	connect("visibility_changed", self, "_on_visibility_changed")

	qno_button.connect("pressed", self, "_on_Return_pressed")
	qyes_button.connect("pressed", self, "_on_Yes_pressed")

	back_button.connect("pressed", self, "_on_back_button")

	new_game_button.connect("pressed", self, "_on_NewGame_pressed")
	continue_button.connect("pressed", self, "_on_Continue_pressed")
	return_button.connect("pressed", self, "_on_Return_pressed")
	save_button.connect("pressed", self, "_on_Save_pressed")
	history_button.connect("pressed", self, "_on_History_pressed")
	quests_button.connect("pressed", self, "_on_Quests_pressed")
	load_button.connect("pressed", self, "_on_Load_pressed")
	options_button.connect("pressed", self, "_on_Options_pressed")
	about_button.connect("pressed", self, "_on_About_pressed")
	help_button.connect("pressed", self, "_on_Help_pressed")
	quit_button.connect("pressed", self, "_on_Quit_pressed")
	Rakugo.connect("game_ended", self, "_on_game_end")

	var auto_save_path = str("user://" + Rakugo.save_folder + "/auto.res")

	if Rakugo.test_save:
		auto_save_path = str("res://" + Rakugo.save_folder + "/auto.tres")

	if not Rakugo.file.file_exists(auto_save_path):
		continue_button.hide()


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		_on_Quit_pressed()


func show_page(node):
	if not use_back_button:
		if current_node != self:
			current_node.hide()

	blur_shader.set_shader_param("radius", 5)
	current_node = node
	node.show()

	if use_back_button:
		nav_panel.hide()
		back_button.show()


func _on_back_button():
	current_node.hide()
	nav_panel.show()
	back_button.hide()


func save_menu(screenshot):
	save_button.pressed = true
	show_page($SlotBox)
	$SlotBox/Title.text = "Save"
	$SlotBox.savebox()
	$SlotBox.screenshot = screenshot
	show()


func load_menu():
	load_button.pressed = true
	show_page($SlotBox)
	$SlotBox/Title.text = "Load"
	$SlotBox.loadbox()
	show()


func history_menu():
	history_button.pressed = true
	show_page($HistoryBox)
	show()


func _on_visibility_changed():
	blur_shader.set_shader_param("radius", 0)
	if visible:
		
		if Rakugo.started:
			blur_shader.set_shader_param("radius", 5)
			save_button.disabled = !Rakugo.can_save

		get_tree().paused = true
		Rakugo.hide("InGameGUI")
		return

	Rakugo.show("InGameGUI")
	unpause_timer.start()
	yield(unpause_timer, "timeout")
	get_tree().paused = false


# # if press "Return" or "no" on quit page
func _on_Return_pressed():
	blur_shader.set_shader_param("radius", 0)

	if Rakugo.started:
		hide()
		unpause_timer.start()
		yield(unpause_timer, "timeout")
		return

	current_node.hide()


func _on_Load_pressed():
	load_menu()


func in_game():
	new_game_button.hide()
	continue_button.hide()
	return_button.show()
	save_button.show()
	history_button.show()
	quests_button.show()
	scrollbar.show()


func _on_game_end():
	new_game_button.show()
	continue_button.show()
	return_button.hide()
	save_button.hide()
	history_button.hide()
	quests_button.hide()
	scrollbar.hide()
	show()


func _on_NewGame_pressed():
	hide()
	in_game()
	Rakugo.start()
	Rakugo.emit_signal("begin")


func _on_History_pressed():
	history_menu()


func _on_Continue_pressed():
	if !Rakugo.loadfile("auto"):
		return

	in_game()
	hide()


func _on_Quests_pressed():
	quests_button.pressed = true
	show_page($QuestsBox)
	show()


# if press "yes" on quit page
func _on_Yes_pressed():
	if Rakugo.started and Rakugo.can_save:
		Rakugo.savefile("auto")
		Rakugo.save_global_history()

	settings.save_conf()
	get_tree().quit()


func _on_Quit_pressed():
	quests_button.pressed = true
	show_page($QuitBox)
	show()


func get_screenshot():
	return get_viewport().get_texture().get_data()


func _on_Save_pressed():
	hide()
	save_menu(get_screenshot())


func _on_Options_pressed():
	options_button.pressed = true
	show_page($OptionsBox)
	show()


func _on_About_pressed():
	show_page($AboutBox)
	show()


func _on_Help_pressed():
	OS.shell_open("https://rakugoteam.github.io/RakugoDocs-new/")


func _fullscreen_on_input(event):
	if !event.is_action_pressed("rakugo_fullscreen"):
		return

	if settings.window_fullscreen:
		settings.window_fullscreen = false
		settings.window_size = settings.default_window_size

	else:
		settings.window_fullscreen = true
		settings.window_size = OS.get_screen_size()


func _screenshot_on_input(event):
	if !event.is_action_pressed("rakugo_screenshot"):
		return

	var dir = Directory.new()
	var screenshots_dir = "user://screenshots"

	if !dir.dir_exists(screenshots_dir):
		dir.make_dir(screenshots_dir)

	var s = Rakugo.get_datetime_str().replace(":", " ")
	get_screenshot().save_png(screenshots_dir.plus_file(s + '.png'))


func _input(event):
	if Engine.editor_hint:
		return

	if event.is_action_pressed("ui_cancel"):
		if visible:
			_on_Return_pressed()

		elif use_back_button:
			show()

		else:
			_on_Options_pressed()

		return

	if Rakugo.can_alphanumeric:
		_fullscreen_on_input(event)
		_screenshot_on_input(event)
