FROM python:3.7-buster

# Install dependencies
RUN apt update && apt install -y \
    curl git wget unzip \
    && apt clean

# Copy local files into the container
COPY . /opt/DeepExploit

# Set working directory
WORKDIR /opt/DeepExploit

# Install Python dependencies
RUN pip install --no-cache-dir \
    numpy==1.16.6 \
    scikit-learn==0.20.0 \
    joblib==0.13.2 \
    requests \
    bs4 \
    msgpack \
    pandas \
    tensorflow==1.15.0

# Run DeepExploit
CMD ["python3", "/opt/DeepExploit/DeepExploit.py"]

docker build -t deepexploit .
docker run -it --rm --network host deepexploit

