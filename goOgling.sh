#!/bin/zsh

gsutil mb gs://thebourgeoisieandtherebel

# multiprocessing bc of -m but still took a few hours for ~ half the files 
gsutil -m cp data/* gs://thebourgeoisieandtherebel

ls -l data/mpd.* | awk '{t+=$5}END{print t}'

ls -lh data/mpd.* | awk '{t+=$5}END{print t/1000}' # 31.982

du -sk mpd* | awk '{ total = total + $1 } END { print total }' # 32753868

# anyways

gsutil mb gs://therebel
gsutil cp data/mpd.slice.0-999.json gs://therebel
gsutil cp gs://thebourgeoisieandtherebel/mpd.slice.1000-1999.json gs://therebel

gsutil rm gs://therebel/mpd.slice.1000-1999.json

gcloud functions deploy hello_gcs --runtime python38 --trigger-resource therebel \
--memory=1024MB --trigger-event google.storage.object.finalize --retry

ls -kl data | head -4

gcloud functions deploy hey_bae --runtime python38 --trigger-resource therebel \
--memory=1024MB --trigger-event google.storage.object.finalize --retry

gcloud functions call hey_bae --data '{"sTr":"idk"}'

gcloud compute instances create VM_NAME \
    [--image=IMAGE | --image-family=IMAGE_FAMILY] \
    --image-project=IMAGE_PROJECT
    --machine-type=MACHINE_TYPE

gcloud compute instances create put-a-r3cord-on --project=alpine-beacon-336222 --zone=us-central1-a --machine-type=c2-standard-8 --network-interface=network-tier=PREMIUM,subnet=default --maintenance-policy=MIGRATE --service-account=986744994995-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=put-a-r3cord-on,image=projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20220126,mode=rw,size=10,type=projects/alpine-beacon-336222/zones/us-central1-a/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any

