@ECHO OFF
CALL __setpath.bat

C:
CD C:\pycv\SpeakerRecognition
IF NOT EXIST usage  MKDIR usage


SET subscription_key=a63270d8e99f426684d3cebed146f52c
SET profile_id=9d90a8d5-89f2-48a7-9219-792d3b2d0be5
SET profile_name=yamanishi

ECHO;
ECHO;
ECHO ���v���t�B�[���\����
ECHO %profile_name%
python Identification\GetProfile.py %subscription_key% %profile_id%

ECHO;
ECHO;
ECHO ENTER�ŋ@�B�w�K�g���C���܂��B
PAUSE;

ECHO;
ECHO;
rem ECHO ���v���t�B�[��������������
rem python Identification\ResetEnrollments.py %subscription_key% %profile_id%

:LOOP

ECHO;
ECHO;
ECHO ���v���t�B�[�������o�^��
ECHO %profile_name%
python Identification\EnrollProfile.py %subscription_key% %profile_id% ../temp/temp_voice_yamanishi_info.wav True
python Identification\EnrollProfile.py %subscription_key% %profile_id% ../temp/temp_voice_yamanishi_short.wav True

ECHO;
ECHO Waiting...15s
ping localhost -w 1000 -n 15 >>dummy.ping
if exist dummy.ping del dummy.ping

ECHO;
ECHO;
ECHO ���v���t�B�[�����ʁ�
ECHO �����F%profile_name% %profile_id%
ECHO �����ʃe�X�g
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_yamanishi_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00

ECHO;
ECHO;
ECHO Enroll�Œ�(IncompleteEnrollment)�̏ꍇ�̓G���[�ɂȂ�܂��B
ECHO ENTER�ōăg���C���܂��B
PAUSE;

ECHO;
ECHO;
ECHO ���v���t�B�[���\����
ECHO %profile_name%
python Identification\GetProfile.py %subscription_key% %profile_id%

GOTO LOOP
