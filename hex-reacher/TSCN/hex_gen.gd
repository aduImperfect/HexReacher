extends Node2D

const GROUND_SCENE = preload("res://TSCN/ground.tscn")
const START_SCENE = preload("res://TSCN/start.tscn")
const GOAL_SCENE = preload("res://TSCN/goal.tscn")
const PLAYER_SCENE = preload("res://TSCN/player.tscn")
const WALL_SCENE = preload("res://TSCN/wall.tscn")
const COIN_SCENE = preload("res://TSCN/coin.tscn")
const ENEMY1_SCENE = preload("res://TSCN/enemy1.tscn")
const ENEMY2_SCENE = preload("res://TSCN/enemy2.tscn")
const ENEMY3_SCENE = preload("res://TSCN/enemy3.tscn")

@export var hexCalculationsNode : Node2D

@export var groundArr : Array[Node2D] = []
@export var wallArr : Array[Node2D] = []
@export var coinArr : Array[Node2D] = []
@export var enemy1Arr : Array[Node2D] = []
@export var enemy2Arr : Array[Node2D] = []
@export var enemy3Arr : Array[Node2D] = []

@export var groundNum : int = 0
@export var groundDiv : int = 0
@export var wallNum : int = 0
@export var wallDiv : int = 0
@export var coinNum : int = 0
@export var coinDiv : int = 0
@export var enemy1Num : int = 0
@export var enemy1Div : int = 0
@export var enemy2Num : int = 0
@export var enemy2Div : int = 0
@export var enemy3Num : int = 0
@export var enemy3Div : int = 0

@export var startNode : Node2D
@export var startPosX : int = 0
@export var startPosY : int = 0

@export var goalNode : Node2D
@export var goalPosX : int = 0
@export var goalPosY : int = 0

@export var playerNode : Node2D
@export var playerPosX : int = 0
@export var playerPosY : int = 0

@export var spawnedEverything : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPosX = 1
	startPosY = 1

	goalPosX = 4
	goalPosY = 16

	playerPosX = 1
	playerPosY = 1

	groundNum = 361
	groundDiv = 19

	spawnedEverything = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if spawnedEverything == false:
		_spawn_ground()
		_spawn_start()
		_spawn_goal()
		_spawn_player()
	spawnedEverything = true

func _spawn_ground() -> void:
	var ground_instance
	var _xBegin : int = 1
	var _yBegin : int = 1

	for k in groundNum:
		ground_instance = GROUND_SCENE.instantiate()
		#multiplied decrement by each increase of the yVal.
		#on being even -  make sure to take the lower valued decrement to offset the hex
		ground_instance.global_position.x = hexCalculationsNode._hex_pos_x(_xBegin, _yBegin)
		ground_instance.global_position.y = hexCalculationsNode._hex_pos_y(_xBegin, _yBegin)
		add_child(ground_instance)
		groundArr.append(ground_instance)
		_xBegin += 1
		if (_xBegin > int(groundNum / float(groundDiv))):
			_xBegin = 1
			_yBegin += 1

func _spawn_start() -> void:
	var start_instance = START_SCENE.instantiate()
	start_instance.global_position.x = hexCalculationsNode._hex_pos_x(startPosX, startPosY)
	start_instance.global_position.y = hexCalculationsNode._hex_pos_y(startPosX, startPosY)
	add_child(start_instance)
	startNode = start_instance

func _spawn_goal() -> void:
	var goal_instance = GOAL_SCENE.instantiate()
	goal_instance.global_position.x = hexCalculationsNode._hex_pos_x(goalPosX, goalPosY)
	goal_instance.global_position.y = hexCalculationsNode._hex_pos_y(goalPosX, goalPosY)
	add_child(goal_instance)
	goalNode = goal_instance

func _spawn_player() -> void:
	var player_instance = PLAYER_SCENE.instantiate()
	player_instance.global_position.x = hexCalculationsNode._hex_pos_x(playerPosX, playerPosY)
	player_instance.global_position.y = hexCalculationsNode._hex_pos_y(playerPosX, playerPosY)
	add_child(player_instance)
	playerNode = player_instance
