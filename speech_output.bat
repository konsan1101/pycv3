@ECHO OFF
CALL __setpath.bat

ECHO ��2018/10/12 gTTS�ŃG���[�����B
ECHO ��2018/10/12 gtts_token�t�H���_��gtts_token.py����ւőΏ��B
ECHO ��2018/11/30 gTTS�ŃG���[�����B
ECHO ��2018/11/30 gtts_token�̍ăC���X�g�[��(1.1.3)�ŉ��P���ꂽ�B

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log


ECHO ���������G���W���̃e�X�g�ł��B>./temp/temp_msg.txt
ECHO �������肪�Ƃ��������܂��B�B>>./temp/temp_msg.txt
python speech_output_azure.py  ja-JP ./temp/temp_msg.txt
python speech_output_google.py ja ./temp/temp_msg.txt
python speech_output_watson.py ja ./temp/temp_msg.txt
python speech_output_hoya.py   ja ./temp/temp_msg.txt
python speech_output_win32.py  ja ./temp/temp_msg.txt

:LOOP

ECHO;
ECHO;
SET test_msg=
set /P test_msg="�������������������F"
ECHO %test_msg%�B>./temp/temp_msg.txt
python speech_output_azure.py  ja-JP ./temp/temp_msg.txt
python speech_output_google.py ja ./temp/temp_msg.txt
python speech_output_watson.py ja ./temp/temp_msg.txt
python speech_output_hoya.py   ja ./temp/temp_msg.txt
python speech_output_win32.py  ja ./temp/temp_msg.txt

GOTO LOOP
