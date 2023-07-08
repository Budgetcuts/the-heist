extends Node2D

var prevRemark = "none";
var curRemark;
var remarkCounter = 0;


# Called when the node enters the scene tree for the first time.

func take_turn():
	
	remarkOutcome(curRemark, prevRemark)
	curRemark = prevRemark
	
	
func _ready():
	pass # Replace with function body


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func remarkOutcome(currentRemark, PreviousRemark):
	if(currentRemark == PreviousRemark):
		remarkCounter+=1
	else:
		remarkCounter = 0
	for i in remarkCounter:
		if(randf_range(1,3) == 2):
			print("hi")
		


func _on_item_list_item_selected(index):
	print($ItemList.get_item_text(index))
	curRemark = $ItemList.get_item_text(index)


func _on_button_pressed():
	print("pressed")
	take_turn() # Replace with function body.
