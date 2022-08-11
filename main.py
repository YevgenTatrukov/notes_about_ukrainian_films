import sqlite3

if __name__ == "__main__":

    with sqlite3.connect('database.db') as db:
        cursor = db.cursor()

        # query = """ CREATE TABLE IF NOT EXISTS movies (
        # id INTEGER PRIMARY KEY,
        # film_name TEXT,
        # note TEXT,
        # rating REAL) """
        # cursor.execute(query)

        # query1 = """ INSERT INTO movies (film_name, note, rating)
        #     VALUES('Кіборги',
        #     'Історія про захист Донецького аеропорту',
        #     5
        #     )"""
        #
        # query2 = """ INSERT INTO movies (film_name, note, rating)
        #     VALUES('Захар беркут',
        #     'екранізація однойменної історичної повісті «Захар Беркут»',
        #     4.5
        #     )"""
        #
        # query3 = """ INSERT INTO movies (film_name, note, rating)
        #     VALUES('Мавка Лісова пісня',
        #     'український ЗD-мультфільм за мотивами драми-феєрії Лесі Українки «Лісова пісня»',
        #     4
        #     )"""
        # cursor.execute(query1)
        # cursor.execute(query2)
        # cursor.execute(query3)

        cursor.execute("SELECT * FROM 'movies'")
        result = cursor.fetchall()
    # print("\nНажаль у нашому списку зараз лише 3 фільми, та ми продовжуємо працювати над сервісом"
    #       "скоро зробимо можливість додавати фільми користувачу!")
    # print('_' * 25)
    # print('Доступні фільми:')
    # for name in result:
    #     print(name[0], ':', name[1])
    print('Та наразі Вам доступно:')
    choice = int(input('\n1: Прочитати опис'
                       '\n2: Видалити опис'
                       '\n3: Змінити опис'
                       '\n4: Переглянути фільм з найбільшим рейтингом'
                       '\n5: Переглянути фільм з найменшим рейтингом'
                       '\n6: Переглянути середній рейтинг фільмів'
                       '\nЗробіть свій вибір (виберіть необхідну цифру): '))

    if choice == 1:
        movie_name = input('До якого фільму ви хочете прочитати опис? ')
        print()

        with sqlite3.connect('database.db') as db:
            cursor = db.cursor()
            notes = """
            SELECT note
            FROM 'movies'
            WHERE film_name = ?;
            """
            cursor.execute(notes, (movie_name,))
            result = cursor.fetchall()
            for note in result:
                for movie_nate in note:
                    print(movie_nate)

    if choice == 4:
        with sqlite3.connect('database.db') as db:
            cursor = db.cursor()
            cursor.execute("SELECT rating FROM 'movies'")
            result = cursor.fetchall()
            print(max(result))

    if choice == 5:
        with sqlite3.connect('database.db') as db:
            cursor = db.cursor()
            cursor.execute("SELECT rating FROM 'movies'")
            result = cursor.fetchall()
            print(min(result))

    if choice == 6:
        with sqlite3.connect('database.db') as db:
            cursor = db.cursor()
            cursor.execute("SELECT rating FROM 'movies'")
            result = cursor.fetchall()
            numb = 0
            count = len(result)
            for movie_rating in result:
                for num in movie_rating:
                    numb += num
            print(f'Середній рейтинг фільмів: {numb / count}')
