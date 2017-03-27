BASE_DIR=$(cwd)
NYCBIKES_DATA="https://assets.datacamp.com/course/sql/nycbikes15.zip"

apt-get update && apt-get install -y unzip

git clone https://$GITHUB_TOKEN@github.com/datacamp/courses-intro-to-sql.git
git clone https://$GITHUB_TOKEN@github.com/datacamp/nycbikes15.git

# get data for nycbikes15
wget $NYCBIKES_DATA
unzip nycbikes15.zip -d ./nycbikes15/data

# build databases
service postgresql start \
  && sudo -u postgres createdb -O repl films \
  && sudo -u postgres createdb -O repl olympics \
  && sudo -u postgres createdb -O repl nycbikes15 \
  && cd courses-intro-to-sql \
  && sudo -u postgres psql films < data/films/films.sql \
  && sudo -u postgres psql olympics < data/olympics/code/olympics.sql \
  && cd $BASE_DIR/nycbikes15 \
  && sudo -u postgres psql nycbikes15 < sql-setup/create-db-postgres.sql \
  && service postgresql stop
