# BETYdb/PostGIS

Dockerfile and associated scripts for the [BETYdb](https://www.betydb.org/) PostGIS datbase for use with the [Analysis Workbench](https://www.terraref.ndslabs.org).

This image will download and import the latest BETYdb data from the TERRA-REF system during startup.

## Local installation:

```sh
docker run --name betydb -p 5432:5432 terraref/bety-postgis
```

Now it will appear that you have the entire trait database running on the standard PostgreSQL port 5432 as if it were running locally.
