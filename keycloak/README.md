# Keycloak Helm Chart

Production-friendly Keycloak chart with two database modes:

- `external`: use AWS RDS, Azure Database for PostgreSQL, Cloud SQL, etc.
- `embedded`: deploy PostgreSQL inside Kubernetes for dev/test.

## External DB install

Create DB password secret:

```bash
kubectl create secret generic keycloak-db-secret \
  --from-literal=password='your-db-password'
```

Install:

```bash
helm upgrade --install keycloak ./keycloak-chart \
  --set database.mode=external \
  --set database.external.host='my-rds-or-azure-postgres.example.com' \
  --set database.external.name='keycloak' \
  --set database.external.username='keycloak' \
  --set database.external.existingSecret='keycloak-db-secret' \
  --set keycloak.hostname='keycloak.example.com'
```

## Embedded Postgres install

```bash
helm upgrade --install keycloak ./keycloak-chart \
  --set database.mode=embedded \
  --set keycloak.hostname='keycloak.local'
```

## Lint

```bash
helm lint ./keycloak-chart
helm template keycloak ./keycloak-chart
```
