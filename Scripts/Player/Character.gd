class_name CharacterInfo extends Node2D

@export var character_name = "" # blank uses this node's name
# special vvarning though: sonic is a special case vvhere he's the default character node, 
# so logic to svvitch characters relies on his node being named "Sonic", so change this instead.
@export var jump_height_nerf = false
@export var roll_drag_margin = Vector2(0,-5) # very specific, but this adjusts the camera to compensate for the change in position vvhen rolling
@export var idle_order: Array[String] = ["idle1","idle2","idle2","idle2","idle2","idle3",
"idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4",
"idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4","idle4",
"idle5"]

@export_group("Hitboxes")
@export var normal_hitbox = Vector2(9,19)*2 # these are the hitbox sizes for this character
@export var roll_hitbox = Vector2(7,14)*2
@export var crouch_hitbox = Vector2(9,11)*2
@export var glide_hitbox = Vector2(10,10)*2 # probably specific to knuckles, but each character has all of these.
@export var horizontal_hitbox = Vector2(22,9)*2 # ... is this even used???
@export var ground_clipping = 16 # this is specifically for amy, but it should be included here in case a character has a similarly small hitbox

func set_variables():
	var parent = get_parent()
	# copy over some properties
	parent.characterName = character_name
	if character_name == "": # if blank, use node name since it usually is named after the character
		parent.characterName = name
	parent.playerIdles = idle_order
	# hitboxes are all in one variable, pack it up
	parent.currentHitbox = {NORMAL = normal_hitbox, ROLL = roll_hitbox, CROUCH = crouch_hitbox, GLIDE = glide_hitbox, HORIZONTAL = horizontal_hitbox}
	parent.maxCharGroundHeight = ground_clipping
	
