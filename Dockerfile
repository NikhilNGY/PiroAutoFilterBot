FROM python:3.10-slim-bookworm

# Install git and system dependencies
RUN apt update && apt install -y git && apt clean

# Copy requirements and install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /PiroAutoFilterBot

# Copy project files
COPY . .

# Run the bot
CMD ["python3", "bot.py"]
