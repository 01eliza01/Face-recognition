clc;close;clear
cam=webcam;
load myNet1;
faceDetector=vision.CascadeObjectDetector;
while true
    e=cam.snapshot;
    b =step(faceDetector,e);
    if(sum(sum(b))~=0)
     es=imcrop(e,b(1,:));
    es=imresize(es,[227 227]);
    label=classify(myNet1,es);
    image(e);
    title(char(label));
    drawnow;
    else
        image(e);
        title('No Face Detected');
    end
end