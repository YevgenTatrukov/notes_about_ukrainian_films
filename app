import csv

# movies_list = [
#     ("movies_name", "note", 'rating'),
#     ['Кіборги', 'Історія про захист Донецького аеропорту', 5],
#     ['Захар беркут', 'екранізація однойменної історичної повісті «Захар Беркут»', 4],
#     ['Мавка Лісова пісня', 'український ЗD-мультфільм за мотивами драми-феєрії Лесі Українки «Лісова пісня»', 3]
# ]
#
# with open('movies.csv', 'w') as file:
#     writer = csv.writer(file)
#     writer.writerows(movies_list)

while True:
    print('_' * 25)
    choice = int(input('\n1: Прочитати опис'
                       '\n2: Видалити опис'
                       '\n3: Додати фільм, опис та його рейтинг'
                       '\n4: Переглянути фільм з найбільшим рейтингом'
                       '\n5: Переглянути фільм з найменшим рейтингом'
                       '\n6: Переглянути середній рейтинг фільмів'
                       '\n0: Завершити роботу'
                       '\nЗробіть свій вибір (виберіть необхідну цифру): '))
    print('_' * 25)

    if choice == 0:
        print('Завершую роботу. Гарного дня!')
        break

    elif choice == 1:
        with open('movies.csv', 'r') as file:
            reader = csv.DictReader(file, delimiter=',')
            for row in reader:
                print(row['movies_name'], ':', row["note"])

    elif choice == 2:
        new_movies_list = [("movies_name", "note", 'rating')]
        with open('movies.csv', 'r') as file:
            reader = csv.DictReader(file, delimiter=',')
            movies_count = 1
            for row in reader:
                print(movies_count, ':', row['movies_name'], ':', row["note"])

                intermediate_list =[]

                intermediate_list.append(row['movies_name'])
                intermediate_list.append(row["note"])
                intermediate_list.append(row["rating"])

                movies_count += 1

                new_movies_list.append(intermediate_list)

            remove = int(input('Який фільм бажаєте видалити? (вкажіть цифру): '))
            new_movies_list.pop(remove)
        with open('movies.csv', 'w') as file:
            writer = csv.writer(file)
            writer.writerows(new_movies_list)

    elif choice == 3:
        movies = input('Введіть назву фільму: ')
        note = input('Введіть опис фільму: ')
        movie_rating = input('Введіть рейтинг фільму: ')

        with open('movies.csv', 'a') as file:
            writer = csv.writer(file)
            writer.writerow(
                [movies, note, movie_rating]
            )

    elif choice == 4:
        with open('movies.csv', 'r') as file:
            reader = csv.DictReader(file, delimiter=',')
            max_rating = []
            for row in reader:
                rating = int(row['rating'])
                max_rating.append(rating)
            print(f'Фільм з найбільшим рейтингом: {max(max_rating)}')

    elif choice == 5:
        with open('movies.csv', 'r') as file:
            reader = csv.DictReader(file, delimiter=',')
            max_rating = []
            for row in reader:
                rating = int(row['rating'])
                max_rating.append(rating)
            print(f'Фільм з найменшим рейтингом: {min(max_rating)}')

    elif choice == 6:
        with open('movies.csv', 'r') as file:
            reader = csv.DictReader(file, delimiter=',')
            among = 0
            count = 0
            for row in reader:
                rating = int(row['rating'])
                among += rating
                count += 1
            print(f'Середній рейтинг фільмів: {among / count}')
