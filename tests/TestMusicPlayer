import unittest
from pymplayer import MusicPlayer

class TestMusicPlayer(unittest.TestCase):

    def test_import_song(self):
        test_mixer = MusicPlayer()
        self.assertTrue(test_mixer._import_file("/home/geroy/Music/Loup/Lupe Fiasco - Mission (CDQ).mp3"))

    def test_play_song(self):
        self.assertFalse(MusicPlayer()._play()) #Before import.
        test_mixer = MusicPlayer()
        test_mixer._import_file("/home/geroy/Music/Loup/Lupe Fiasco - Mission (CDQ).mp3")
        self.assertTrue(test_mixer._play())

    def test_pause_song_no_import(self):
        self.assertFalse(MusicPlayer()._pause())

    def test_unpause_song_no_import(self):
        self.assertFalse(MusicPlayer()._unpause())
