# Użyj oficjalnego obrazu Pythona w wersji slim
FROM python:3.9-slim

# Ustaw katalog roboczy w kontenerze
WORKDIR /app

# Skopiuj plik requirements.txt
COPY requirements.txt .

# Zainstaluj zależności
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj resztę plików aplikacji
COPY . .

# Uruchom serwer FastAPI za pomocą Uvicorn
CMD ["uvicorn", "main:application", "--host", "0.0.0.0", "--port", "8000"]
