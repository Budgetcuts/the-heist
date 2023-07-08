extends Camera2D

const MIN_ZOOM: float = 0.3
const MAX_ZOOM: float = 1.0
const ZOOM_INCREMENT: float = 0.1
const ZOOM_RATE: float = 8.0
var _target_zoom: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta:float) -> void:
	zoom = lerp(zoom, _target_zoom*Vector2.ONE, ZOOM_RATE*delta)
	set_physics_process(not is_equal_approx(zoom.x,_target_zoom))
	
func zoom_in()-> void:
	_target_zoom = min(_target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)
func zoom_out()-> void:
	_target_zoom = max(_target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)
	
func _unhandled_input(event:InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_RIGHT:
			position -= event.relative * zoom
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
