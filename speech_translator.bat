@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log

ECHO ��mstranslator�͊��ɂ��g���Ȃ��ꍇ������܂��B
ECHO ��2018/09/27 googletrans�ŃG���[�����B
ECHO ��2018/10/12 googletrans�t�H���_��gtoken.py����ւőΏ��B
ECHO ��2018/11/30 ggtrans���p�ɏC���B
ECHO ��2018/11/30 ggtrans������Agoogletrans������������ggtrans�͌��ꎩ�����f�t�Ȃ̂ňȌケ����B

ECHO �����|��G���W���̃e�X�g�ł�>temp\temp_recText.txt

ECHO;
python speech_translator_azure.py   ja en temp/temp_recText.txt temp/temp_msga.txt
ECHO;
python speech_translator_google.py  ja en temp/temp_recText.txt temp/temp_msgg1.txt
ECHO;
python speech_translator_goslate.py ja en temp/temp_recText.txt temp/temp_msgg2.txt
ECHO;
python speech_translator_ggtrans.py  ja en temp/temp_recText.txt temp/temp_msgg3.txt
ECHO;
python speech_translator_watson.py  ja en temp/temp_recText.txt temp/temp_msgw.txt
ECHO;
python speech_translator_xazure.py  ja en temp/temp_recText.txt temp/temp_msgax.txt

:LOOP

ECHO;
ECHO;
SET test_rec=
set /P test_rec="�����|�󂵂�������(ja)�F"
ECHO %test_rec%�B>temp\temp_recText.txt
ECHO;
python speech_translator_azure.py   ja en temp/temp_recText.txt temp/temp_msga.txt
ECHO;
python speech_translator_google.py  ja en temp/temp_recText.txt temp/temp_msgg1.txt
ECHO;
python speech_translator_goslate.py ja en temp/temp_recText.txt temp/temp_msgg2.txt
ECHO;
python speech_translator_ggtrans.py  ja en temp/temp_recText.txt temp/temp_msgg3.txt
ECHO;
python speech_translator_watson.py  ja en temp/temp_recText.txt temp/temp_msgw.txt
ECHO;
python speech_translator_xazure.py  ja en temp/temp_recText.txt temp/temp_msgax.txt

GOTO LOOP
