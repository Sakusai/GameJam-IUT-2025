extends CanvasLayer
class_name Score

static var score: int = 0

func _ready():
	update()
	
func _process(delta):
	update()
	
func update():
	$Label/Label.text = str(score)
	

static func _kill_goblin():
	score += 50

static func _kill_archer():
	score += 100
	
static func _kill_Knight():
	score += 200
