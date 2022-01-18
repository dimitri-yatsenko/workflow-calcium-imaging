FROM datajoint/djlab:py3.8-debian

USER root
RUN apt-get update -y
RUN apt-get install git -y

USER anaconda
WORKDIR /main/workflow-calcium-imaging
RUN git clone https://github.com/datajoint/workflow-calcium-imaging.git .
RUN pip install .
RUN pip install -r requirements_test.txt

# Install element-interface and CaImAn dependencies
RUN pip install --use-deprecated=legacy-resolver "element-interface[caiman_requirements] @ git+https://github.com/datajoint/element-interface"

# Install CaImAn, Suite2p, Scanreader, Scanbox reader
RUN pip install --use-deprecated=legacy-resolver --ignore-installed "element-interface[sbxreader,scanreader,caiman,suite2p] @ git+https://github.com/datajoint/element-interface"

