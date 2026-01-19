FROM apache/airflow:2.7.1-python3.9


USER root
RUN apt-get update && \
apt-get install -y --no-install-recommends \
gcc \
python3-dev \
&& apt-get clean

USER airflow

COPY requirements.txt /opt/airflow/

RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt \
--constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.7.1/constraints-3.9.txt"