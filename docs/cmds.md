## Comando no terminal para verificar os Courses
```cmd
python manage.py dumpdata courses --indent=2
[
{
  "model": "courses.subject",
  "pk": 1,
  "fields": {
    "title": "Matematica",
    "slug": "matematica"
  }
},
{
  "model": "courses.subject",
  "pk": 2,
  "fields": {
    "title": "Music",
    "slug": "music"
  }
},
{
  "model": "courses.subject",
  "pk": 3,
  "fields": {
    "title": "Fisica",
    "slug": "fisica"
  }
},
{
  "model": "courses.subject",
  "pk": 4,
  "fields": {
    "title": "Programação",
    "slug": "programacao"
  }
}
]
```



## para fazer dump para um fixture file
```cmd
❯ python manage.py dumpdata courses --indent=2 --output=educa/courses/fixtures/subjects.json
[...........................................................................]
```

## para carregar o database de um arquivo dump 
```cmd
❯ python manage.py loaddata subjects.json
Installed 4 object(s) from 1 fixture(s)
```

## como usar o python shell
```cmd
❯ python manage.py shell
Python 3.11.0 (main, Dec  8 2022, 08:41:16) [GCC 9.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> rom django.contrib.auth.models import User
  File "<console>", line 1
    rom django.contrib.auth.models import User
        ^^^^^^
SyntaxError: invalid syntax
>>> from django.contrib.auth.models import User
>>> from courses.models import Subject, Course, Module
Traceback (most recent call last):
  File "<console>", line 1, in <module>
ModuleNotFoundError: No module named 'courses'
>>> from educa.courses.models import Subject, Course, Module
>>> user = User.objects.last()
>>> subject = Subject.objects.last()
>>> c1 = Course.objects.create(subject=subject, owner=user, title='Course 1', slug='course1')
>>> m1 = Module.objects.create(course=c1, title='Module 1')
>>> m1.order
0
>>> m2 = Module.objects.create(course=c1, title='Module 2')
>>> m2.order
1
>>> m3 = Module.objects.create(course=c1, title='Module 3', order=5)
>>> m3.order
5
>>> m4 = Module.objects.create(course=c1, title='Module 4')
>>> m4.order
6
>>> c2 = Course.objects.create(subject=subject, title='Course 2', slug='course2', owner=user)
>>> m5 = Module.objects.create(course=c2, title='Module 1')
>>> m5.order
0
``` 

## outro exemplo com manage shell
```cmd
~/Proj_2024/e-learning is 📦 v0.1.0 via 🐍 v3.11.0 (e-learning-py3.11) 
❯ mng shell
Python 3.11.0 (main, Dec  8 2022, 08:41:16) [GCC 9.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from courses.models import Module
Traceback (most recent call last):
  File "<console>", line 1, in <module>
ModuleNotFoundError: No module named 'courses'
>>> from educa.courses.models import Module
>>> Module.objects.latest('id').id
1
```

## Anexar no docker-compose file

na database
healthcheck:

      test:

        [

          "CMD-SHELL",

          "pg_isready -d $POSTGRES_DB -U $POSTGRES_USER"

        ]

      interval: 10s

      timeout: 5s

      retries: 5


Na app (aplicação web)
depends_on:
      postgres:

        condition: service_healthy