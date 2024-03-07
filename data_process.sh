export CUDA_VISIBLE_DEVICES=0;
export PYTHONPATH=./;
VIDEO_ID=miaoge2;

mkdir -p data/processed/videos/${VIDEO_ID};
ffmpeg -i data/raw/videos/${VIDEO_ID}.mp4 -f wav -ar 16000 data/processed/videos/${VIDEO_ID}/aud.wav ;

python data_gen/utils/process_audio/extract_hubert.py --video_id=${VIDEO_ID};

python data_gen/utils/process_audio/extract_mel_f0.py --video_id=${VIDEO_ID};


mkdir -p data/processed/videos/${VIDEO_ID}/gt_imgs;
ffmpeg -i data/raw/videos/${VIDEO_ID}.mp4 -vf fps=25,scale=w=512:h=512 -qmin 1 -q:v 1 -start_number 0 data/processed/videos/${VIDEO_ID}/gt_imgs/%08d.jpg;
python data_gen/utils/process_video/extract_segment_imgs.py --ds_name=nerf --vid_dir=data/raw/videos/${VIDEO_ID}.mp4 ; # extract image, segmap, and background

python data_gen/utils/process_video/extract_lm2d.py --ds_name=nerf --vid_dir=data/raw/videos/${VIDEO_ID}.mp4;


python data_gen/utils/process_video/fit_3dmm_landmark.py --ds_name=nerf --vid_dir=data/raw/videos/${VIDEO_ID}.mp4 --reset  --debug --id_mode=global;

python data_gen/utils/process_audio/extract_mel_f0.py --video_id=${VIDEO_ID};

python data_gen/runs/binarizer_nerf.py --video_id=${VIDEO_ID};