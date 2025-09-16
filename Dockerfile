FROM python:3.8-slim-buster

# Use archived Debian Buster repositories
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/deb-src/d' /etc/apt/sources.list \
    && apt update \
    && apt install -y git \
    && apt clean

# Copy requirements and install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /PiroAutoFilterBot

# Copy project files
COPY . .

# Run the bot
CMD ["python3", "bot.py"]
