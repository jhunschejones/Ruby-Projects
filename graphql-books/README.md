# GraphQL Books

## Overview
This is a small Rails + GraphQL API I built following a couple tutorials as a way to feel out how these two powerful web development tools work together.

## Running The App
1. `rails db:create db:migrate db:seed && rails s`
2. Navigate to: `http://localhost:3000/graphiql`
3. Query data:
```
query {
  users {
    name
    email
    booksCount
    books {
      title
      author
      publishedYear
    }
  }
}
```
4. Create data:
```
mutation {
  createUser(input: {
    name: "Carl Fox",
    email: "carl@dafox.com"
  }) {
    user {
      id
      name
      email
    }
    errors
  }
}
```
