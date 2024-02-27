exp_name=wanglamao6;
video_id=wanglamao6;

nohup python tasks/run.py --config=egs/datasets/${video_id}/lm3d_radnerf_sr.yaml --exp_name=motion2video_nerf/${exp_name}_head --reset > face.log & ;

nohup python tasks/run.py --config=egs/datasets/${video_id}/lm3d_radnerf_torso_sr.yaml --exp_name=motion2video_nerf/${exp_name}_torso --hparams=head_model_dir=checkpoints/motion2video_nerf/${exp_name}_head --reset > torso.log & ;

# python inference/genefacepp_infer.py --head_ckpt= --torso_ckpt=checkpoints/motion2video_nerf/luoxiang1_torso --drv_aud=data/raw/val_wavs/MacronSpeech.wav --debug