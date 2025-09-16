FROM python:3.8-slim-buster

# Install git and update system
RUN apt update && apt upgrade -y && apt install git -y

# Copy requirements and install dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r /requirements.txt

# Set working directory
WORKDIR /PiroAutoFilterBot

# Copy project files
COPY . .

# Run the bot
CMD ["python3", "bot.py"]
