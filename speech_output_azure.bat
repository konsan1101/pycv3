@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log


ECHO おはようございます。>temp\temp_msg.txt
python speech_output_azure.py ja-JP temp/temp_msg.txt temp/temp_voice.wav
ECHO Good morning,>temp\temp_msg.txt
python speech_output_azure.py en-US temp/temp_msg.txt temp/temp_voice.wav


:LOOP

ECHO;
ECHO;
SET test_msg=
set /P test_msg="音声合成したい文字："
ECHO %test_msg%。>temp\temp_msg.txt

python speech_output_azure.py ja-JP temp/temp_msg.txt temp/temp_voice.wav
copy temp\temp_voice.wav temp\temp_voice_azure_short.wav /Y/V

GOTO LOOP
