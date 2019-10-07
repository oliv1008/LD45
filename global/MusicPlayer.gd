extends Node2D

#loops
var songs = { 
	"Song1" : "res://music/1vs0_JuniorGroove.ogg",
	"Song2" : "res://music/llab007a_b-complex-amazon_rain.ogg",
	"Menu" : "res://music/Son_Ambiance_Main.wav",
	"Monde1" : "res://music/Son_Monde_1.wav",
	"Boss1" : "res://music/Son_Boss_Monde_1.wav"}

#only to be played at the start of the loop
var intros = { 
	"intro1" : "res://music/just-like-magic.ogg",
	"IntroBoss1" : "res://music/Son_Boss_Monde_1_Tansition.wav",
}

#CAREFUL when you add music files to set if they must be on loop or not /!\ 

var currentSongName
var song

var player
var timer

func _ready():
	player = get_node("SongPlayer")
	timer = get_node("Timer")
	timer.connect("timeout", self, "on_Timer_timeout")

func playSong(songName, introDuration, introName=null):
	if currentSongName != songName: #in case it's asked to play a song that's already being played
		
		if introName != null: #if there is an intro
			#set the base volume
			player.volume_db = 0
			#play the intro
			player.stream = load(intros[introName])
			player.play()
			#wait for the duration of the intro
			yield(get_tree().create_timer(introDuration),"timeout")
			#play the loop
			currentSongName = songName
			player.stream = load(songs[songName])
			player.play()
		else:
			#play the loop with a fade in
			currentSongName = songName
			player.stream = load(songs[songName])
			player.volume_db = -60;
			player.play()
			timer.set_wait_time(introDuration/60)
			timer.start()

func stopSong():
	$SongPlayer.stop()
	
func on_Timer_timeout():
	player.volume_db += 1
	if player.volume_db == 0:
		timer.stop()