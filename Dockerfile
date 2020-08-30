FROM selenium/standalone-chrome

USER root

#=================================
#  Install Python 3.7
#=================================

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip


#=================================
# Install MINT API
#=================================
COPY . .
RUN pip install nose flake8 pep8-naming selenium 
RUN flake8 --ignore=E501 mintapi
RUN python setup.py install