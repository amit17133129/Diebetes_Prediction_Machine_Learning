FROM centos:latest
RUN yum install python3  python3-devel   gcc-c++ -y && \
    python3 -m pip install --upgrade --force-reinstall pip && \
    yum install sudo -y && \
    yum install --assumeyes  python3-pip && \
    pip install keras && \
    pip install tensorflow --no-cache-dir  tensorflow && \
    pip install --upgrade pip tensorflow && \
    pip3 install flask && \
    pip3 install joblib && \
    pip3 install sklearn && \
    mkdir  /diabetes_app &&  \
    mkdir /diabetes_app/templates
COPY  Randorm_Forest_Heart_Prediction.h5    /diabetes_app
COPY  app.py  /diabetes_app
COPY  myform.html  /diabetes_app/templates
COPY  results.html   /diabetes_app/templates
EXPOSE  5555
WORKDIR  /diabetes_app
CMD export FLASK_APP=app.py
ENTRYPOINT flask  run --host=0.0.0.0    --port=5555