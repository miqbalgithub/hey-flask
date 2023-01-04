#FROM python:3-alpine3.15
#WORKDIR	/app
#COPY . /app
#RUN pip install -r requirements.txt
#EXPOSE 3000
#CMD python ./index.py

FROM python:3.6

# Use latest version from https://pypi.org/project/appdynamics/#history
#ENV APPD_AGENT_VERSION=21.12.2.4693
ENV APPDYNAMICS_TCP_COMM_PORT=9091
ENV APPDYNAMICS_AGENT_APPLICATION_NAME=python-docker
ENV APPDYNAMICS_AGENT_TIER_NAME=python-flask
ENV APPDYNAMICS_AGENT_NODE_NAME=python-flask-docker
#ENV APPDYNAMICS_AGENT_REUSE_NODE_NAME=true
#ENV APPDYNAMICS_AGENT_REUSE_NODE_NAME_PREFIX=pydocker
ENV APPDYNAMICS_AGENT_ACCOUNT_NAME=customer1
ENV APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=5b02f174-b92b-468d-9c7e-4db24c6a5b62
ENV APPDYNAMICS_CONTROLLER_HOST_NAME=192.168.1.178
ENV APPDYNAMICS_CONTROLLER_PORT=8090
ENV APPDYNAMICS_CONTROLLER_SSL_ENABLED=false


COPY . /app/
WORKDIR /app
RUN chmod +x ./index.py

EXPOSE 3000

RUN chmod -R 777 /tmp

#RUN pip install -U appdynamics==${APPD_AGENT_VERSION} -r requirements.txt
RUN pip install -U appdynamics -r requirements.txt

#CMD pyagent run --use-manual-proxy python ./index.py
CMD pyagent run python ./index.py
