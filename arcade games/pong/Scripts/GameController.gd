extends Node

@onready var ball = $"../ball"
@onready var left_goal = $"../left_detect"
@onready var right_goal = $"../right_detect"

var left_score = 0
var right_score = 0

func _ready():
	left_goal.goal_scored.connect(_on_goal_scored)
	right_goal.goal_scored.connect(_on_goal_scored)
	ball.serve(1)

func _on_goal_scored(side):
	if side == 1:
		right_score += 1
		if right_score >= 3:
			print ("You Win!")
		else:
			ball.serve(-1)
	else:
		left_score += 1
		if left_score >= 3:
			print ("You Lost")
		ball.serve(1)
	print("Left:", left_score, " Right:", right_score)
