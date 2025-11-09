extends Node2D

@export var speed: float = 100.0
@export var image_path: String = "res://assets/"
@export var pool_size: int = 5
@export var scale_factor: Vector2 = Vector2(2, 2)
@export var screen_width: float = 648.0
@export var screen_height: float = 1152.0

var variants: Array[Texture2D] = []
var sprites: Array[Sprite2D] = []

func _ready():
	variants = load_variants(image_path)
	if variants.is_empty():
		push_warning("not found variants: " + image_path)
		return

	var x_offset = 0.0
	for i in pool_size:
		var s = Sprite2D.new()
		s.texture = variants[randi_range(0, variants.size() - 1)]
		s.scale = scale_factor
		add_child(s)
		var x_pos = x_offset + s.texture.get_width() * scale_factor.x / 2
		var y_pos = screen_height - (s.texture.get_height() * scale_factor.y / 2)
		s.position = Vector2(x_pos, y_pos)
		x_offset += s.texture.get_width() * scale_factor.x
		sprites.append(s)


func _process(delta: float) -> void:
	for s in sprites:
		s.position.x -= speed * delta

	for s in sprites:
		if s.position.x < -s.texture.get_width() * scale_factor.x / 2:
			var max_x = get_max_x()
			s.position.x = max_x + s.texture.get_width() * scale_factor.x / 2
			s.texture = variants[randi_range(0, variants.size() - 1)]

func get_max_x() -> float:
	var max_val = -INF
	for s in sprites:
		max_val = max(max_val, s.position.x + s.texture.get_width() * scale_factor.x / 2)
	return max_val

func load_variants(path: String) -> Array[Texture2D]:
	var result: Array[Texture2D] = []
	for file in DirAccess.get_files_at(path):
		if file.ends_with(".png") or file.ends_with(".jpg"):
			result.append(load(path + file))
	return result
