# SF Restaurants API

This is a Ruby on Rails API project that allows you to manage San Francisco restaurants, their inspections, and code violations. The project is built using SQLite for simplicity, and it includes a CSV import process to load data into the database.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Getting Started](#getting-started)
   - [Clone the Repository](#clone-the-repository)
   - [Install Dependencies](#install-dependencies)
3. [Database Setup](#database-setup)
   - [Migrations](#migrations)
   - [Seeding Data from CSV](#seeding-data-from-csv)
4. [Running the Server](#running-the-server)
5. [API Endpoints](#api-endpoints)
   - [Restaurants](#restaurants)
   - [Inspections](#inspections)
   - [Violations](#violations)
6. [Running Tests](#running-tests)

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- Ruby (version 3.x or above)
- Bundler (`gem install bundler`)
- Rails (`gem install rails`)
- Git

No external database is required as we are using SQLite for simplicity.

## Getting Started

### Clone the Repository

1. Clone the project from GitHub:
   ```
   git clone https://github.com/LelandWarren/sf_restaurants.git
   cd sf_restaurants
   ```

### Install Dependencies

2. Install all the required gems and dependencies:
   ```
   bundle install
   ```

## Database Setup

### Migrations

3. Create the SQLite database and run the migrations to set up the schema:

   ```
   rails db:create
   rails db:migrate
   ```

   This will create three tables:
   - `restaurants`: Stores restaurant details (name, address, phone number, etc.)
   - `inspections`: Stores inspection details for each restaurant (score, date, type)
   - `violations`: Stores code violations for each inspection (violation date, type, risk category, description)

### Seeding Data from CSV

4. Import data from the CSV file. Place your CSV file named `sf_restaurants.csv` in the `lib` directory of your project and then run:

   ```
   rake import:restaurants
   ```

## Running the Server

5. Start the Rails server to begin interacting with the API:

   ```
   rails server
   ```

   The server will be available at `http://localhost:3000`.

## API Endpoints

### Restaurants

- `GET /restaurants`: List all restaurants
- `GET /restaurants/:id`: Show a specific restaurant

### Inspections

- `GET /restaurants/:restaurant_id/inspections`: List inspections for a restaurant
- `GET /restaurants/:restaurant_id/inspections/:id`: Show a specific inspection

### Violations

- `GET /restaurants/:restaurant_id/inspections/:inspection_id/violations`: List violations for a specific inspection
- `GET /restaurants/:restaurant_id/inspections/:inspection_id/violations/:id`: Show a specific violation
- `POST /restaurants/:restaurant_id/inspections/:inspection_id/violations`: Create a new violation for a specific inspection

