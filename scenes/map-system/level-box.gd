extends Node2D
export var level_number: int
export var Banner_Source: Resource
func _ready():
	$Level_banner.texture = Banner_Source
