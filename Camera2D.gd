extends Camera2D

var mouseCords : Vector2= Vector2(0, 0);
const minZoom : float = 1.0/4;
const maxZoom : float = 4;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newMouseCords = get_viewport().get_mouse_position();
	if Input.is_action_pressed("pan") :
		position += (mouseCords -newMouseCords) / zoom;
	mouseCords = newMouseCords;
	pass

func _input(event):
	if event.is_action_pressed("zoom_in") and zoom.length() < maxZoom:
		zoom *= 1.25;
	if event.is_action_pressed("zoom_out") and zoom.length() > minZoom:
		zoom /= 1.25;
