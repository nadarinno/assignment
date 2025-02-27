
import 'dart:io';


Map<String, Map<String, dynamic>> books = {
  "1984": {"author": "George Orwell", "year": 1949, "genre": "Dystopian"},
  "To Kill a Mockingbird": {"author": "Harper Lee", "year": 1960, "genre": "Fiction"},
  "The Great Gatsby": {"author": "F. Scott Fitzgerald", "year": 1925, "genre": "Classic"},
  "Harry Potter": {"author": "J.K. Rowling", "year": 1997, "genre": "Fantasy"}
};

//add book
void addBook() {
  stdout.write("Enter book title: ");
  String title = stdin.readLineSync()?.trim() ?? "";

  stdout.write("Enter author (default: Unknown): ");
  String author = stdin.readLineSync()?.trim() ?? "Unknown";
  if (author.isEmpty) author = "Unknown";

  stdout.write("Enter year: ");
  String yearInput = stdin.readLineSync()?.trim() ?? "----";
  int year = int.tryParse(yearInput) ?? 0;

  stdout.write("Enter genre (default: General): ");
  String genre = stdin.readLineSync()?.trim() ?? "General";
  if (genre.isEmpty) genre = "General";

  books[title] = {
    "author": author,
    "year": year,
    "genre": genre,
  };

  print("\nBook '$title' added successfully!\n");
}

// book info
void getBookInfo() {
  stdout.write("Enter book title: ");
  String title = stdin.readLineSync()?.trim() ?? "";

  if (books.containsKey(title)) {
    var book = books[title]!;
    print("\nBook Information:");
    print("Title: $title");
    print("Author: ${book["author"]}");
    print("Year: ${book["year"]}");
    print("Genre: ${book["genre"]}\n");
  } else {
    print("\nBook not found.\n");
  }
}

//list all books
void listAllBooks() {
  if (books.isEmpty) {
    print("No books in the library.\n");
    return;
  }
  print("\nLibrary Books:");
  books.forEach((title, details) {
    print("Title: $title, Author: ${details["author"]}, Year: ${details["year"]}, Genre: ${details["genre"]}");
  });
  print("");
}

//list books by genre
void listBooksByGenre() {
  stdout.write("Enter genre: ");
  String genre = stdin.readLineSync()?.trim() ?? "";

  List<String> booksInGenre = books.entries
      .where((entry) => entry.value["genre"].toLowerCase() == genre.toLowerCase())
      .map((entry) => entry.key)
      .toList();

  if (booksInGenre.isNotEmpty) {
    print("\nBooks in genre '$genre': ${booksInGenre.join(", ")}\n");
  } else {
    print("\nNo books found for this genre.\n");
  }
}

//remove a book
void removeBook() {
  stdout.write("Enter book title to remove: ");
  String title = stdin.readLineSync()?.trim() ?? "";

  if (books.containsKey(title)) {
    books.remove(title);
    print("\nBook '$title' removed successfully!\n");
  } else {
    print("\nBook not found.\n");
  }
}
void main() {
  bool running = true;

  while (running) {
    print("\nLibrary Management System:");
    print("1. Add Book");
    print("2. Get Book Info");
    print("3. List All Books");
    print("4. List Books by Genre");
    print("5. Remove Book");
    print("6. Exit");
    stdout.write("Choose an option: ");
    String choice = stdin.readLineSync()?.trim() ?? "";

    switch (choice) {
      case '1':
        addBook();
        break;
      case '2':
        getBookInfo();
        break;
      case '3':
        listAllBooks();
        break;
      case '4':
        listBooksByGenre();
        break;
      case '5':
        removeBook();
        break;
      case '6':
        print("\nExiting program. Goodbye!");
        running = false;
        break;
      default:
        print("\nInvalid option. Please try again.\n");
    }
  }
}
