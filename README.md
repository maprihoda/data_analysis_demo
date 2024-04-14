## Data Analysis Demo Project

This project is designed to showcase a wide array of dbt (data build tool) features using the classic Northwind 
sample database as its foundation. The goal is to provide a comprehensive example that illustrates best practices, 
advanced configurations, and the powerful capabilities of dbt for data transformation and analytics.

### Setup

```
git clone https://github.com/maprihoda/data_analysis_demo.git
cd data_analysis_demo
```

#### Create the database
```
psql postgres
CREATE DATABASE data_analysis_demo;
exit
```

#### Create and populate the dl_northwind schema
```
psql -U your_username -d data_analysis_demo
CREATE SCHEMA dl_northwind;
SET search_path TO dl_northwind;
\i northwind.sql
exit
```

#### Copy and update the .env file
```
cp .env-example .env
open .env

```
After opening the `.env` file, update it by filling in your database username and password. Then, source it:

```
source .env
```


#### Create the virtual environment

For installing Python and managing its versions, I highly recommend [pyenv](https://github.com/pyenv/pyenv). 

After installing a Python version, e.g., 3.12.2, install pyenv's plugin [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv). 

```
brew install pyenv-virtualenv
```

Using pyenv-virtualenv, create the virtual environment for this project:

```
pyenv virtualenv 3.12.2 data_analysis_demo
cd ..
cd data_analysis_demo
pip install pip wheel setuptools --upgrade
```

Since we specify the virtual environment (`data_analysis_demo`) in the `.python-version` file, 
the virtual environment will be automatically activated every time we enter the project root directory.

### Install and set up dbt:
```
pip install dbt-postgres
dbt debug
```

Complete the setup and verify that it works:
```
dbt deps
dbt seed
dbt run
dbt test
```

Generate and view the documentation:
```
dbt docs generate
dbt docs serve
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
