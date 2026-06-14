extends Node2D

@export var hexGenNode : Node2D
@export var hexCalculationsNode : Node2D

@export var currPlayerPosX : int = 0
@export var currPlayerPosY : int = 0

@export var initialPlayerPosSet : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if initialPlayerPosSet == false:
		_initial_player_pos()
		initialPlayerPosSet = true

	_player_input_action()
	_update_player_move()

func _initial_player_pos() -> void:
	currPlayerPosX = hexGenNode.playerPosX
	currPlayerPosY = hexGenNode.playerPosY

func _player_input_action() -> void:
	if Input.is_action_just_pressed("ui_nw"):
		if currPlayerPosX % 2 != 0:
			currPlayerPosX -= 1
		currPlayerPosY -= 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))
	elif Input.is_action_just_pressed("ui_ne"):
		if currPlayerPosX % 2 != 0:
			currPlayerPosX += 1
		currPlayerPosY -= 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))
	elif Input.is_action_just_pressed("ui_e"):
		currPlayerPosX += 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))
	elif Input.is_action_just_pressed("ui_se"):
		if currPlayerPosX % 2 != 0:
			currPlayerPosX += 1
		currPlayerPosY += 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))
	elif Input.is_action_just_pressed("ui_sw"):
		currPlayerPosX -= 1
		currPlayerPosY += 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))
	elif Input.is_action_just_pressed("ui_w"):
		currPlayerPosX -= 1
		print(str(currPlayerPosX) + ":" + str(currPlayerPosY))

func _update_player_move() -> void:
	hexGenNode.playerNode.position.x = hexCalculationsNode._hex_pos_x(currPlayerPosX, currPlayerPosY)
	hexGenNode.playerNode.position.y = hexCalculationsNode._hex_pos_y(currPlayerPosX, currPlayerPosY)
