REM Build the Docker-Angular-Builder and executes the Builder with the current directory

docker build -t angular_builder:latest .
docker run -v %cd%:/srv/workdir --rm -i -t angular_builder
