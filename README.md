# Postman & Newman – API Test Automation (Class Project)

Automated API tests for [JSONPlaceholder](https://jsonplaceholder.typicode.com) written in Postman and run with Newman.

## Test cases

| ID | Method | Endpoint | Checks | Expected |
|----|--------|----------|--------|----------|
| TC1 | GET | `/posts` | Status code, Content-Type, body type | `200 OK`, `application/json`, array of post objects |
| TC2 | POST | `/posts/1` | Status code, response time | `404 Not Found`, response time < 80 ms |

## Project structure

```
collections/   FutureSkill_ClassProject.postman_collection.json
environments/  JSONPlaceholder.postman_environment.json
run_newman.bat Windows script to run the collection with an HTML report
```

## Run

```bash
npm install -g newman newman-reporter-htmlextra
newman run collections/FutureSkill_ClassProject.postman_collection.json \
  -e environments/JSONPlaceholder.postman_environment.json \
  -r cli,htmlextra --reporter-htmlextra-export reports/report.html
```

On Windows just double-click `run_newman.bat`.

## Latest result (Postman Collection Runner)

| Test | Result |
|------|--------|
| TC1-1 Status code is 200 OK | PASS |
| TC1-2 Content-Type is application/json | PASS |
| TC1-3 Response body type is an array of post objects | PASS |
| TC2-1 Status code is 404 Not Found | PASS |
| TC2-2 Response time is less than 80ms | FAIL (375 ms) |

TC2-2 fails because the request goes from Postman's cloud agent to the public API, so the round trip alone is well over 80 ms. The assertion does its job: it flags a response that is slower than the requirement.
