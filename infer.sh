
exp_name=luoxiang1

drv_aud=../data/luoxiang_test/og.wav
# drv_aud=../data/jingyu_test/og.wav

# python inference/genefacepp_infer.py --head_ckpt= --torso_ckpt=./checkpoints/motion2video_nerf/${exp_name}_torso --drv_aud=$drv_aud --debug --low_memory_usage
python inference/genefacepp_infer.py --head_ckpt= --torso_ckpt=/mnt/nas/avatars/mygfpp/checkpoints/motion2video_nerf/${exp_name}_torso/model_ckpt_best.pt --drv_aud=$drv_aud --debug --low_memory_usage

