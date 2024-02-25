# Use an official Python runtime as a parent image
FROM python:3.8-slim

ARG IMAGE=1
ARG MESSAGE

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir flask Jinja2

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV IMAGE=${IMAGE}
ENV MESSAGE=${MESSAGE}

# Run app.py when the container launches
CMD ["flask", "run"]
