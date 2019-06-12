@ECHO OFF
CALL __setpath.bat

C:
CD C:\pycv\SpeakerRecognition
IF NOT EXIST usage  MKDIR usage


SET subscription_key=a63270d8e99f426684d3cebed146f52c
rem GOTO SKIP

ECHO;
ECHO;
ECHO ���v���t�B�[���쐬��
python Verification\CreateProfile.py             >usage\Verification_CreateProfile.txt
TYPE                                              usage\Verification_CreateProfile.txt
ECHO ���T���v��
ECHO python Verification\CreateProfile.py         %subscription_key%

ECHO;
ECHO;
ECHO ���v���t�B�[���\����
python Verification\GetProfile.py                >usage\Verification_GetProfile.txt
TYPE                                              usage\Verification_GetProfile.txt
python Verification\GetProfile.py %subscription_key% 0942f821-43e8-4aee-8035-f4f1d67e3434

ECHO;
ECHO;
ECHO ���v���t�B�[���ꗗ��
python Verification\PrintAllProfiles.py          >usage\Verification_PrintAllProfiles.txt
TYPE                                              usage\Verification_PrintAllProfiles.txt
python Verification\PrintAllProfiles.py %subscription_key%

ECHO;
ECHO;
ECHO ���v���t�B�[���폜��
python Verification\DeleteProfile.py             >usage\Verification_DeleteProfile.txt
TYPE                                              usage\Verification_DeleteProfile.txt
ECHO ���T���v��
ECHO python Verification\DeleteProfile.py       %subscription_key% 00c1db40-dd68-44ac-9b81-cd91a3329cc4

ECHO;
ECHO;
ECHO ���v���t�B�[��������������
python Verification\ResetEnrollments.py          >usage\Verification_ResetEnrollments.txt
TYPE                                              usage\Verification_ResetEnrollments.txt
python Verification\ResetEnrollments.py %subscription_key% 0942f821-43e8-4aee-8035-f4f1d67e3434
python Verification\ResetEnrollments.py %subscription_key% 9dadbdbd-824c-4442-856e-354adb1a61fc
python Verification\ResetEnrollments.py %subscription_key% b72cf86e-7d41-4331-bbcc-2718464c03ef

:SKIP

ECHO;
ECHO;
ECHO ���v���t�B�[�������o�^��
python Verification\EnrollProfile.py             >usage\Verification_EnrollProfile.txt
TYPE                                              usage\Verification_EnrollProfile.txt
python Verification\EnrollProfile.py %subscription_key% 0942f821-43e8-4aee-8035-f4f1d67e3434 ../temp/temp_voice_azure_phrase.wav
python Verification\EnrollProfile.py %subscription_key% 9dadbdbd-824c-4442-856e-354adb1a61fc ../temp/temp_voice_google_phrase.wav
python Verification\EnrollProfile.py %subscription_key% b72cf86e-7d41-4331-bbcc-2718464c03ef ../temp/temp_voice_watson_phrase.wav

ECHO;
ECHO Waiting...15s
ping localhost -w 1000 -n 15 >>dummy.ping
if exist dummy.ping del dummy.ping

ECHO;
ECHO;
ECHO ���v���t�B�[�����؁�
python Verification\VerifyFile.py                >usage\Verification_VerifyFile.txt
TYPE                                              usage\Verification_VerifyFile.txt
ECHO ��Azure�����Ō��؁@�n�j�A�m�f
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_azure_phrase.wav  0942f821-43e8-4aee-8035-f4f1d67e3434
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_azure_short.wav   0942f821-43e8-4aee-8035-f4f1d67e3434
ECHO ��Google�����Ō��؁@�n�j�A�m�f
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_google_phrase.wav 9dadbdbd-824c-4442-856e-354adb1a61fc
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_google_short.wav  9dadbdbd-824c-4442-856e-354adb1a61fc
ECHO ��Watson�����Ō��؁@�n�j�A�m�f
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_watson_phrase.wav b72cf86e-7d41-4331-bbcc-2718464c03ef
python Verification\VerifyFile.py %subscription_key% ../temp/temp_voice_watson_short.wav  b72cf86e-7d41-4331-bbcc-2718464c03ef

ECHO;
ECHO;
ECHO Enroll�Œ�(IncompleteEnrollment)�̏ꍇ�̓G���[�ɂȂ�܂��B
ECHO ENTER�ōăg���C���܂��B
PAUSE;

ECHO;
ECHO;
ECHO ���v���t�B�[���ꗗ��
python Verification\PrintAllProfiles.py %subscription_key%

GOTO SKIP
