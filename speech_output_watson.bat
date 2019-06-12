@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log


ECHO おはようございます。>temp\temp_msg.txt
python speech_output_watson.py ja-JP temp/temp_msg.txt temp/temp_voice.mp3
ECHO Good morning,>temp\temp_msg.txt
python speech_output_watson.py en-US temp/temp_msg.txt temp/temp_voice.mp3


:LOOP

ECHO;
ECHO;
SET test_msg=
set /P test_msg="音声合成したい文字："
ECHO %test_msg%。>temp\temp_msg.txt

python speech_output_watson.py ja temp/temp_msg.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice.wav
copy temp\temp_voice.wav temp\temp_voice_watson_short.wav /Y/V

GOTO LOOP
