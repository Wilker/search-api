# Search-API

An example API project that implements the following  features:

- TDD using RSPEC and Factory Bot
- Caching using Redis
- Docker Containerization
- Seed the application with given example date

## Case study
Company X is a large company from the educational sector with over 300k access per day. They need to improve their search engine, to permit the application to handle a large amount of requests with minimal delay to the users.
Sample data was provided and is located in the `/db/files_import` folder.


## Architectural Desing
- Models:
    - Question
    - Question Access
    - Disciplines
- Considerations: 
    - Despites only `question` and `questions access` was explicitly defined on the given sample data. Define a Discipline model helps implement a RESTful  API endpoint if need. Also, it keeps consistent the disciplines names.
___    
- Controllers:
   - Api::V1
   - Api::V1::Disciplines::HottestQuestionsController
   - Api::V1::Questions::MostlyAccessedController
 - Considerations: 
    + Api::V1 controller helps futures version upgrades of Api while still maintaining the current version deployed
    + HottestQuestionsController and MostlyAccessedController was namespaced from Disciplines and Questions. This is necessary to keep these RESTful. Example: The Question controller will be responsible only for ```create``` ```read``` ```update``` and ```delete``` actions.
____
- Quering:
    - Mostly Accessed Question complex query was moved to queries/hot_question_query.rb

___
- Caching
    - Redis was used to cache the queries. This reduces the response time to ~30ms from ~250+ms
    - Cache expiration time was set to 1 minute
    
___
- Testing
    - Rspec and FactoryBot was used to test the application


## Getting Started
 + [Prerequsites](#prerequisites)
 + [Application Features](#application-features)
 + [Setup](#running-the-application)
 + [Endpoints](#endpoints)
 
 
 
Prerequisites:
-

  - [Docker](https://docs.docker.com/get-docker/)
  - [Git](https://git-scm.com/) or [Download](https://github.com/Wilker/search-api/archive/master.zip) the source code

  
Application Features:
- 
- Hottest Questions Disciplines: Lists disciplines with whose questions was the most accessed in the last 24hrs

- Mostly Accessed by period: Lists questions mostly accessed by week/month/year

Running the Application:
- 

1. Clone the project

    ```bash
    $ git clone https://github.com/Wilker/search-api.git
    ```

2. navigate to docker folder

    ```bash
    $ cd search-api/docker
    ```
   
3. build with the Docker Compose

    ```bash
    $ docker-compose build
    ```

4. start the application

    ```
    $ docker-compose up -d 
    ```
   
5. setup the database

    ```
   $ docker-compose exec app bundle exec rake db:create
   $ docker-compose exec app bundle exec rake db:migrate
   $ docker-compose exec app bundle exec rake db:seed
   ```
   
Endpoints
-
### Disciplines with Hottest Questions

```
/api/v1/disciplines/hottest_questions
Method: GET
```
####
Response:
```
{
    "disciplines": [
        "direito constitucional",
        "português",
        "direito constitucional",
        "literatura",
        "geografia",
        "legislação federal"
    ]
}
```

### Hottest Questions

```
/api/v1/questions/mostly_accessed
Method: GET
params: year (required): integer, description: The year, example 2077.
        month:           integer, description: Month number of the Year, example 12.
        week:            integer, description: Week number of the Year, example 42.

PS: month has precendence over week, so if month and week param is passed, only month will be considered 

```
example:
```bash
curl --location --request GET 'localhost:3000/api/v1/questions/mostly_accessed?year=2019'
```
Response:
- Code: 200
```
{
    "questions": [
        [
            {
                "id": 588,
                "statement": "Ea fuga quos necessitatibus.",
                "text": "Possimus eos illo. Maiores tempore incidunt. Vitae voluptatibus odit.",
                "answer": "D",
                "discipline": "literatura"
            }
        ],
        [
            {
                "id": 2509,
                "statement": "Eius dolor explicabo soluta.",
                "text": "Doloribus quia quibusdam. Aspernatur dignissimos voluptas. Libero et optio.",
                "answer": "D",
                "discipline": "direito civil"
            }
        ],
        [
            {
                "id": 3057,
                "statement": "Architecto eum dolor beatae.",
                "text": "A sit consequatur. Doloremque quod reiciendis. Et sapiente eius.",
                "answer": "D",
                "discipline": "português"
            }
        ],
        [
            {
                "id": 4087,
                "statement": "Deserunt commodi autem iusto.",
                "text": "Id aut doloribus. Facere vitae est. Non qui placeat.",
                "answer": "A",
                "discipline": "inglês"
            }
        ],
        [
            {
                "id": 6981,
                "statement": "Quia est nesciunt quasi.",
                "text": "Accusamus sed consequatur. Saepe accusamus est. Qui repudiandae rerum.",
                "answer": "A",
                "discipline": "raciocínio lógico"
            }
        ],
        [
            {
                "id": 7272,
                "statement": "Quas neque consectetur ab.",
                "text": "Repellendus est dignissimos. Voluptas ipsum voluptatibus. Expedita debitis ad.",
                "answer": "C",
                "discipline": "geografia"
            }
        ],
        [
            {
                "id": 7465,
                "statement": "Enim eos repellat natus.",
                "text": "Maiores laboriosam quaerat. Est animi enim. Et quia vel.",
                "answer": "D",
                "discipline": "geografia"
            }
        ],
        [
            {
                "id": 7824,
                "statement": "Necessitatibus et optio sit.",
                "text": "Itaque reprehenderit voluptas. Doloribus ut dolor. Est excepturi nobis.",
                "answer": "B",
                "discipline": "direito civil"
            }
        ],
        [
            {
                "id": 7915,
                "statement": "Quos voluptas temporibus ab.",
                "text": "Nemo hic sed. Sed optio excepturi. Non consequatur eos.",
                "answer": "A",
                "discipline": "raciocínio lógico"
            }
        ],
        [
            {
                "id": 9765,
                "statement": "Illum deserunt est soluta.",
                "text": "Dolores rerum est. Voluptatem earum necessitatibus. Sunt facilis perferendis.",
                "answer": "A",
                "discipline": "geografia"
            }
        ]
    ]
}
```

Missing year param request example

```
curl --location --request GET 'localhost:3000/api/v1/questions/mostly_accessed?month=12'
```

Response:
- Code 400
```
{
    "status": 400,
    "error": "Bad Request"
}
```


## TODO
- [ ] Wrap errors with invalid params
- [ ] Add a basic token based authentication with JWT
- [ ] Refactor hot_question_query to use QueryObjects Pattern