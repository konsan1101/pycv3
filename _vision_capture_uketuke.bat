@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log
IF NOT EXIST temp\images  MKDIR temp\images
IF NOT EXIST temp\voices  MKDIR temp\voices
IF NOT EXIST temp\cache   MKDIR temp\cache
IF NOT EXIST temp\capture MKDIR temp\capture

IF EXIST temp\temp_recSJIS.txt        DEL temp\temp_recSJIS.txt        >temp\dummyV.txt
IF EXIST temp\temp_recTranslator.txt  DEL temp\temp_recTranslator.txt  >temp\dummyV.txt
IF EXIST temp\temp_micON.txt          DEL temp\temp_micON.txt          >temp\dummyV.txt
IF EXIST temp\temp_playSJIS.txt       DEL temp\temp_playSJIS.txt       >temp\dummyV.txt
IF EXIST temp\temp_micWave.wav        DEL temp\temp_micWave.wav        >temp\dummyV.txt

ECHO �N���e�X�g1
    python _vision_capture.py 0   0 1920 google google None None None 0
rem ECHO �N���e�X�g1�m�F
rem PAUSE

ECHO �N���e�X�g2
    python _vision_capture.py 0   0 1920 azure  azure  face.xml fullbody.xml None 60
rem ECHO �N���e�X�g2�m�F
rem PAUSE

:LOOP

ECHO ��t���[�h���[�v
    python _vision_capture.py 1 360 1920 azure  azure  face.xml fullbody.xml azure_capture_face.bat 120
rem python _vision_capture.py 1 360 1920 google google face.xml fullbody.xml None 0
PAUSE

ECHO;
ECHO Waiting...20s
ping localhost -w 1000 -n 20 >temp\dummyV.txt

CLS
GOTO LOOP



