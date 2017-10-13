# Aiuda PR Api

This is the Graph QL API for AiudaPR.
AiudaPR is a web application for the
notification of help and utility spots.
Find more about AiudaPR [here](https://github.com/makobi/aiudapr)

# Before Setup

- Install Elixir with: `brew install elixir`
- Install PGSQL with: `brew install postgresql`

# Setup

- `mix deps.get`
- `make init-psql`
- `make start-psql`
- `make prepare # if this fails continue to the next step`
- `make setup-psql`
- `make migrate`
- `make server`

# Graph QL Spec

### All Spots

```graphql
spots {
  spots {
    id
    kind
    lat
    lon
  }
}
```

### Create Spot

```graphql
mutation CreateSpot {
  spot(kind: Enum<WIFI, COMIDA, OASIS, ELECTRICIDAD, REFUGIO>, lat: <float>, lon: <float>) {
    id
    kind
    lat
    lon
  }
}
```

### Delete Spot

```graphql
mutation DeleteSpot {
  spotForDeletion(id: <id>)
}
```

### RegisterLocation

```graphql
mutation CreateRegistration {
  registration(user: {name: <string>, phone: <string>}, location: {tag: <string>, lat: <float>, lon: <float>}) {
    tag
    lat
    lon
  }
}
```

# Contributing

1. Fork it ( https://github.com/[my-github-username]/aiudapr_api/fork )
2. Create your feature branch (git checkout -b feature/my_new_feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
