# Use an official Python runtime as a base image
FROM python:3.11.11

# Set the working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files (including auth_service.py, auth.db, etc.)
COPY . .

# Expose the port your app runs on (5001 in your runner script)
EXPOSE 5001

# Command to run the application
CMD ["uvicorn", "auth_service:app", "--host", "0.0.0.0", "--port", "5001"]