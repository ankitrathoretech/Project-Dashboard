# 🚀 Project Dashboard App

A modern Rails 8 application using Stimulus.js, Tailwind CSS, Devise for authentication, and custom password encryption logic (MD5 + salt).
Includes pagination, sorting, and user login functionality via `username`.

---

## 🧰 Tech Stack

- **Ruby**: 3.4.2
- **Rails**: 8.x
- **PostgreSQL**
- **Devise**: for authentication
- **Tailwind CSS**: for UI
- **Stimulus.js**: for reactive JS behavior
- **Kaminari**: for pagination
- **MD5 + Salt**: custom password hashing logic

---

## 📦 Setup Instructions

```bash
# Clone the repo
git clone https://github.com/ankitrathoretech/Project-Dashboard.git
cd project_dashboard

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate

# Seed with sample users/projects
rails db:seed

# Start the server
bin/dev
```

# 🔐 Login Details (Sample User from Seed)

```bash
Username: user1
Password: password123
```

📋 Features

- ✅ Devise authentication via username instead of email

- ✅ Custom password encryption with MD5 + salt

- ✅ Sign up, sign in, and logout

- ✅ Stimulus-powered UI for sorting and pagination

- ✅ Tailwind styled forms

- ✅ Projects page with:

  - Username and category associations

  - Pagination (via Kaminari)

    - Sort by:

      - Recent Projects

      - Category Name

      - Username

      - Project Title

# 🛠 Development Commands

```bash
# Console access
rails console

# Run DB migrations
rails db:migrate

# Clear & seed fresh test data
rails db:drop db:create db:migrate db:seed

```

# ✅ To-Do

- Add user profile page

- Add role-based authorization

- Add API support (optional)
