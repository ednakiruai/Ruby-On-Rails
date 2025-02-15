# README

Book Lending Library
A simple Ruby on Rails 8 application for managing a book lending library. Users can add books, track their lending history, and record when a book is borrowed and returned.

Features
Add, view, update, and delete books.
Borrow books by entering a borrower's name.
Track book lending history.
Return books and mark them as returned.
View borrowing history of a specific borrower.
Prerequisites

Ensure you have the following installed:
Ruby 3.2.2 (or later)
Rails 8
SQLite (default database for Rails)
Installation

Clone this repository:
git clone https://github.com/ednakiruai/Ruby-On-Rails
cd book_lending_library

Install dependencies:
bundle install

Set up the database:
rails db:create db:migrate
Running the Application

Start the Rails server:
rails server
Then visit http://localhost:3000 in your browser.

Running Tests
This application includes basic tests. To run them:

rails test
API Endpoints (if applicable)
GET /books - List all books
GET /books/:id - View a specific book
POST /books - Create a new book
PATCH /books/:id - Update a book
DELETE /books/:id - Delete a book
POST /books/:book_id/borrowings - Borrow a book
PATCH /borrowings/:id/return - Return a borrowed book
