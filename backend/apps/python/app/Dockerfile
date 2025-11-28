FROM python

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN pip list

# Copy rest of files
COPY . .

# Start app when container starts
CMD ["python", "-m", "src"]
