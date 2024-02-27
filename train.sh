exp_name=luoxiang1
video_id=1

# python tasks/run.py --config=egs/datasets/${video_id}/lm3d_radnerf_sr.yaml --exp_name=motion2video_nerf/${exp_name}_head --reset

python tasks/run.py --config=egs/datasets/${video_id}/lm3d_radnerf_torso_sr.yaml --exp_name=motion2video_nerf/${exp_name}_torso --hparams=head_model_dir=checkpoints/motion2video_nerf/${exp_name}_head --reset

# python inference/genefacepp_infer.py --head_ckpt= --torso_ckpt=checkpoints/motion2video_nerf/luoxiang1_torso --drv_aud=data/raw/val_wavs/MacronSpeech.wav --debug