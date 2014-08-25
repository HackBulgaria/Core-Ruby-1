from os import path
from pygame import mixer
from pydub import AudioSegment
import numpy as np

class MusicPlayer:
    main_mixer = mixer
    sound_path = ""
    def __init__(self):
        MusicPlayer.main_mixer.init()

    def _import_file(self, file_path):
        if(path.isfile(file_path) and file_path[-4:] == ".mp3"):
            MusicPlayer.sound_path = file_path
            MusicPlayer.main_mixer.music.load(file_path)
            print("An mp3 file is added.")
            return True
        else:
            print("This is not an mp3 file!")
            return False

    def _play(self):
        try:
            MusicPlayer.main_mixer.music.stop()
        except:
            pass
        try:
            MusicPlayer.main_mixer.music.play()
            if MusicPlayer.main_mixer.music.get_busy() == 1:
                return True
        except:
            print("Unable to play")
            return False

    def _pause(self):
        try:
            MusicPlayer.main_mixer.music.pause()
            if MusicPlayer.main_mixer.music.get_busy() == 1:
                return True
        except:
            print("Unable to pause")
            return False

    def _stop(self):
        try:
            MusicPlayer.main_mixer.music.stop()
        except:
            print("Unable to stop")

    def _unpause(self):
        try:
            MusicPlayer.main_mixer.music.unpause()
        except:
            print("Unable to unpause")

    def _play_position(self, position):
        try:
            MusicPlayer.main_mixer.music.set_pos(position)
        except:
            print("Unable to position correctly")

    def _set_volume(self, value):
        try:
            MusicPlayer.main_mixer.music.set_volume(value)
        except:
            print("Unable to set volume")

    def _get_volume(self):
        return MusicPlayer.main_mixer.get_volume()

    def _get_cond(self):
        return MusicPlayer.main_mixer.get_busy()

    def _rewind(self):
        try:
            MusicPlayer.main_mixer.music.rewind()
        except:
            print("Unable to rewind")

    def _fadeout(self, time):
        try:
            MusicPlayer.main_mixer.music.fadeout(time * 1000)
        except:
            print("Unable to fadeout")

    def _queue(self, file_path):
        if(path.isfile(file_path) and file_path[-4:] == ".mp3"):
            try:
                MusicPlayer.main_mixer.music.queue(file_path)
            except:
                print("Can't add the file to queue")
        else:
            print("Can't add the file to queue")


    def _cut(self, starting_p, ending_p):
        if MusicPlayer.sound_path == "":
            print("Unable to cut")
            return False
        sound = AudioSegment.from_mp3(MusicPlayer.sound_path)
        splitted_sound = sound[starting_p * 1000:ending_p * 1000]
        splitted_sound.export(MusicPlayer.sound_path[:-4] + " (Splitted).mp3")

    def _concat(self, added_sound_path, side = "ending"):
        if MusicPlayer.sound_path == "" or added_sound_path == "":
            print("Unable to concatenate")
            return False
        sound1 = AudioSegment.from_mp3(MusicPlayer.sound_path)
        sound2 = AudioSegment.from_mp3(added_sound_path)
        if side == "right":
            final_sound = sound1 + sound2
        else:
            final_sound = sound2 + sound1
        final_sound.export(MusicPlayer.sound_path[:-4] + " (Concatenated).mp3")


