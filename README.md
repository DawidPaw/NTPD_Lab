# Titanic Survival Prediction API

Aplikacja FastAPI do przewidywania przeżycia pasażerów Titanica.

## Wymagania
- Python 3.9+
- Docker
- Docker Compose v2
- Plik `model.pkl`

## Uruchomienie lokalnie
1. Sklonuj repozytorium: `git clone <link>`
2. Utwórz środowisko: `python -m venv venv && source venv/bin/activate`
3. Zainstaluj zależności: `pip install -r requirements.txt`
4. Uruchom: `uvicorn main:application --host 0.0.0.0 --port 8000`
5. Testuj: `curl http://localhost:8000/welcome`

## Uruchomienie za pomocą Dockera
1. Zbuduj obraz: `docker build -t titanic-api .`
2. Uruchom kontener: `docker run -d -p 8000:8000 --name titanic-container titanic-api`
3. Testuj: `curl http://localhost:8000/welcome`

## Uruchomienie za pomocą Docker Compose
1. Uruchom: `docker compose up -d`
2. Testuj: `curl http://localhost:8000/welcome`
3. Zatrzymaj: `docker compose down`

## Konfiguracja parametrów
- **Zmienne środowiskowe**:
  - `ENV`: `production`
  - `MODEL_PATH`: `/app/model.pkl`
- **Zasoby**:
  - `titanic-api`: 2 GB RAM, 1 CPU, port 8000
  - `redis`: 512 MB RAM, port 6379
- **Wymagania**: `model.pkl` zgodny z `scikit-learn==1.5.2`

## Testowanie
```bash
curl -X POST http://localhost:8000/classify \
-H "Content-Type: application/json" \
-d '{"pclass":1,"sex":0,"age":30.0,"fare":50.0,"family_size":2,"embarked_Q":0,"embarked_S":1}'
