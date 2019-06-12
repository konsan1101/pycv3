@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log


ECHO おはようございます。>temp\temp_msg.txt
python speech_output_hoya.py ja temp/temp_msg.txt temp/temp_voice.wav
ECHO Good morning,>temp\temp_msg.txt
python speech_output_hoya.py en temp/temp_msg.txt temp/temp_voice.wav


:LOOP

ECHO;
ECHO;
SET test_msg=
set /P test_msg="音声合成したい文字："
ECHO %test_msg%。>temp\temp_msg.txt

python speech_output_hoya.py ja temp/temp_msg.txt temp/temp_voice_hoya.wav
sox temp/temp_voice_hoya.wav -r 16000 -b 16 -c 1 temp/temp_voice.wav
copy temp\temp_voice.wav temp\temp_voice_hoya_short.wav /Y/V

GOTO LOOP
