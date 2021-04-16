FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
# install anaconda 5.2.0
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update && apt-get install -y wget \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc


RUN apt-get install zip unzip
RUN apt-get install nano
RUN apt-get install -y gedit
RUN apt-get install -y lynx
RUN apt-get update

#RUN useradd -ms /bin/bash admin
#USER admin 
# clone and install openvqa dependencies
RUN mkdir /workspace && \
    cd /workspace && \    
    git clone https://github.com/shivangigarg24/atr-net.git && \
    cd atr-net && \
    pip install -r requirements.txt 
    
#RUN conda env create -f /workspace/VQA_ReGAT/tools/environment.yml

# Activate the environment, and make sure it's activated:
#CMD ["conda", "run", "-n", "v"]
#RUN /bin/bash -c "source activate vqa"


#WORKDIR /home/admin/workspace
#RUN chown -R admin:admin /home/admin/workspace
#RUN chmod 777 /home/admin/workspace

#RUN /bin/bash -c "source /workspace/VQA_ReGAT/tools/download.sh"

