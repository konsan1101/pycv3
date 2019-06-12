@ECHO OFF
CALL __setpath.bat

IF NOT EXIST temp         MKDIR temp
IF NOT EXIST temp\log     MKDIR temp\log


ECHO ���͂悤�������܂��B>temp\temp_msg_short.txt
ECHO My password is not your business.>temp\temp_msg_phrase.txt


ECHO �}�C�N���\�t�g Cognitive Services�B>temp\temp_msg_info.txt
ECHO Cognitive Services �𗘗p����΁A>>temp\temp_msg_info.txt
ECHO �킸�����s�̃R�[�h�ŋ��͂ȃA���S���Y��������>>temp\temp_msg_info.txt
ECHO �C���e���W�F���g�ȃA�v���̍쐬���\�ł��B>>temp\temp_msg_info.txt

python speech_output_azure.py ja-JP temp/temp_msg_short.txt temp/temp_voice_azure_short.wav
python speech_output_azure.py ja-JP temp/temp_msg_info.txt temp/temp_voice_azure_info.wav
python speech_output_azure.py en-US temp/temp_msg_phrase.txt temp/temp_voice_azure_phrase.wav


ECHO Google Cloud Platform�B>temp\temp_msg.txt
ECHO GCP �𗘗p����ƁA�C���t���X�g���N�`���̊Ǘ���T�[�o�[�̃v���r�W���j���O�A>>temp\temp_msg.txt
ECHO �l�b�g���[�N�̍\���ȂǂɋN�����镉�S���y�����邱�Ƃ��ł��܂��B>>temp\temp_msg.txt
ECHO �܂�A�C�m�x�[�^�[���v���O���}�[���A�����̖{���̎d���ɏW���ł���悤�ɂȂ�̂ł��B>>temp\temp_msg.txt

python speech_output_google.py ja temp/temp_msg_short.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_google_short.wav
python speech_output_google.py ja temp/temp_msg.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_google_info.wav
python speech_output_google.py en temp/temp_msg_phrase.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_google_phrase.wav


ECHO Watson �Ƃ�?�B>temp\temp_msg.txt
ECHO IBM�́AAI���uArtificial Intelligence�i�l�H�m�\�j�v�ł͂Ȃ��A>>temp\temp_msg.txt
ECHO �uAugmented Intelligence �i�g���m�\�j�v�Ƃ��Đl�Ԃ̒m�����g��������������̂ƒ�`���A>>temp\temp_msg.txt
ECHO ���g�\���𒆊j�Ƃ���R�O�j�e�B�u�E�\�����[�V�����Ƃ��Ă��q�l�ɒ񋟂��Ă��܂��B>>temp\temp_msg.txt
ECHO ���g�\���́A���R���ꏈ���Ƌ@�B�w�K���g�p���āA>>temp\temp_msg.txt
ECHO ��ʂ̔�\�����f�[�^���瓴�@�𖾂炩�ɂ���e�N�m���W�[�E�v���b�g�t�H�[���ł��B>>temp\temp_msg.txt

python speech_output_watson.py ja temp/temp_msg_short.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_watson_short.wav
python speech_output_watson.py ja temp/temp_msg.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_watson_info.wav
python speech_output_watson.py en temp/temp_msg_phrase.txt temp/temp_voice.mp3
sox temp/temp_voice.mp3 -r 16000 -b 16 -c 1 temp/temp_voice_watson_phrase.wav


ECHO HOYA Voice Text�B>temp\temp_msg.txt
ECHO �N�ł��ȒP�ɉ������쐬�A�l�̐��Ɍ���Ȃ��߂����|�I�ȓ������A���Ċ����������܂����B>>temp\temp_msg.txt
ECHO ���{��A�p��(�A�����J�E�C�M���X)���͂��߁A15����ɑΉ����������̘b�҂����C���i�b�v���Ă��܂��B>>temp\temp_msg.txt
ECHO ���������͒W�X�ƓǂނƂ����펯�ɒ���A�V�Z�p�ɂ��\���ɕ����������邱�Ƃ��\�ɂȂ�܂��B>>temp\temp_msg.txt

python speech_output_hoya.py ja temp/temp_msg_short.txt temp/temp_voice_hoya.wav
sox temp/temp_voice_hoya.wav -r 16000 -b 16 -c 1 temp/temp_voice_hoya_short.wav
python speech_output_hoya.py ja temp/temp_msg.txt temp/temp_voice_hoya.wav
sox temp/temp_voice_hoya.wav -r 16000 -b 16 -c 1 temp/temp_voice_hoya_info.wav
python speech_output_hoya.py en temp/temp_msg_phrase.txt temp/temp_voice_hoya.wav
sox temp/temp_voice_hoya.wav -r 16000 -b 16 -c 1 temp/temp_voice_hoya_phrase.wav

PAUSE
