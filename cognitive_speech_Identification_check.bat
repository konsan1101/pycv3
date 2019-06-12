@ECHO OFF
CALL __setpath.bat

C:
CD C:\pycv\SpeakerRecognition
IF NOT EXIST usage  MKDIR usage


SET subscription_key=a63270d8e99f426684d3cebed146f52c
rem GOTO SKIP

:LOOP

ECHO;
ECHO;
ECHO ���v���t�B�[���ꗗ��
python Identification\PrintAllProfiles.py %subscription_key%

ECHO;
ECHO;
ECHO ���v���t�B�[�����ʁ�
python Identification\IdentifyFile.py            >usage\Identification_IdentifyFile.txt
TYPE                                              usage\Identification_IdentifyFile.txt
ECHO ��Azure�����Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_azure_short.wav  True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ��Google�����Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_google_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ��HOYA�����Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_hoya_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ��Watson�����Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_watson_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ���ߓ������Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_kondou_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ���R�������Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_yamanishi_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00
ECHO ���O�特���Ŏ���
python Identification\IdentifyFile.py %subscription_key% ../temp/temp_voice_minabe_short.wav True 1713992c-7c55-466a-bbc8-051d0557b010,5310cdf7-a74c-4b47-b311-c97176b8502a,e6cd812d-e903-4856-99c6-f300159ba975,ad4260cc-9c5b-447e-aaf2-0042c83a15ea,43d2d2c9-62b3-44d0-b5d9-db75439aeec7,9d90a8d5-89f2-48a7-9219-792d3b2d0be5,b3a1fb87-0ff4-4550-917d-7e74e83adf00

ECHO;
ECHO;
ECHO Enroll�Œ�(IncompleteEnrollment)�̋@��w�K�̓G���[�ɂȂ�܂��B
ECHO ENTER�ŋ@�B�w�K�g���C���܂��B
PAUSE;

ECHO;
ECHO;
ECHO ���v���t�B�[�������o�^��
python Identification\EnrollProfile.py           >usage\Identification_EnrollProfile.txt
TYPE                                              usage\Identification_EnrollProfile.txt
python Identification\EnrollProfile.py %subscription_key% 1713992c-7c55-466a-bbc8-051d0557b010 ../temp/temp_voice_azure_info.wav True
python Identification\EnrollProfile.py %subscription_key% 5310cdf7-a74c-4b47-b311-c97176b8502a ../temp/temp_voice_google_info.wav True
python Identification\EnrollProfile.py %subscription_key% e6cd812d-e903-4856-99c6-f300159ba975 ../temp/temp_voice_hoya_info.wav True
python Identification\EnrollProfile.py %subscription_key% ad4260cc-9c5b-447e-aaf2-0042c83a15ea ../temp/temp_voice_watson_info.wav True
python Identification\EnrollProfile.py %subscription_key% 43d2d2c9-62b3-44d0-b5d9-db75439aeec7 ../temp/temp_voice_kondou_info.wav True
python Identification\EnrollProfile.py %subscription_key% 43d2d2c9-62b3-44d0-b5d9-db75439aeec7 ../temp/temp_voice_kondou_short.wav True
python Identification\EnrollProfile.py %subscription_key% 9d90a8d5-89f2-48a7-9219-792d3b2d0be5 ../temp/temp_voice_yamanishi_info.wav True
python Identification\EnrollProfile.py %subscription_key% 9d90a8d5-89f2-48a7-9219-792d3b2d0be5 ../temp/temp_voice_yamanishi_short.wav True
python Identification\EnrollProfile.py %subscription_key% b3a1fb87-0ff4-4550-917d-7e74e83adf00 ../temp/temp_voice_minabe_info.wav True
python Identification\EnrollProfile.py %subscription_key% b3a1fb87-0ff4-4550-917d-7e74e83adf00 ../temp/temp_voice_minabe_short.wav True

ECHO;
ECHO Waiting...15s
ping localhost -w 1000 -n 15 >>dummy.ping
if exist dummy.ping del dummy.ping

ECHO;
ECHO;
ECHO Enroll�Œ�(IncompleteEnrollment)�̏ꍇ�̓G���[�ɂȂ�܂��B
ECHO ENTER�ōăg���C���܂��B
PAUSE;

GOTO LOOP
